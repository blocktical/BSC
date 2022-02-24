// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract mappingContract {
  // normal mapping
  mapping (address => bool) public activeAccount;
  
  function setAccountStatus(address _address, bool _flag) public {
    activeAccount[_address] = _flag;
  }
  
  function getAccountStatus(address _address) public view returns (bool) {
    return activeAccount[_address];
  }
  
  // nested mapping
  mapping (address => mapping(address => uint) donation;
  
  function setDonation(address _donationTo, uint _tokens) public {
    donation[msg.sender][_donationTo] += _tokens;
  }
  
  function getDonationAmount(address _account) public view returns (uint) {
    return donation[msg.sender][_account];
  }
  
}
//        remember
//  mapping is a key : value pair
// keyType = {uint, adress, byte}
// valueType = any type + mapping + array
