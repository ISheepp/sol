//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {

    address private owner;

    constructor() {
        owner = msg.sender;
    }
    // 使用error关键字可以节省gas
    // 可以定义参数，但是在etherscan上必须上传代码才能显示，而require则不用
    error NotOwner(string msg, string why);

    function getOwner() public view returns(string memory) {
        if (owner != msg.sender) {
            revert NotOwner({
                msg: "111",
                why: "222"
            });
        }
        return "OK";
    }

}