// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {IERC20}  from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeContract is Ownable {
    uint256 internal nonce;
    

    //errors
    error Not_allowed_to_spend(); 
    error Bridge_transaction_failed();
    constructor() Ownable(msg.sender){}

    function Bridge(IERC20 _tokenAddress, uint256 _amount) public  {
        require(_tokenAddress.allowance(msg.sender, address(this)) >=  _amount , Not_allowed_to_spend());
        require(_tokenAddress.transferFrom(msg.sender, address(this), _amount) ,Bridge_transaction_failed());
    }


}
