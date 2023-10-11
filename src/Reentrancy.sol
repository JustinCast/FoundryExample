// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Reentrancy {
    // que maneje algún tipo de token/asset
    // que reciba assets
    // que el storage se actualice luego de una llamada externa
    mapping(address => uint256) public balances;

    function setBalance() external payable returns (bool) {
        balances[msg.sender] += msg.value;

        return true;
    }

    function withdraw() external {
        uint256 amountToWithdraw = balances[msg.sender];

        // ejecutar el withdraw
        (bool success, ) = msg.sender.call{value: amountToWithdraw}("");
        require(success, "Failed to withdraw tokens");

        // actualizar el balance
        balances[msg.sender] = 0;
    }
}
