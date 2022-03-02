// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract StructureArray {
  struct BlockticalSubscriberStatus {
    address subscriber;
    bool subscribed;
  }
  
  BlockticalSubscriberStatus[] public BSS;
  
  function addSubscriber(address _add) public {
    BSS.push(BlockticalSubscriberStatus(_add, true));
  }
  
  function getStatus(uint _index) public returns (address, bool){
    return (BlockticalSubscriberStatus[_index].subscriber, BlockticalSubscriberStatus[_index].subscribed);
  }
}

contract StructureMapping {
  struct BSStatus {
    address subscriber;
    bool subscribed;
  }
  
  mapping(address => BSStatus) bsStatus;
  
  function addBSSubscriber(address _add) public {
    bsStatus[_add].subscriber = _add;
    bsStatus[_add].subscribed = true;
  }
  
}
