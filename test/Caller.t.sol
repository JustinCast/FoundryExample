// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

import {Test, console} from "forge-std/Test.sol";

import "../src/Caller.sol";
import "../src/Reentrancy.sol";

contract CallerTest is Test {
    Reentrancy victim;
    Caller caller;

    address personalAddr = 0xAe65930180ef4d86dbD1844275433E9e1d6311ED;

    function setUp() public {
        victim = new Reentrancy();
        caller = new Caller(address(victim));

        vm.startPrank(personalAddr);
        vm.deal(personalAddr, 5 ether);
        vm.deal(address(victim), 10 ether);
    }

    function testInitAttack() public {
        console.log(personalAddr.balance);
        console.log(address(victim).balance);

        caller.startAttack{value: 1 ether}();

        console.log("RESULT");
        console.log(personalAddr.balance);
        console.log(address(victim).balance);
        console.log(caller.getBalance());
    }
}
