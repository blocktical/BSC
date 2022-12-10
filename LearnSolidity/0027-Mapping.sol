     
// SPDX-License-Identifier: GPL-3.0
 
pragma solidity ^0.8.13;
 
// mapping => key : value pair
    // keyTypes  built-in types, bytes, string, any contract
    // value Type = anything 
contract Mapping {
    // rollnumber (uint) : YourName (string)
    mapping(uint => string) public myClassMap;
 
    // write key value inside this map
    function set(uint rollnumber, string memory name) public {
        myClassMap[rollnumber] = name;
    }
 
    function get(uint rollnumber) public view returns(string memory name){
        return myClassMap[rollnumber];
    }
 
    // nested Mapping
    mapping(uint => mapping(string => string)) public myDetailedMap;
 
    // write key value inside this map
    function nMset(uint rollnumber, string memory fname, string memory lname) public {
        myDetailedMap[rollnumber]["fname"] = fname;
        myDetailedMap[rollnumber]["lname"] = lname;
    }
 
    function nMget(uint rollnumber, string memory name) public view returns(string memory _name){
        return myDetailedMap[rollnumber][name];
    }
}