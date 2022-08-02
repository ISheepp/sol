//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Base1 {
    // 修饰器也可以继承
    modifier exactDividedBy2And3(uint256 _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}
