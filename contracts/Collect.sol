// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PartsOfABigWhole is ERC721, Ownable {
    enum NFTType {Barrel, Nippers, Uniform}

    uint256 public constant BARREL_SUPPLY = 3000;
    uint256 public constant NIPPERS_SUPPLY = 1000;
    uint256 public constant UNIFORM_SUPPLY = 1000;

    uint256 public constant MAX_PER_WALLET = 1;
    uint256 public constant MAX_PER_TX = 1;

    string public baseURI = "";
    bool public mintEnabled = false;

    mapping(NFTType => uint256) public minted;
    mapping(address => mapping(NFTType => uint256)) public mintedPerWallet;

    constructor()
    ERC721("Parts of a Big Whole", "PABW")
    Ownable(0xC9cA66A8EE9Aa7a62726dc764245554DD6DF3EB9)
    {}

    modifier onlyWhenMintEnabled() {
        require(mintEnabled, "Minting is not enabled");
        _;
    }

    function setBaseURI(string memory newBaseURI) external onlyOwner {
        baseURI = newBaseURI;
    }

    function toggleMinting() external onlyOwner {
        mintEnabled = !mintEnabled;
    }

    function safeMint(address to, NFTType nftType) external onlyWhenMintEnabled {
        require(mintedPerWallet[to][nftType] < MAX_PER_WALLET, "Mint limit for this NFT type reached for this wallet");
        require(minted[nftType] < getSupplyLimit(nftType), "Mint limit for this NFT type reached");

        mintedPerWallet[to][nftType]++;
        minted[nftType]++;
        uint256 tokenId = getNextTokenId(nftType);
        _safeMint(to, tokenId);
    }

    function getSupplyLimit(NFTType nftType) internal pure returns (uint256) {
        if (nftType == NFTType.Barrel) {
            return BARREL_SUPPLY;
        } else if (nftType == NFTType.Nippers) {
            return NIPPERS_SUPPLY;
        } else if (nftType == NFTType.Uniform) {
            return UNIFORM_SUPPLY;
        }
        return 0;
    }

    function getNextTokenId(NFTType nftType) internal view returns (uint256) {
        return uint256(nftType) * 10000 + minted[nftType] + 1;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
