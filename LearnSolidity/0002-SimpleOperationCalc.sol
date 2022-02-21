// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SimpleOperationCalc {
  // add
  function add(int256 a, int256 b) pure return(int256){
    return a + b;
  }
  
  // subtract
  function subtract(int256 a, int256 b) pure return(int256){
    return a - b;
  }
}
