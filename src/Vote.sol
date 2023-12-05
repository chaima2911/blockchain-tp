//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Vote{

    mapping (address => uint) public votes;
    mapping (address => bool) public hasVoted;
    uint public totalVotes;

    constructor(){}

    
    //modifier hasNotVotedBefore
    modifier hasNotVotedBefore(){
        require(hasVoted[msg.sender] == false, "You have already voted!");
        _;
    }
    //function vote
    function vote(address _singer) public hasNotVotedBefore{
        votes[_singer]++;
        hasVoted[msg.sender] = true;
        totalVotes++;
    }
    //function number of votes
    function votesNumber(address _singer) public view returns(uint){
         return votes[_singer];
    }
    //function totalVotes
    function getTotalVotes() public view returns(uint){
        return totalVotes;
    }
}