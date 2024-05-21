# MintToken
## Description
In this project, you will use HardHat or Remix to distribute your own ERC20 coin that you have created using a smart contract. When it's launched, it ought to be usable for your walkthrough video. Any user should be able to burn and transfer tokens, and the contract owner should be able to mint tokens to a specified address from the tool of their choice.
### Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the file icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Mint.sol). Copy and paste the following code into the file:

```
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

```

Once you paste the code, go to SOLIDITY COMPILER to appear in DEPLOY and RUN TRANSACTION to deploy. NOW YOU CAN ENTER THE AMOUNT YOU WANT!

## Authors

Junel Symon Closa Dela Cruz
8210225@ntc.edu.ph


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
