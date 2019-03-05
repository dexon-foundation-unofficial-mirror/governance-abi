pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Recovery is Ownable {
    uint256 depositValue;

    event VotedForRecovery(uint256 indexed height, address voter);

    function setDeposit(uint256 DepositValue) public onlyOwner {
        depositValue = DepositValue;
    }

    function withdraw(address payable destination) public onlyOwner {
        destination.send(address(this).balance);
    }

    function voteForSkipBlock(uint256 height) public payable {
        require(msg.value >= depositValue);
        emit VotedForRecovery(height, msg.sender);
    }
}
