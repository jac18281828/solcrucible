// SPDX-License-Identifier: UNLICENSED
// solhint-disable no-console
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../contracts/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        console.log("Counter number: %d", counter.number());
        assertEq(counter.number(), 1);
    }

    function testVacuousFuzzSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
