// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract intPDT {
  // uint for unsigned integet value
  uint8 u8 = 1;
  uint u = 111; // default size is 256 
  
  // int for signed integer value
  int8 i8 = -1;
  int i = 111;  // default size is 256
  
  // maximun and minimum of integer
  int maxInt = type(int).max;
  int minInt = type(int).min;
  
}
