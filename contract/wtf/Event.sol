//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 事件是EVM log的抽象,  
 响应：应用程序（ether.js）可以通过RPC接口订阅和监听这些事件，并在前端做响应。
 经济：事件是EVM上比较经济的存储数据的方式，每个大概消耗2,000 gas；相比之下，链上存储一个新变量至少需要20,000 gas。
 */
contract EventTest {
    mapping(address => uint256) public _balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) external {
        _balances[from] = 10000000;

        _balances[from] -= amount;
        _balances[to] += amount;

        // 释放事件
        emit Transfer(from, to, amount);
    }
}
