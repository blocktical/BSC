// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Array {
  uint[] public arr;
  
  // return index of an array
  function getArrayIndex(uint i) public view returns (uint) {
    return arr[i];
  }
  
  // return entire array
  function getArray() public view returns (uint[] memory) {
    return arr;
  }
  
  // get length of an array
  function getLength() public view returns (uint) {
    return arr.length;
  }
  
  // push function OR append to an array
  function push(uint i) public {
    arr.push(i);
  }
  
  // pop function OR remove from end of array
  function pop() public {
    arr.pop();
  }
  
  // delete item from an array from an index
  function delete(uint i) public {
    delete arr[i];
  }
  
}
