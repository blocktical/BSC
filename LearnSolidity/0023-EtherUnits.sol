// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract EtherUnits {
    uint public oneWei = 1 wei;
    // compare is 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1 ;
 
    uint public oneEther = 1 ether;
    // compare is 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
}
 
