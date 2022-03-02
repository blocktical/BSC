// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Enum {
  enum OrderStatus {
    Packing,            //  0
    Shiping,            //  1
    Delivered,          //  2
    Canceled,           //  3
    Rejected            //  4
  }
  
  OrderStatus public oStatus;
  
  function getStatus() public view returns (OrderStatus) {
    return oStatus;
  }
  
  function set(OrderStatus _oStatus) public {
    oStatus = _oStatus;
  }
  
  function reset() public {
    delete oStatus;
  }
  
  function reject() public {
    oStatus = OrderStatus.Rejected;
  }
}
