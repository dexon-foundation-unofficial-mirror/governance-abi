#!/bin/bash -f

rm -rf ci/wiki.wiki

set -e

cd ci
eval $(ssh-agent -s)
ssh-add wiki_deploy_key
git clone --depth=1 git@github.com:dexon-foundation/wiki.wiki.git

newABI=`cat ../build/contracts/Governance.json | jq -r '.abi'`

abi=false

rm -rf wiki.md
touch wiki.md

while IFE= read -r line; do
	if [[ $line == *"ABI AUTOGEN START"* ]]; then
		abi=true
		printf "<!-- [[ABI AUTOGEN START]] -->\n\`\`\`\n${newABI}\n\`\`\`\n<!-- [[ABI AUTOGEN START]] -->\n" >> wiki.md
	fi
	if [[ $abi == true && $line == *"ABI AUTOGEN END"* ]]; then
		abi=false
	fi
	if [[ $abi == false ]] ; then
  	echo $line >> wiki.md
	fi
done < wiki.wiki/Governance-Contract-Interface.md

mv -f wiki.md wiki.wiki/Governance-Contract-Interface.md

cd wiki.wiki

git config user.email "TravisCI@dexon.org"
git config user.name "Travis CI"
git commit -am "Update Governance-Contract-Interface"
git push
