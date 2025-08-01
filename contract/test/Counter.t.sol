// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BridgeContract} from "../src/Bridge_contract.sol";

contract CounterTest is Test {
    BridgeContract public bridgeContract;

    function setUp() public {
        bridgeContract = new BridgeContract();
        bridgeContract.setNumber(0);
    }

    function test_Increment() public {
        bridgeContract.increment();
        assertEq(bridgeContract.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        bridgeContract.setNumber(x);
        assertEq(bridgeContract.number(), x);
    }
}
