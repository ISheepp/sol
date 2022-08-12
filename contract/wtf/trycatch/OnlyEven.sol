//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract OnlyEven {
    constructor(uint a) {
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    // 输入奇数抛出异常
    function onlyEven(uint b) external pure returns(bool) {
        require(b %2 ==0, "Ops, reverting!");
        return true;
    }

}