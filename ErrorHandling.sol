// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HandleErrors {

    // public variables here
    string public tokenName = "DioshuaToken";
    string public tokenAbbreviation = "DT";
    uint public totalSupply = 0;
    uint public minimumMintable = 100;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address _address, uint _value) public {
        
        // implementing a require() statement
        require(_address == msg.sender, "Only the token owner can mint tokens");

        // implementing a revert statement
        if (_value < minimumMintable) {
            revert("Minimum amount of token mintable must be matched or exceeded");
        } else {
            totalSupply += _value;
            balances[_address] += _value;
        }         
    }

    // burn function
    function burn(address _address, uint _value) public {

        // implementing an assert() statement
        assert(balances[_address] >= _value);
        totalSupply -= _value;
        balances[_address] -= _value;
    }    
}
