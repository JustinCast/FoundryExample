// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {console} from "forge-std/console.sol";

contract ReceiveEther {
    receive() external payable {
        console.log("Receive function called");
    }

    fallback() external {
        console.log("Fallback function called");
    }
}
