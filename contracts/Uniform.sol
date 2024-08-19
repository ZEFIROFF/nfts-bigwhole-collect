// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Uniform is BaseNFT {
    constructor()
    BaseNFT("Uniform", "UNF", 1000, 1, "https://app.alloca.io/nft/uniform/", msg.sender)
    {}
}
