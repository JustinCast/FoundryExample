// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "forge-std/Script.sol";
import "../src/TokenSwap.sol";

contract TokenSwapScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address owner1 = 0xEC305C60FD423535411b225Df713601ae39a76B9;
        address token1 = 0x1BE6BF13d16Dc822Ab6cA1254997c9a5e9f7df3a;

        address owner2 = 0x4e4D35724ea07F382E3fc8371E9eae318149851d;
        address token2 = 0x02D8C44B9Acf0C3749951FA18D09ae6D484B9326;

        TokenSwap tokenSwap = new TokenSwap(token1, owner1, owner2, token2);

        vm.stopBroadcast();
    }
}
