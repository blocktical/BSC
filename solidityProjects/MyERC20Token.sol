pragma solidity ^0.5.9;

contract MyERC20Token {

string name;
string symbol;
uint8 decimals;
uint256 totalSupply_;
mapping(address => uint256) balances;
mapping(address => mapping (address => uint256)) allowed;
mapping(address => uint256 ) temp;

event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
event Transfer(address indexed from, address indexed to, uint tokens);

constructor(string memory _name, string memory _symbol, uint8 decimal, uint256 total) public {
    name = _name;
    symbol = _symbol;
    decimals = decimal;
    totalSupply_ = total;
    balances[msg.sender] = totalSupply_;
    }

function getName() public view returns (string memory) {
    return name;
    }
function getSymbol() public view returns (string memory) {
    return symbol;
    }
function getDecimals() public view returns (uint8){
    return decimals;
    }
function totalSupply() public view returns (uint256){
    return totalSupply_;
}
function balanceOf(address _owner) public view returns (uint256 balance){
    return balances[_owner];
    }
function transfer(address _to, uint256 _value) public returns (bool success){
    require(balances[msg.sender] >= _value, 'Not enough balance present in the account.');
    emit Transfer(msg.sender, _to, _value);
    balances[msg.sender]-=_value;
    balances[_to]+=_value;
    return true;
    }
function approve(address _spender, uint256 _value) public returns (bool success){
    require(balances[msg.sender] >= _value, 'Not enough balance present in the account.');
    emit Approval(msg.sender,_spender,_value);
    allowed[msg.sender][_spender] = _value;
    return true;
}
function allowance(address _owner, address _spender) public view returns (uint256 remaining){
    require(allowed[_owner][_spender] > 0, 'Zero Balance Allowed to Spent');
    return allowed[_owner][_spender];
    }
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
    require(allowed[_from][msg.sender] >= _value, 'Not Enough Balance Allowed to Spent');
    allowed[_from][msg.sender]-=_value;
    return transferFromInternal(_from,_to,_value);
    }
function transferFromInternal(address _from, address _to, uint256 _value) private returns (bool success){
    require(balances[_from] >= _value, 'Not enough balance present in the account.');
    emit Transfer(_from, _to, _value);
    balances[_from]-=_value;
    balances[_to]+=_value;
    return true;
    }

}
