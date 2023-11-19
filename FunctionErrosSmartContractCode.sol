pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract FuncErrors is ERC20, Ownable {
    constructor() ERC20("FuncErrors", "FE") {}

    function mint(address account, uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than 0");
        _mint(account, amount);
    }

    function burn(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        assert(totalSupply() == totalSupply() - amount);
        _burn(msg.sender, amount);

    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
    require(amount > 0, "Amount must be greater than 0");
    if (amount < 20) {
        revert("Transfer failed: Amount must be at least 20");
    }
    require(balanceOf(msg.sender) >= amount, "Insufficient balance");
    _transfer(msg.sender, to, amount);
    return true;
}
}

