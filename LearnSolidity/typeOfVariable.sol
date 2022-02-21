// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract typeOfVariable {

  // There are 3 types of variables in solidity
  //  1. state variable
  string public text = "Hello";
  uint public num = 111;
  
  //  2. local variable
  function doSomething() public {
    uint i = 456;
  }
  //  3. global variable
  uint timestamp = block.timestamp; // previously now
  
}
