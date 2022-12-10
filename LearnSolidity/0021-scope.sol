// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
// local
    //declare inside the function
    // not stored in blockchain
// state
    // declare outside a function
    // stored on the blockchain
// global
    // provides info ablut the blockchain
 
contract ScopeVar {
    // state variable
    string public constant hw = "hello World!";
    uint public myNumber = 123;
 
    function myFunction() public view returns (uint){
        //local variable
        uint localnumber = 111;
        return myNumber + localnumber;
    }
 
    function globalData() public view returns (address){
        return msg.sender;
    }
 
    function changemyNumber() public {
        myNumber = 0;
    }
}