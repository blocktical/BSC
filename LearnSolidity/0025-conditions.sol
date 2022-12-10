// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Conditions {
    uint public age = 0;
    function conditionAction() public returns(string memory result){
        age += 1;
        if (age <= 5){
            return "Hi I am a Child";
        } else if (age > 5 && age <= 18){
            return "I am a Student";
        } else {
            return "I am an adult";
        }
    }
 
    function isEqual(uint _x, uint _y) public pure returns (bool){
        // if(_x == _y){
        //     return true;
        // } else {
        //     return false;
        // }
        return _x == _y ? true : false; // ternary operator
        // condition ? satisfy result : not satisfy result;
    }
}