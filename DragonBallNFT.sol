// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DragonBalls is ERC721{
    //public domain store NFT minted 
    using Strings for uint256;
    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;
    string public domain ="https://miniswap.herokuapp.com/character/detail";
    constructor(string memory name,string memory symbol) ERC721(name,symbol){
        
    }
     function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }
    function tokenURI(uint256 _tokenId) public  view  virtual  override returns (string memory){
        require(_exists(_tokenId),"Sorry, token ID is not available!!!"); // NFT doesn't exists
        if(bytes(domain).length>0){
            return  string(abi.encodePacked(domain,_tokenId.toString()));
        } else
         {
            return "";
            }
    }
    function taoNhanVat(address to, uint256 tokenId) external{
        _mint(to,tokenId);

    }
    
}