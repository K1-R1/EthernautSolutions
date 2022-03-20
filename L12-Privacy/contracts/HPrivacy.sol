// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract HPrivacy {
    function castBytes(bytes32 _data) public pure returns (bytes16) {
        return bytes16(_data);
    }
}
