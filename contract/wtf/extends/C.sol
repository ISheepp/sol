//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./A.sol";

contract C is A {

    mapping(address => uint) addressTo;

    constructor(uint _c) A(_c * _c) {
        
    }

}