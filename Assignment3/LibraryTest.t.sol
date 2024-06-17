// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "/home/adityaprakhar/Defi-Unchained/solidity/src/Library.sol";

contract TestLibrary is Test {
    Library private library1;

    function setUp() public {
        library1 = new Library();
    }

    function testAddBook() public {
        library1.addBook("Book 1", "Author 1");
        (string memory name, string memory author, bool isAvailable) = library1.getBook(0);
        assertEq(name, "Book 1", "Book name should be 'Book 1'");
        assertEq(author, "Author 1", "Book author should be 'Author 1'");
        assertTrue(isAvailable, "Book should be available");
    }

    function testBorrowBook() public {
        library1.addBook("Book 1", "Author 1");
        library1.borrowBook(0);
        (, , bool isAvailable) = library1.getBook(0);
        assertFalse(isAvailable, "Book should not be available after borrowing");
    }

    function testReturnBook() public {
        library1.addBook("Book 1", "Author 1");
        library1.borrowBook(0);
        library1.returnBook(0);
        (, , bool isAvailable) = library1.getBook(0);
        assertTrue(isAvailable, "Book should be available after returning");
    }

    function testBorrowNonExistentBook() public {
        vm.expectRevert("Invalid book ID");
        library1.borrowBook(0);
    }

    function testReturnNonBorrowedBook() public {
        library1.addBook("Book 1", "Author 1");
        vm.expectRevert("You did not borrow this book");
        library1.returnBook(0);
    }
}