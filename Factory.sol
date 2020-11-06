pragma solidity ^0.5.2;

contract Pizza{
    function make() external returns (string memory);
}

contract PizzaFrango is Pizza {
    function make() public returns(string memory){
        return ("Pizza de Frango");
    }
}

contract PizzaCalabresa is Pizza {
    constructor () public{
        make();
    }
    function make() public returns(string memory){
        return ("Pizza de Calabresa");
    }
}

contract PizzaCarbonara is Pizza {
    constructor () public{
        make();
    }
    function make() public returns(string memory){
        return ("Pizza de Carbonara");
    }
}


// Extensibilidade pode ser inviável //
contract PizzaFactory{
    string public nome;
    // mapping (Pizza => uint) map;
    Pizza[] public pizzas;
     
    constructor(string memory _nome) public{
        nome = _nome;
    }
    function CreatePizza (string memory sabor) public returns (Pizza){
        if (keccak256 (bytes(sabor)) == keccak256(bytes("Frango"))){ 
            PizzaFrango novaPizza = new PizzaFrango();
            pizzas.push(novaPizza);
            // map[novaPizza] = pizzas.length;
            return novaPizza;
        }
        if (keccak256 (bytes(sabor)) == keccak256(bytes("Calabresa"))){ 
            PizzaCalabresa novaPizza = new PizzaCalabresa();
            pizzas.push(novaPizza);
            return novaPizza;
        }
        if (keccak256 (bytes(sabor)) == keccak256(bytes("Carbonara"))){ 
            PizzaCarbonara novaPizza = new PizzaCarbonara();
            pizzas.push(novaPizza);
            return novaPizza;
        }
    }
    
    function checkPizza(uint index) public view returns (Pizza){ 
        return pizzas[index];
    }
    function checkType(uint index) public returns (string memory){ // adicionei o index
        return pizzas[index].make();
    }
}
