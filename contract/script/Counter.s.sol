// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MockERC20} from "../src/Mock-token.sol";

contract BridgeScript is Script {
    MockERC20 public mockerc20;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        mockerc20 = new MockERC20();

        vm.stopBroadcast();
    }
}
