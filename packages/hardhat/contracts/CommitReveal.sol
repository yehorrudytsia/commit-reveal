pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract CommitReveal {

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

  function commit(bytes32 dataHash, uint64 block_number) public {
    require(block_number > block.number,"CommitReveal::reveal: Already revealed");
    commits[msg.sender].commit = dataHash;
    commits[msg.sender].block = block_number;
    commits[msg.sender].revealed = false;
    console.log(block.number, block_number);
  }

}
