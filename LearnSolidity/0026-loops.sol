// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Loops {
    uint public i = 0;
    uint sum = 0;
    function loop_for() public returns(uint){
        for (uint a = 0; a < i; a++){
            sum = sum + a;
        }
        return sum;
    }
 
    function loop_while() public returns(uint) {
        while (i <= 5){
            i +=1;
        }
        return i;
    }
}