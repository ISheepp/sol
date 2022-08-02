//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * modifier的主要使用场景是运行函数前的检查，例如地址，变量，余额等。
 */
contract ModifierAndConstruct {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner {
        // 只有owner地址才能运行这个函数
        owner = _newOwner;
    }
}
