pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Recovery is Ownable {
    uint256 public depositValue;

    mapping(uint256 => address[]) public votes;
    mapping(uint256 => mapping(address => bool)) public voted;
    mapping(address => uint256) public withdrawable;

    event VotedForRecovery(uint256 indexed height, address voter);
    event Withdrawn(address indexed owner, uint256 amount);

    function setDeposit(uint256 DepositValue) public onlyOwner {
        depositValue = DepositValue;
    }

    function refund(uint256 height, uint256 value) public onlyOwner {
        for (uint i = 0; i < votes[height].length; i++) {
            withdrawable[votes[height][i]] += value;
        }
    }

    function withdraw() public {
        require(withdrawable[msg.sender] > 0);

        uint256 amount = withdrawable[msg.sender];
        withdrawable[msg.sender] = 0;
        msg.sender.transfer(amount);

        emit Withdrawn(msg.sender, amount);
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
