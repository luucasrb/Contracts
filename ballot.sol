pragma solidity ^0.5.0;

contract EtherTransferTo{
    function () external payable{}
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}

contract EtherTransferFrom{
    
    EtherTransferTo public _instance;
    
    constructor () public{
        _instance = new EtherTransferTo();
    }
    
    function getBalance () public view returns(uint){
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public view returns(uint){
        // return address(_instance).balance;
        return _instance.getBalance();
    }
    
    function () external payable{
        address(_instance).transfer(msg.value);
    }
}
