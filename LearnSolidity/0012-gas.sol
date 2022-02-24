// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract gas {
  function burnAllGas() public {
    string follow;
    while ( true ) {
      follow = "Blocktical";
    }
  }
}
// gas              = unit of computation
// gas spent        = total gas used in the transaction 
// gas price        = ether per gas
// gas limit        = max gas willing to be ysed for transaction to complete
// block gas limit  = max amount of gas allowed in a block, set by the network
