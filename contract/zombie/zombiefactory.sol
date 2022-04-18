// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.19;

contract ZombieFactory {
    // 事件
    event NewZombie(uint zombieId, string name, uint dna);

    // 状态变量
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // 结构体
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    // 创建zombie
    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
    }

    // 生成一个16位的DNA
    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    // 公共方法，创建一个zombie
    function createRandomZombie(string _name) public {
        // 每个用户只能拥有一个zombie
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
