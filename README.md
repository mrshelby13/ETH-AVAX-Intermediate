# FuncErrors Smart Contract

## Overview

FuncErrors is a Solidity smart contract that extends the ERC20 and Ownable contracts from the OpenZeppelin library. It introduces custom functions for minting, burning, and transferring tokens with additional checks and error handling mechanisms.

## License

This contract is released under the MIT License.

## Contract Functions

### mint(address account, uint256 amount)

- Allows the owner to mint new tokens and assign them to a specific account.
- Parameters:
  - account (address): The account to which the minted tokens will be assigned.
  - amount (uint256): The amount of tokens to mint.
- Conditions:
  - Requires the minting amount to be greater than zero.
- Emits:
  - Internal Transfer event.

### burn(uint256 amount)

- Allows any address to burn a specified amount of their own tokens.
- Parameters:
  - amount (uint256): The amount of tokens to burn.
- Conditions:
  - Requires the burning amount to be greater than zero.
  - Requires the burner to have sufficient balance.
  - Uses assert to check if the total supply is reduced by the burned amount.
- Emits:
  - Internal Transfer event.

### transfer(address to, uint256 amount)

- Allows token holders to transfer tokens to another address.
- Parameters:
  - to (address): The recipient's address.
  - amount (uint256): The amount of tokens to transfer.
- Conditions:
  - Requires the transfer amount to be greater than zero.
  - Requires the transfer amount to be at least 20.
  - Requires the sender to have sufficient balance.
- Emits:
  - Internal Transfer event.


