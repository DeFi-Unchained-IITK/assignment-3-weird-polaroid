// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PrimeOwner {
    address public owner;

    event OwnerChanged(address indexed newOwner);

    function changeOwnerIfPrime(uint256 number) public {
        require(number > 0, "Number must be greater than 0");
        if (isPrime(number)) {
            owner = msg.sender;
            emit OwnerChanged(msg.sender);
        }
    }

    function isPrime(uint256 number) private pure returns (bool) {
        if (number <= 1) {
            return false;
        }
        if (number == 2) {
            return true;
        }
        if (number % 2 == 0) {
            return false;
        }

        uint256 sqrt = uint256(sqrt(uint256(number)));
        for (uint256 i = 3; i <= sqrt; i += 2) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    function sqrt(uint256 x) private pure returns (uint256 y) {
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}