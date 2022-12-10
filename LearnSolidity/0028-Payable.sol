// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Payable {
    // Payable address can receive Ether
    address payable public owner;
 
    constructor() payable {
        owner = payable(msg.sender);
    }
 
    // function to deposit ether into the contract
    function deposit() public payable{}
 
    function notPayable() public {}
 
    // withdraw ether from contract
    function withdraw() public{
        uint amount = address(this).balance; // amount stored in smart contract
        // send all etheres from smart contract to owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }
 
    // transfer ethers from the contract to given address
    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}