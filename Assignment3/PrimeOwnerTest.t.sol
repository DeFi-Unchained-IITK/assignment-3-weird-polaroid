// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "/home/adityaprakhar/Defi-Unchained/assignment-3-weird-polaroid/Assignment3/PrimeOwner.sol";

contract TestPrimeOwner is Test {
    PrimeOwner private primeOwner;

    function setUp() public {
        primeOwner = new PrimeOwner();
    }

    function testInitialOwner() public {
        assertEq(primeOwner.owner(), address(0), "Initial owner should be address(0)");
    }

    function testChangeOwnerIfPrime() public {
        primeOwner.changeOwnerIfPrime(7);
        assertEq(primeOwner.owner(), address(this), "Owner should be changed to this address");
    }

    function testChangeOwnerIfNotPrime() public {
        primeOwner.changeOwnerIfPrime(4);
        assertEq(primeOwner.owner(), address(0), "Owner should not be changed");
    }

    function testEmitEvent() public {
        vm.expectEmit(true, true, true, true);
        emit OwnerChanged(address(this));
        primeOwner.changeOwnerIfPrime(7);
    }
}