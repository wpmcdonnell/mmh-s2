// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Thicc is ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private tokenIds;
  uint256 public maxSupply = 5;
  uint public _totalSupply;

constructor() ERC721("Something Cool", "MMH-S1") {
}

function mint(string calldata _ipfsMetaData) public returns(uint256) {
      require(maxSupply > tokenIds.current(), "All tokens has been minted!");
      tokenIds.increment();
      uint256 currentTokenId = tokenIds.current();
      _safeMint(msg.sender, currentTokenId);
      _setTokenURI(currentTokenId, _ipfsMetaData);
      return currentTokenId;
    }

function totalSupply() public returns(uint256) {
    return _totalSupply = tokenIds.current();
}
}