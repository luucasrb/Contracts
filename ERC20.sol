pragma solidity ^0.5.1; 

interface ERC20interface {
    // definindo as funcoes
    function totalSupply() external view returns (uint _totalSupply);
    function balanceOf (address _owner) external view returns (uint balance);
    
    // transferencia direta
    function transfer (address _to, uint _value) external returns (bool succes);
    
    //transferencia indireta
    function transferFrom (address _from, address _to, uint _value) external returns (bool success);
    function approve (address _spender, uint _value) external returns (bool success);
    
    //retorna o valor autorizado a sacar
    function allowance (address _owner, address _spender) external view returns (uint remaining);
    
    // definindo eventos
    event Transfer (address indexed _from, address indexed _to, uint _value);
    event Approval (address indexed _owner, address indexed _spender, uint _value);
    
}

contract MeuToken is ERC20interface {
    
    string public name; 
    string public symbol; 
    uint public decimals;
    uint private __totalSupply;
    
    mapping (address => uint) private __balance;
    mapping (address => mapping (address => uint)) private __allowances; // vetor[dono][permissionado] = valor

    constructor () public{
        name = "Token da SAICC";
        symbol = "SAICC";
        decimals = 18;
        __totalSupply = 1000;
        __balance[msg.sender] = __totalSupply;
    }
    
    function totalSupply() public view returns (uint _totalSupply){
        return __totalSupply; 
    }
    
    function balanceOf (address _addr) public view returns (uint balance){
        return __balance[_addr];
    }
    
    function transfer(address _addr, uint _value) public returns (bool success){
        if (_value > 0 
        && balanceOf(msg.sender) >= _value
        ){
            __balance[msg.sender] -= _value; // sacamos o valor na origem
            __balance[_addr] += _value; // depositos o valor no destino
            return true;
            emit Transfer (msg.sender, _addr, _value);
        }
        return false;
    }
    
    function approve (address _spender, uint _value) public returns (bool success){
        __allowances[msg.sender][_spender] = _value;
        emit Approval (msg.sender, _spender, _value);
        return true;
    }
    
    function transferFrom (address _from, address _to, uint _value) public returns (bool success){
        if (__allowances[_from][_to] > 0
            && _value > 0 
            && __allowances[_from][_to] >= _value
            && __balance[_from] >= _value
        ){
            __balance[_from] -= _value;
            __balance[_to] += _value;
            __allowances[_from][_to] -= _value; 
            emit Transfer(_from, _to, _value);
            return true;
        }
        return false;
    }
    
    function allowance (address _owner, address _spender) public view returns (uint remaining){
        return __allowances[_owner][_spender];
    }
    
}
    
    
    
