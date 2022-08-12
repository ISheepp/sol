//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Abi {
    uint256 x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint256[2] array = [5, 6];

    function encode() public view returns (bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }

    // @dev 紧打包 去除多余的0
    function encodePacked() public view returns (bytes memory result) {
        result = abi.encodePacked(x, addr, name, array);
    }

    // @dev 调用函数
    function encodeWithSignature() public view returns (bytes memory result) {
        result = abi.encodeWithSignature(
            "foo(uint256, address, string, uint256[2])",
            x,
            addr,
            name,
            array
        );
    }

    /**
     * @dev 函数选择器调用
     */
    function encodeWithSelector() public view returns (bytes memory result) {
        result = abi.encodeWithSelector(
            bytes4(keccak256("foo(uint256, address, string, uint256[2])")),
            x,
            addr,
            name,
            array
        );
    }

    /**
     * @dev abi解码
     */
    function decode(bytes memory data)
        public
        pure
        returns (
            uint256 dx,
            address daddr,
            string memory dname,
            uint256[2] memory darray
        )
    {
        (dx, daddr, dname, darray) = abi.decode(
            data,
            (uint256, address, string, uint256[2])
        );
    }
}