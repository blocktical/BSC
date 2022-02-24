// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract IfElse {
  function ifElse(uint num) public returns (string memory) {
    if ( num % 2 == 0 ){
      return "Even number";
    }else{
      return "Odd number";
    }
  }
}
