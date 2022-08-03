//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract sendETH {
    // 向其他合约发送ETH一般有三个方法
    // transfer()
    // send()
    // call() 推荐使用

    // payable可以在部署合约的时候转ETH进去
    constructor() payable {}

    // receive()
    receive() external payable {}

    error CallFailed();

    // call()
    function sendByCall(address payable _targetAddress, uint256 _amount)
        external
        payable
    {
        (bool success, ) = _targetAddress.call{value: _amount}("");
        if (!success) {
            revert CallFailed();
        }
    }
}
