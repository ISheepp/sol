//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
solidity的继承
 */
contract Yeye {
    event Log(string msg);

    // todo virtual ?
    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual {
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}
