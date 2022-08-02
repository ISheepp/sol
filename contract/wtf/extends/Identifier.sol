//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Base1.sol";

contract Identifier is Base1 {
    // 计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
    // 可以直接使用Base1的修饰器，也可以自己重载
    function resultDivideBy2And3(uint256 _num)
        public
        pure
        exactDividedBy2And3(_num)
        returns (uint256, uint256)
    {
        return divide(_num);
    }

    function divide(uint256 _input) public pure returns (uint256, uint256) {
        return (_input / 2, _input / 3);
    }
}
