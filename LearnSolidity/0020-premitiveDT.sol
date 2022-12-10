// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;

// premitive data types
contract pdt {
    // variable of type boolean
    bool public voteStarted = true;
    bool public voteNotStarted = false;
 
    uint public p1Votes = 456;
    uint16 public p2Votes = 120;
 
    int8 public p2Wins = -1;
 
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
 
    address public councellor = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
 
    bytes1 a = 0xb5; // 1011 = b 0101 =5
    bytes1 b = 0xab; // 1010 = a 1011 = b
 
    //default values
    bool public myBoolVar; //false
    uint public myUintVar; // 0
    int public myIntVar; //0
    address public myDefAdd; // 00000000
 
    address public myaddress = address(0);
}