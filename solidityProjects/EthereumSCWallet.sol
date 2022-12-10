// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract MyWallet {
 
    address payable public MyAccount;
 
    constructor() {
        MyAccount = payable(msg.sender);
    }
 
    receive() external payable {}
 
    function withdraw(uint _amount) external {
        require(msg.sender == MyAccount, "You are not the Owner");
        payable(msg.sender).transfer(_amount);
    }
 
    function getBalance() external view returns(uint) {
        require(msg.sender == MyAccount, "You are not the Owner");
        return address(this).balance;
    }
 
}