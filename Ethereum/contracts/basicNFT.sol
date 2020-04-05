pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";

import "@openzeppelin/contracts/ownership/Ownable.sol";

contract MaskNFT is ERC721Full,Ownable{
    mapping(uint=>uint) public LocationData;
    mapping(uint=>uint)  DonationValue;
    uint minimum;
    uint Tokens;
    event Donation(uint Location,uint value,address user);

    constructor() ERC721Full("MasksForHope", "MFH") public {
    }

    function Mint(uint _location,uint _value,address _buyer) public payable {
        require(msg.value>minimum);
        
        emit Donation(_location,_value,_buyer);
        Tokens++;
        _mint(_buyer,Tokens);
        LocationData[Tokens]=_location;
    }
   
    function setTokenURI(uint256 tokenId, string memory _tokenURI) public onlyOwner {
       _setTokenURI( tokenId,  _tokenURI);
    }

    /**
     * @dev Internal function to set the base URI for all token IDs. It is
     * automatically added as a prefix to the value returned in {tokenURI}.
     */
    function setBaseURI(string memory baseURI)  public onlyOwner{
        _setBaseURI( baseURI);
    }






}