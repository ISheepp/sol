//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Sort {

    // 冒泡排序
    function sort(uint[] memory array) public pure returns(uint[] memory) {
        // uint i = 0;
        for(uint i = 0; i < array.length; i++) {
            for(uint j = 0; j < array.length - i - 1; j++) {
                if(array[j] > array[j + 1]) {
                    uint temp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = temp;
                }
            }
        }
        return array;
    }

    // 选择排序
    function selectionSort(uint[] memory array) public pure returns(uint[] memory) {
        uint minIndex;
        for (uint i = 0; i < array.length - 1; i++) {
            minIndex = i;
            for(uint j = i; j < array.length; j++) {
                if(array[j] < array[minIndex]) {
                    minIndex = j;
                }
            }
            uint temp = array[i];
            array[i] = array[minIndex];
            array[minIndex] = temp;
        }
        return array;
    }

    // 插入排序, 小心uint类型不能为负数
    function insertSort(uint[] memory array) public pure returns(uint[] memory) {
        for(uint i = 1; i < array.length; i++) {
            uint temp = array[i];
            uint preIndex = i;
            while(preIndex >= 1 && array[preIndex - 1] > temp) {
                array[preIndex] = array[preIndex - 1];
                preIndex--;
            }
            array[preIndex] = temp;
        }
        return array;
    }

    function testUint(uint input) public pure returns(uint) {
        uint i = input - 1;
        return i;
    }

}