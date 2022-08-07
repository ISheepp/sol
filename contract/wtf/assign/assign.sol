//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * 变量赋值
 */
contract Assign {

    // 状态变量默认storage
    uint state_num;

    address myAddress = 0x0000000000000000000000000000000000000000;

    function assign() pure public returns(uint, uint) {
        uint a = 3;
        uint b = a;
        b--; // 相当于 b = b - 1; 再一次重新赋值
        return(a, b); // 返回3，2
    }

    function useUtil(uint[] memory input) public pure returns(uint[] memory, uint[] memory) {
        // 输入[0,1,2]返回[1, 1, 2],[1, 1, 2]
        // 说明memory赋值memory确实是引用赋值
        return(_util(input), input);
    }

    function _util(uint[] memory nums) private pure returns(uint[] memory) {
        nums[0] = 1;
        return nums;
    }

}