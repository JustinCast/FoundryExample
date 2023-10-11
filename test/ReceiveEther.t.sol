// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import "../src/ReceiveEther.sol";

contract ReceiveEtherTest is Test {
    ReceiveEther receiveEther;

    function setUp() public {
        receiveEther = new ReceiveEther();
    }

    function testReceive() public {
        (bool success, ) = address(receiveEther).call{value: 1 ether}("");

        console.log(success);
        console.log(address(receiveEther).balance);
    }

    function testFallback() public {
        (bool success, ) = address(receiveEther).call("test");

        console.log(success);
        console.log(address(receiveEther).balance);
    }
}
