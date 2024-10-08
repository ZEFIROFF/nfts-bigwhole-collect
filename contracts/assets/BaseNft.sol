// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BaseNFT is ERC721, Ownable {
    uint256 public maxSupply;
    uint256 public currentSupply;
    uint256 public maxPerWallet;
    bool public mintEnabled;
    string private _baseTokenURI;

    mapping(address => uint256) public mintedPerWallet;

    constructor(
        string memory name,
        string memory symbol,
        uint256 _maxSupply,
        uint256 _maxPerWallet,
        string memory baseURI,
        address owner
    )
    ERC721(name, symbol)
    Ownable(owner)
    {
        maxSupply = _maxSupply;
        maxPerWallet = _maxPerWallet;
        mintEnabled = false;

        _baseTokenURI = baseURI;
    }

    modifier onlyWhenMintEnabled() {
        require(mintEnabled, "Minting is not enabled");
        _;
    }

    function setBaseURI(string memory newBaseURI) external onlyOwner {
        _baseTokenURI = newBaseURI;
    }

    function toggleMinting() external onlyOwner {
        mintEnabled = !mintEnabled;
    }

    function safeMint(address to) external onlyWhenMintEnabled {
        require(mintedPerWallet[to] < maxPerWallet, "Mint limit for this wallet reached");
        require(currentSupply < maxSupply, "Mint limit for this type reached");

        mintedPerWallet[to]++;
        currentSupply++;
        uint256 tokenId = currentSupply;
        _safeMint(to, tokenId);
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
}
