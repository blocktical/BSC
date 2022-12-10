// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
// gas spent * gas price = transaction fee (ether/wei)
 
    // gas = uint of computation
    // gas spent
    // gas price
 
contract Gas {
    uint public i = 0;
    function forever() public {
        while (true){
            i +=1;
        }
    }
}
