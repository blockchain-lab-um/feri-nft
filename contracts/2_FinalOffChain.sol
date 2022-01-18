pragma solidity ^0.8.0;

// Import OpenZeppelin ERC721 contract and Counter contract
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyFirstNFT is ERC721URIStorage {
  // Counter allows us to keep track of how many NFTs have been minted and their ids
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("FeriNFT", "FERI") {
    console.log("This is my second NFT Smart Contract!");
  }

  // A function used to mint NFTs
  function mintAnNFT() public {
    // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/OLGW");

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}