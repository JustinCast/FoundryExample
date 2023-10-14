// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "forge-std/Script.sol";
import "../src/TokenSwap.sol";

contract TokenSwapScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address owner1 = 0xEC305C60FD423535411b225Df713601ae39a76B9;
        address token1 = 0xd66f33c35038109A4c48eB08c8246ac8c7b9eEAB;

        address owner2 = 0x4e4D35724ea07F382E3fc8371E9eae318149851d;
        address token2 = 0x5292b9F654C6f8259f9e2D5582f8fC7B35E4A4C0;

        TokenSwap tokenSwap = new TokenSwap(token1, owner1, token2, owner2);

        vm.stopBroadcast();
    }
}
