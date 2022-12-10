// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Counter {
    // variable
    uint count;
 
    // function to increase count variable by 1
    function increase() public  {
        count = count + 1;
        // count += 1;
    }
 
    // function to decrease count variable by 1
    function decrease() public  {
        count = count - 1;
        // count -= 1;
    }
 
    // function to get the count value
    function getCount() public view returns(uint){
        return count;
    }
}