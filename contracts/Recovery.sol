pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Recovery is Ownable {
    uint256 public depositValue;

    mapping(uint256 => address[]) public votes;
    mapping(uint256 => mapping(address => bool)) public voted;

    event VotedForRecovery(uint256 indexed height, address voter);

    function setDeposit(uint256 DepositValue) public onlyOwner {
        depositValue = DepositValue;
    }

    function withdraw() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }

    function voteForSkipBlock(uint256 height) public payable {
        require(msg.value >= depositValue);
        require(!voted[height][msg.sender]);

        votes[height].push(msg.sender);
        voted[height][msg.sender] = true;

        emit VotedForRecovery(height, msg.sender);
    }

    function numVotes(uint256 height) public returns (uint256) {
        return votes[height].length;
    }
}
