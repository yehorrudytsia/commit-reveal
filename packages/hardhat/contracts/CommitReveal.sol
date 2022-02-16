pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract {

  struct Commit {
    bytes32 commit;
    uint64 block;
    bool revealed;
  }

  constructor() {}

  mapping (address => Commit) public commits;
  uint8 public max = 100;

  function getHash(bytes32 data) public view returns(bytes32) {
    return keccak256(abi.encodePacked(address(this), data));
  }


}
