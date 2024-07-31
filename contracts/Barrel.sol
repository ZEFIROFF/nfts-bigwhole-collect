// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Barrel is BaseNFT {
    constructor()
    BaseNFT("Barrel", "BRL", 3000, 1, "", msg.sender)
    {}
}
