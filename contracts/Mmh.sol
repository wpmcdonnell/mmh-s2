// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Mmh is ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private tokenIds;
  uint256 public maxSupply = 7;

constructor() ERC721("Perpetuity", "MMH-S1") {
}

function mint(string calldata _ipfsMetaData) public onlyOwner returns(uint256) {
      require(maxSupply > tokenIds.current(), "All tokens has been minted!");
      tokenIds.increment();
      uint256 currentTokenId = tokenIds.current();
      _safeMint(msg.sender, currentTokenId);
      _setTokenURI(currentTokenId, _ipfsMetaData);
      return currentTokenId;
    }
}