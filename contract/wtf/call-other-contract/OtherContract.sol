//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract OtherContract {
    uint256 private _x;

    event Log(uint256 amount, uint256 gasLeft);

    /**
     * 获取当前合约剩余的ETH
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getX() public view returns(uint) {
        return _x;
    }

    function setX(uint x) external payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }
}
