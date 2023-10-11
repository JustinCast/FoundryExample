// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

import {Test, console} from "forge-std/Test.sol";
import "../src/Token.sol";

contract TokenTest is Test {
    Token token;
    address personalAddress = 0xAe65930180ef4d86dbD1844275433E9e1d6311ED;
    address randomAddress = makeAddr("randomAddress");

    function setUp() public {
        token = new Token();
        vm.startPrank(personalAddress);
    }

    function testMint() public {
        uint256 amount = 5;

        token.mint(amount);
        assertEq(amount, token.totalSupply());
        assertEq(token.balanceOf(personalAddress), amount * token.decimals());
    }

    function testFailMint() public {
        uint256 amount = 5;

        token.mint(amount);
        assertEq(amount, token.totalSupply());
        assertEq(token.balanceOf(personalAddress), 2 * token.decimals());
    }

    function testBurn() public {
        uint256 amount = 10;

        token.mint(10);
        assertEq(token.totalSupply(), amount);

        token.burn(amount);
        assertEq(token.totalSupply(), 0);
    }

    function testFailBurn() public {
        uint256 amount = 10;

        token.burn(amount);
    }

    function testApprove() public {
        token.mint(20);
        token.approve(randomAddress, 10);

        uint256 currentAllowance = token.allowance(
            personalAddress,
            randomAddress
        );

        assertEq(currentAllowance, 10 * token.decimals());
    }

    function testTransferFrom() public {
        address recipient = makeAddr("recipient");
        uint256 amount = 10;

        token.mint(20);
        token.approve(randomAddress, amount);
        vm.stopPrank();

        assertEq(token.balanceOf(personalAddress), 20 * token.decimals());

        vm.prank(randomAddress);
        token.transferFrom(personalAddress, recipient, amount);

        uint256 currentAllowance = token.allowance(
            personalAddress,
            randomAddress
        );

        assertEq(currentAllowance, 0);
        assertEq(token.balanceOf(personalAddress), amount * token.decimals());
        assertEq(token.balanceOf(recipient), amount * token.decimals());
    }
}
