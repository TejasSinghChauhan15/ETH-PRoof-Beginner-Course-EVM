pragma solidity ^0.4.18;

contract MyToken {
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    function MyToken(string _name, string _symbol, uint256 _initialSupply) public {
        tokenName = _name;
        tokenSymbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function mint(address _recipient, uint256 _amount) public {
        require(_amount > 0);
        totalSupply += _amount;
        balances[_recipient] += _amount;
    }

    function burn(address _holder, uint256 _amount) public {
        require(_amount > 0);
        require(balances[_holder] >= _amount);
        totalSupply -= _amount;
        balances[_holder] -= _amount;
    }
}
