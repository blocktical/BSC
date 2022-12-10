// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract Fallback {
    event Log(string func, uint gas);
 
    // fallback function
    fallback() external payable {
        // write the log
        emit Log("fallback", gasleft());
    }
 
    receive() external payable {
       // write the log
       emit Log("receive", gasleft());
    }
 
    // will get the balance of smart contract
    function getBalance() public returns (uint){
        emit Log("getBalanceOfSmartContract", gasleft());
        return address(this).balance;
    }
 
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }
 
    function callFallback(address payable _to) public payable {
        ( bool result, ) = _to.call{ value : msg.value, gas : 5000 }("");
        require(result, "Failed to send Ether");
    }
}