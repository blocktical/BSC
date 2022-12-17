// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;

interface IERC20 {
    event Transfer(address _from, address _to, uint256 _value);
    event Approve(address _owner, address _spender, uint256 _value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimal() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address _owner) external view returns (uint256);
}
