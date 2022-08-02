//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

abstract contract A {

    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}