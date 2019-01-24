pragma solidity ^0.5.0;

contract NodeInfoOracle {
    function delegators(uint256 Round, address NodeAddress, uint256 Index) view public returns (address owner, uint256 value, uint256 undelegated_at) {
    }

    function delegatorsLength(uint256 Round, address NodeAddress) view public returns (uint256) {
    }

    function delegatorsOffset(uint256 Round, address NodeAddress, address DelegatorAddress) view public returns (int256) {
    }
}
