// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Library {
    struct Book {
        uint ID;
        string name;
        string author;
        bool isAvailable;
    }

    mapping (uint => Book) public books;
    mapping (address => uint[]) public borrowed_books;
    uint public nextID;

    modifier isValidBookID(uint _id) {
        require(books[_id].ID!= 0, "Book ID is not valid");
        _;
    }

    constructor() {
        nextID = 1;
    }

    function addBook(string memory _name, string memory _author) public {
        Book storage newBook = books[nextID];
        newBook.ID = nextID;
        newBook.name = _name;
        newBook.author = _author;
        newBook.isAvailable = true;
        nextID++;
    }

    function borrowBook(uint _id) public isValidBookID(_id) {
        require(books[_id].isAvailable, "Book is not available");
        books[_id].isAvailable = false;
        borrowed_books[msg.sender].push(_id);
    }

    function getBookDetails(uint _id) public view isValidBookID(_id) returns (string memory, string memory, bool) {
        return (books[_id].name, books[_id].author, books[_id].isAvailable);
    }

    function returnBook(uint _id) public isValidBookID(_id) {
        require(!books[_id].isAvailable, "Book is already available");
        require(isBorrowedBy(msg.sender, _id), "You did not borrow this book");
        books[_id].isAvailable = true;
        removeBookFromBorrowedList(msg.sender, _id);
    }

    function isBorrowedBy(address _address, uint _id) internal view returns (bool) {
        uint[] storage borrowedBookIDs = borrowed_books[_address];
        for (uint i = 0; i < borrowedBookIDs.length; i++) {
            if (borrowedBookIDs[i] == _id) {
                return true;
            }
        }
        return false;
    }

    function removeBookFromBorrowedList(address _address, uint _id) internal {
        uint[] storage borrowedBookIDs = borrowed_books[_address];
        for (uint i = 0; i < borrowedBookIDs.length; i++) {
            if (borrowedBookIDs[i] == _id) {
                delete borrowedBookIDs[i];
                break;
            }
        }
    }
}