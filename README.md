[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/wK_5sh4Y)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=15283030&assignment_repo_type=AssignmentRepo)

For Task 2-
This Solidity smart contract seeks to establish a straightforward yet efficient and practical voting approach that is controlled by a manager. The deployer of the contract who is also the admin can only add candidates and register voters. The record of candidates and voters is kept in this contract within structured mappings where each voter has a registration status as well as voting status for each candidate which are identified by their unique id’s. This way, the administrators can easily add candidates by name and voters by their addresses thus assuring that one voter does not vote twice or more before being registered. Any registered voter can cast his vote for any candidate simply by inputting his/her name correctly, so that there will be no double-voting from the same individual, and it will ensure that correct ID’s of selected persons are given to the system. Voting increases the number of votes casted by an individual; for instance, a particular person cannot vote anymore if he/she has already voted at least once for another candidate. Here we have functions which can be used to count all votes obtained by any candidate as well as define who won depending on whose score was higher among all others. Thus, it allows transparently secure voting system monitored closely through the admin with specific controls that block all unauthorized actions which may result in biased voting outcomes. Next are test functions for Solidity to ensure that the Smart Voting Contract functions correctly and is integrity-bound. The "VotingTest" contract is built on the Forge framework with test cases that validate central features of the voting system. The setUp function sets up a new instance of the Voting contract before each test. "TestAdmin" ensures that setting the deployer of the contract to an admin is correct. "TestAddCandidate" creates a candidate adding function, testing for correctly stored candidate ID, name, and initial vote count. "TestRegisterVoter" ensures a voter can register without any problem and test for the status of voter registration and voting. The "testVote" function tests the voting process by first adding a candidate and then registering a voter; it checks to see that the voter's vote was appropriately tallied and that his or her status as a voter changed. The "testGetVoteCount" function makes sure that a vote count for a candidate is returned correctly after voting. The "testGetWinner" function finally checks that the system correctly identifies and returns the name of the candidate with the highest votes. All these extensive testing suites are quite important for making a case for a solid and reliable voting contract that behaves according to expectations in different scenarios.


Assignment 3 Q 3 PrimeOwner
At the beginning of each test, setUp() also creates a new instance of PrimeOwner.Confirming that the initial owner is set to address(0) is done by testInitialOwner and it serves as a basis for the contract’s beginning.TestChangeOwnerIfPrime ensures if ownership can be transferred to calling address when given number is a prime number while testChangeOwnerIfNotPrime checks that ownership will not change when non-prime number is sent so as to make sure the condition holds correctly. Other than testing if changing of owners using any prime numbers emits different OwnerChanged events, testEmitEvent does nothing else. Taken together, these tests demonstrate how correctly PrimeOwner handles changes in ownership based on prescribed conditions and generates anticipated outputs thereby ensuring the robustness and correctness of the design of this contract.


Assignment 3 Q 3 Library
Every time before the test, there will be a newly initialized instance of the Library contract in the setUp function to ensure that everything is starting from scratch. While testAddBook function ensures that each new book added has its ID, name, author and availability recorded accordingly into the contract. In addition, testBorrowAndReturnBook helps us prove that by borrowing the book we are able to change its availability status to false and then bring it back for turning this element into true again. Next is testInvalidBookID which makes sure that when someone tries borrowing non-existent books it reverts with error message “Invalid book ID”. Then comes testBorrowUnavailableBook which checks if one attempts to borrow already borrowed item on it will return an error ‘Book is not available’. Finally, we have got a case when user returns a book he/she did not borrow (testReturnUnborrowedBook) resulting in a revert where “You did not borrow this book” message is displayed. All these tests combined provide proof of how well Library functions as far as managing books and dealing with users in relation to invalid activities.


Assignment 3 Q 3 Employee
To ensure that a clean state is maintained, the setUp method instantiates a new EmployeeRegistree object before each test. The testAddEmployee method checks if the name, position and salary of the employee added matches the expected values. Similarly, the function testUpdateEmployee takes care of updating an existing employee’s details and ensuring that updates to those details have taken effect. The testGetEmployeeDetails function checks if added employee’s details can be retrieved from the registry correctly. Finally, in case of successful removal of an employee, this testDeleteEmployee will try to retrieve his or her information again and expect a fallback “employee not found”. Taken all together, these tests make sure that EmployeeRegistree does its core activities properly in terms of handling employees’ data integrity and reliability.
