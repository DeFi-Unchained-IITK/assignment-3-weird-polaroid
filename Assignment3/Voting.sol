// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Voting {
    address public admin;
    uint public candidateCount;
    uint public voterCount;

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    struct Voter {
        bool isRegistered;
        bool hasVoted;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => Voter) public voters;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addCandidate(string memory name) public onlyAdmin {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, name, 0);
    }

    function registerVoter(address voter) public onlyAdmin {
        require(!voters[voter].isRegistered, "Voter is already registered");
        voters[voter] = Voter(true, false);
        voterCount++;
    }

    function vote(uint candidateId) public {
        require(voters[msg.sender].isRegistered, "You are not registered to vote");
        require(!voters[msg.sender].hasVoted, "You have already voted");
        require(candidateId > 0 && candidateId <= candidateCount, "Invalid candidate ID");

        voters[msg.sender].hasVoted = true;
        candidates[candidateId].voteCount++;
    }

    function getVoteCount(uint candidateId) public view returns (uint) {
        require(candidateId > 0 && candidateId <= candidateCount, "Invalid candidate ID");
        return candidates[candidateId].voteCount;
    }

    function getWinner() public view returns (string memory) {
        uint maxVotes = 0;
        uint winnerId = 0;

        for (uint i = 1; i <= candidateCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerId = i;
            }
        }

        require(winnerId != 0, "No votes cast");
        return candidates[winnerId].name;
    }
}