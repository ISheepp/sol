//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract C {
    uint public num;
    address public sender;

    function setVars(uint _num) public payable returns(string memory) {
        num = _num;
        sender = msg.sender;
        return("success");
    }

}