//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./OtherContract.sol";

contract CallContract {
    function callSetX(address _Address, uint256 x) external {
        OtherContract(_Address).setX(x);
    }

    function callGetX(OtherContract _Address) external view returns (uint256) {
        return _Address.getX();
    }

    function callGetX2(address _Address) external view returns (uint256) {
        OtherContract other = OtherContract(_Address);
        return other.getX();
    }

    function setXTransferETH(address otherContract, uint256 x)
        external
        payable
    {
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}
