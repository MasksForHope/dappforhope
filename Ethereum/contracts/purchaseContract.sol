pragma solidity ^0.5.0;
import "@openzeppelin/contracts/ownership/Ownable.sol";

contract Payment is Ownable{
    event Donated(uint location,address buyer,uint value);
    address payable Wallet;
    uint public minimumWei;
    mapping(uint=>bool) public ValidLocations;
    mapping(address=>uint) public Donations;

    constructor(address payable _wallet,uint _price) public{
        Wallet=_wallet;
        

    }
    function Purchase(uint _location) external payable{
        require(msg.value>minimumWei);
        require(ValidLocations[_location]);
        emit Donated(_location,msg.sender,msg.value);
        
        Wallet.transfer(msg.value);
    }


    function setWallet(address payable w) public  onlyOwner{
          Wallet=w;
    }

     function setMiniumum(uint _value) public  onlyOwner{
         minimumWei=_value;
    }




}