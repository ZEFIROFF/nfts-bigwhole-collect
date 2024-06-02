// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./assets/BaseNft.sol";

contract Nippers is BaseNFT {
    constructor()
    BaseNFT("Nippers", "NPR", 1000, 1, "", 0xC9cA66A8EE9Aa7a62726dc764245554DD6DF3EB9)
    {}
}
