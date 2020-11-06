pragma solidity ^0.5.2;

contract Pizza{
    function make() external returns (string memory);
    function setvalue(uint addvalue) public;
    function getvalue() public view returns (uint);
}

contract PizzaFrango is Pizza {
    uint private value = 10;
    function make() public returns(string memory){
        return ("Pizza de Frango");
    }
    
    function setvalue(uint addvalue) public{
        value = value + addvalue;
    }
    
    function getvalue() public view returns (uint){
        return value;
    }
}

contract PizzaCalabresa is Pizza {
    uint private value = 10;
    constructor () public{
        make();
    }
    function make() public returns(string memory){
        return ("Pizza de Calabresa");
    }
    function setvalue(uint addvalue) public{
        value = value + addvalue;
    }
    
    function getvalue() public view returns (uint){
        return value;
    }
}

contract PizzaCarbonara is Pizza {
    uint private value = 10;
    constructor () public{
        make();
    }
    function make() public returns(string memory){
        return ("Pizza de Carbonara");
    }
    function setvalue(uint addvalue) public{
        value = value + addvalue;
    }
    
    function getvalue() public view returns (uint){
        return value;
    }
}

contract Decorator is Pizza{
    Pizza public base;

    constructor (Pizza pizzaentrada) public{
        base = pizzaentrada;
    }
    
    function setvalue(uint addvalue) public{
        base.setvalue(addvalue);
    }
    function getvalue() public view returns(uint){
        return base.getvalue();
    }
    function make() external returns (string memory){
        return "";    
    }
}

contract QueijoExtra is Decorator{
    Pizza public base;
    
    constructor(Pizza p) public{
        base = p;
    }
    
    function setvalue () public{
        base.setvalue(3);
    }
    function getvalue() public view returns(uint){
        return base.getvalue();
    }
    function make() external returns (string memory){
        return "Queijo Extra adicionado";    
    }
}
