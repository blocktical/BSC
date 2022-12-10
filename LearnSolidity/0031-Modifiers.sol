// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Counter {
    address public owner;
 
    constructor() {
        owner = msg.sender;
    }
 
    // myown modifier
    modifier postProcessModifier(){
        _;
        require(msg.sender == owner, "Not Allowed");
    }
 
    modifier preProcessModifier(){
        require(msg.sender == owner, "Not Allowed");
        _;
    }
 
    modifier betweenProcessModifier(){
        require(msg.sender == owner, "Not Allowed");
        _;
        require(msg.sender == owner, "Not Allowed");
    }
 
    // variable
    uint count;
    // function to increase count variable by 1
    function increase() public preProcessModifier {
        count = count + 1;
        // count += 1;
    }
 
    // function to decrease count variable by 1
    function decrease() public postProcessModifier {
        increase();
        count = count - 1;
        // count -= 1;
    }
 
    // function to get the count value
    function getCount() public view returns(uint){
        return count;
    }
}