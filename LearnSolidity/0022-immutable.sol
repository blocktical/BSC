// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Immu {
    // Who Deployed the contract
    address public immutable DEPLOYER;
    address public worker;
 
    constructor(){
        DEPLOYER = msg.sender;
    }
 
    function getDeployer() public view returns(address){
        return DEPLOYER;
    }
 
    function getWorker() public returns(address){
        worker = msg.sender;
        return worker;
    }
}
 