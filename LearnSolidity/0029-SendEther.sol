// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
contract SendingEther {
 
    // transfer <- fallback function need to be defined or else the transfer will throw an error.
        // RECEIVE() || FALLBACK()
    // send <-it returns the status as a boolean (true/false)
    // call <- recommended <> empty argument <> fallback function
 
    // function to recive Ether. { msg.data must be empty }
    receive() external payable {}
 
    // fallback function { msg.data is not empty }
    fallback() external payable {}
 
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
 
    function deposit() public payable {
    }
 
    function sendViaTransfer(address payable _to) public payable {
        // no longer recommended
        _to.transfer(msg.value);
    }
 
    function sendViaSend(address payable _to) public payable {
        // no longer recommended
        bool result = _to.send(msg.value);
        require(result, "Failed to send Ether");
    }
    
    // show a warning for not using data variable after declearation.
    function sendViaCall(address payable _to) public payable {
        ( bool result, bytes memory data ) = _to.call{ value : msg.value }("");
        require(result, "Failed to send Ether");
    }
 
}