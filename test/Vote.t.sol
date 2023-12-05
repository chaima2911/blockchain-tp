// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console2} from "forge-std/Test.sol";
import {Vote} from "../src/Vote.sol";

contract VoteTest is Test {
    Vote public v;
    address public singer;
    address public voter;

    function setUp() public {
        v = new Vote();
        singer = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
        voter= 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    }

    function test_vote() public {
        vm.prank(voter);      
        v.vote(singer);

        assertEq(v.votes(singer), 1);
        assertEq(v.hasVoted(voter), true);
        assertEq(v.totalVotes(), 1);
    }

    function test_votesNumber() public {
        vm.prank(voter);      
        v.vote(singer);

        assertEq(v.votesNumber(singer), 1);
    }

    function test_getTotalVotes() public {
        vm.prank(voter);
        v.vote(singer);

        assertEq(v.totalVotes(), 1);
    }
        

}
