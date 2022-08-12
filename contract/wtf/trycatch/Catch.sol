//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./OnlyEven.sol";

contract Catch {
    event SuccessEvent();

    event CatchEvent(string message);
    event CatchByte(bytes data);

    OnlyEven onlyEven;

    constructor() {
        onlyEven = new OnlyEven(4);
    }

    function execute(uint256 amount) external returns (bool) {
        try onlyEven.onlyEven(amount) returns (bool _success) {
            // call成功
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason) {
            // call 失败
            emit CatchEvent(reason);
            return false;
        }
    }
}
