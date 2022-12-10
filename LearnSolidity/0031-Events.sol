// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Counter {
    // variable
    uint count;
 
    // event
    event FunctionProcesses(string nameOfFunction);
 
    // function to increase count variable by 1
    function increase() public  {
        count = count + 1;
        emit FunctionProcesses("increase");
        // count += 1;
    }
 
    // function to decrease count variable by 1
    function decrease() public  {
        increase();
        count = count - 1;
        emit FunctionProcesses("decrease");
        // count -= 1;
    }
 
    // function to get the count value
    function getCount() public returns(uint){
        emit FunctionProcesses("getCount");
        return count;
    }
}