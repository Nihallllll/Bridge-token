// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {IERC20}  from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeContract is Ownable {
    //state variables
    uint256 internal nonce;
    
    //mappings 
    mapping(uint256 => bool ) internal used_nonces;

    //events
    event Bridged_event(address indexed , uint256  );
    event Redeemed(address indexed,uint256);
    //errors
    error Not_allowed_to_spend(); 
    error Bridge_transaction_failed();
    error Nonce_not_valid();
    error Token_tarnsfer_failed();


    constructor() Ownable(msg.sender){}

    function Bridge(IERC20 _tokenAddress, uint256 _amount) public  {
        require(_tokenAddress.allowance(msg.sender, address(this)) >=  _amount , Not_allowed_to_spend());
        require(_tokenAddress.transferFrom(msg.sender, address(this), _amount) ,Bridge_transaction_failed());
        emit Bridged_event(msg.sender, _amount);
    }
    
    function redeem(
        IERC20 _tokenaddress,
        uint256 _nonce,
        address _to,
        uint256 _amount
    ) external onlyOwner {
        require(_nonce == nonce + 1 ,Nonce_not_valid());
        require(_tokenaddress.transfer(_to, _amount),Token_tarnsfer_failed());
        emit Redeemed(_to , _amount);
    }

}
