// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract MappingExample {
    mapping(address => uint) private balancesa;

    function update(uint newBalance) public {
        balancesa[msg.sender] = newBalance;
    }

    function getBalance() public view returns (uint) {
        return balancesa[msg.sender];
    }
}

contract MappingLBC {
    function f() public returns (uint) {
        MappingExample m = new MappingExample();
        m.update(100);
        return m.getBalance();
    }
}