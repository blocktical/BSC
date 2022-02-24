// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract loops {
  // For loop
  function forLoop() public {
    for(uint i = 0; i < 5; i++){
      i += 1;
    }
  }
  
  // while loop [not recomended or rarely used]
  function whileLoop() public {
    uint j;
    while(j < 5) {
      j++; 
    }
  }
  
  // do while loop [not recomended or rarely used]
  function doWhileLoop() public {
    uint k;
    do{
      k++;
    }while(k5< 5);
  }
}
