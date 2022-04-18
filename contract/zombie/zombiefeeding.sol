// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.19;

import "./zombiefactory.sol";

// 继承自ZombieFactory
contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    // 只有拥有者才能喂养
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    // start here
  }
  
}