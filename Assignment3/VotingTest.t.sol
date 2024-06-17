// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Voting.sol";

contract VotingTest is Test {
    Voting voting;

    function setUp() public {
        voting = new Voting();
    }

    function testAdmin() public {
        assertEq(voting.admin(), address(this));
    }

    function testAddCandidate() public {
        voting.addCandidate("Alice");
        (uint id, string memory name, uint voteCount) = voting.candidates(1);
        assertEq(id, 1);
        assertEq(name, "Alice");
        assertEq(voteCount, 0);
    }

    function testRegisterVoter() public {
        voting.registerVoter(address(1));
        (bool isRegistered, bool hasVoted) = voting.voters(address(1));
        assertTrue(isRegistered);
        assertFalse(hasVoted);
    }

    function testVote() public {
        voting.addCandidate("Bob");
        voting.registerVoter(address(this));
        voting.vote(1);
        (uint id, string memory name, uint voteCount) = voting.candidates(1);
        assertEq(voteCount, 1);
        (bool isRegistered, bool hasVoted) = voting.voters(address(this));
        assertTrue(hasVoted);
    }

    function testGetVoteCount() public {
        voting.addCandidate("Charlie");
        voting.registerVoter(address(this));
        voting.vote(1);
        uint voteCount = voting.getVoteCount(1);
        assertEq(voteCount, 1);
    }

    function testGetWinner() public {
        voting.addCandidate("Dave");
        voting.registerVoter(address(this));
        voting.vote(1);
        string memory winner = voting.getWinner();
        assertEq(winner, "Dave");
    }
}