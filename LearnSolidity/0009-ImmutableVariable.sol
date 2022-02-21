// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

constant immutableVariable {
  address public immutable myAddress;
  uint public immutable noOfBlockticalFollowers;

  constructor(uint _noOBF){
    myAddress = msg.sender;
    noOfBlockticalFollowers = _noOBF;
  }
}
