// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "forge-std/Script.sol";
import "../src/TokenERC20.sol";

contract TokenERC20Script is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        TokenERC20 token = new TokenERC20("Second Token", "ST");

        vm.stopBroadcast();
    }
}
