//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Yeye.sol";
import "./Baba.sol";

/**
多重继承，必须按照辈分关系，如下例子就不能写成
contract Erzi is Baba, Yeye
 */
contract Erzi is Yeye, Baba {
    // 如果某一个函数在多个继承的合约里都存在，
    // 比如例子中的hip()和pop()，在子合约里必须重写，不然会报错。
    // 重写在多个父合约中重名函数时，override关键字后面要加上所有父合约名字
    function hip() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye, Baba) {
        emit Log("Erzi");
    }
}
