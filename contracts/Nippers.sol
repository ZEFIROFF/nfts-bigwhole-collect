// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Nippers is BaseNFT {
    constructor()
    BaseNFT("Nippers", "NPR", 1000, 1, "", msg.sender)
    {}
}
