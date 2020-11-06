pragma solidity ^0.5.1;

contract Banco{
    uint private saldo;
    address private dono; 
    
    constructor(uint valor) public{
        saldo = valor;
        dono = msg.sender; 
    }
    function deposito (uint valor) public{
        require (dono == msg.sender);
        saldo += valor;
    }
    function saque (uint valor) public{
        if(saldo >= valor){
            saldo -= valor;
        }
    }
    function verificaSaldo () public view returns (uint){
        return saldo;   
    }
}

contract MinhaConta is Banco(20 ether){
    string private nome; 
    uint private idade; 
    
    constructor (string memory _nome, uint _idade) public{
        nome = _nome;
        idade = _idade;
    }
    
    function getNome() public view returns (string memory){
        return nome;
    }
    
    function getIdade() public view returns (uint){
        return idade;
    }
}
