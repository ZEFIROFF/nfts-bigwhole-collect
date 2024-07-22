// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title PartsOfABigWhole
 * @dev NFT collection contract with different rarities and minting rules.
 */
contract PartsOfABigWhole is ERC721, Ownable {
    enum NFTType {Barrel, Nippers, Uniform}

    uint256 public constant BARREL_SUPPLY = 3000;
    uint256 public constant NIPPERS_SUPPLY = 1000;
    uint256 public constant UNIFORM_SUPPLY = 1000;

    uint256 public constant MAX_PER_WALLET = 1;
    uint256 public constant MAX_PER_TX = 1;

    string public baseURI;
    bool public mintEnabled;

    mapping(NFTType => uint256) public minted;
    mapping(address => mapping(NFTType => uint256)) public mintedPerWallet;

    /**
     * @dev Initializes the contract by setting the deployer as the initial owner and initializing the ERC721 contract.
     */
    constructor() ERC721("Parts of a Big Whole", "PABW") Ownable(msg.sender) {}

    /**
     * @dev Modifier to allow actions only when minting is enabled.
     */
    modifier onlyWhenMintEnabled() {
        require(mintEnabled, "Minting is not enabled");
        _;
    }

    /**
     * @notice Sets a new base URI for the token metadata.
     * @param newBaseURI The new base URI.
     */
    function setBaseURI(string memory newBaseURI) external onlyOwner {
        baseURI = newBaseURI;
    }

    /**
     * @notice Toggles the minting state.
     */
    function toggleMinting() external onlyOwner {
        mintEnabled = !mintEnabled;
    }

    /**
     * @notice Mints a new NFT of a specified type to the specified address.
     * @param to The address to mint the NFT to.
     * @param nftType The type of NFT to mint.
     */
    function safeMint(address to, NFTType nftType) external onlyWhenMintEnabled {
        require(mintedPerWallet[to][nftType] < MAX_PER_WALLET, "Mint limit for this NFT type reached for this wallet");
        require(minted[nftType] < getSupplyLimit(nftType), "Mint limit for this NFT type reached");

        mintedPerWallet[to][nftType]++;
        uint256 newMinted = minted[nftType] + 1;
        minted[nftType] = newMinted;

        uint256 tokenId = uint256(nftType) * 10000 + newMinted;
        _safeMint(to, tokenId);
    }

    /**
     * @dev Returns the supply limit for a given NFT type.
     * @param nftType The type of NFT.
     * @return The supply limit for the specified NFT type.
     */
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

    /**
     * @dev Returns the base URI for the token metadata.
     * @return The base URI.
     */
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    /**
     * @notice Transfers ownership of the contract to a new account (`newOwner`).
     * @param newOwner The address of the new owner.
     */
    function setOwner(address newOwner) external onlyOwner {
        transferOwnership(newOwner);
    }
}
