// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Barrel is BaseNFT {
    constructor()
    BaseNFT("Barrel", "BRL", 3000, 1, "https://app.alloca.io/nft/barrel/", msg.sender)
    {}
}
