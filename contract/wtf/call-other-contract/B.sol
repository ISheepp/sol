//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * 委托调用
 * 首先，合约B必须和目标合约C的变量存储布局必须相同，两个变量，并且顺序为num和sender
 */
contract B {
    uint256 public num;
    address public sender;

    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    function callSetVars(address _addr, uint256 _num) external payable returns(bool, bytes memory) {
        // call setVars()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        return(success, data);
    }

    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    function delegatecallSetVars(address _addr, uint256 _num) external payable returns(bool, string memory) {
        // delegatecall setVars()
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        // abi.decode 解码
        return(success, abi.decode(data, (string)));
    }
}
