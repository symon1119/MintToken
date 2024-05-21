// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WaterSupply is ERC20 {
    address public owner; // Declare owner variable
    uint256 private _totalSupply;

    constructor() ERC20("WaterSupply", "WS") {
        owner = msg.sender; // Assign the deployer of the contract as the owner
        _mint(msg.sender, 10000 * 5 ** decimals()); // Mint 5,000,000 tokens initially
        _totalSupply = 10000 * 5** decimals();
    }

    function mint(address _to, uint256 _amount) public returns (bool success) {
        require(msg.sender == owner, "Only the owner can mint tokens");
        
        _mint(_to, _amount);
        _totalSupply += _amount;
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        _burn(msg.sender, _amount);
        _totalSupply -= _amount;
        return true;
    }

    function transfer(address _to, uint256 _value) public override returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}