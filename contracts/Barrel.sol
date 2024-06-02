// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Barrel is BaseNFT {
    constructor()
    BaseNFT("Barrel", "BRL", 3000, 1, "", "0xC9cA66A8EE9Aa7a62726dc764245554DD6DF3EB9")
    {}
}
