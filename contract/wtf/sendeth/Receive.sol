//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ReceiveETH {
    // 接收eth，并释放事件，返回发送者的地址和剩余的gas
    event senderAddressAndGasLeft(
        address _sender,
        uint256 _amount,
        uint256 _gasLeft
    );

    receive() external payable {
        emit senderAddressAndGasLeft(msg.sender, msg.value, gasleft());
    }

    /**
     * @dev 获取当前合约的剩余ETH
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
