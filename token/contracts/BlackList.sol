pragma solidity ^0.4.21;

import "./AdvancedOwnable.sol";
/**
   * @title blacklist
   * @dev The blacklist contract has a blacklist of addresses, and provides basic authorization control functions.
   * @dev This simplifies the implementation of "user permissions".
   */
contract BlackList is AdvancedOwnable {

    mapping (address => bool) internal blacklist;
    event BlacklistedAddressAdded(address indexed _address);
    event BlacklistedAddressRemoved(address indexed _address);
    
   /**
    * @dev Modifier to make a function callable only when the address is not in black list.
    */
   modifier notInBlackList() {
     require(!blacklist[msg.sender]);
     _;
   }
  
   /**
    * @dev Modifier to make a function callable only when the address is not in black list.
    */
   modifier onlyIfNotInBlackList(address _address) {
     require(!blacklist[_address]);
     _;
   }
   /**
    * @dev Modifier to make a function callable only when the address is in black list.
    */
   modifier onlyIfInBlackList(address _address) {
     require(blacklist[_address]);
     _;
   } 
 /**
   * @dev add an address to the blacklist
   * @param _address address
   * @return true if the address was added to the blacklist, 
   * false if the address was already in the blacklist 
   */
   function addAddressToBlacklist(address _address) public onlyOwnerOrManagerAgent onlyIfNotInBlackList(_address) returns(bool) {
     blacklist[_address] = true;
     emit BlacklistedAddressAdded(_address);
     return true;
   }
 /**
   * @dev remove addresses from the blacklist
   * @param _address address
   * @return true if  address was removed from the blacklist, 
   * false if address weren't in the blacklist in the first place
   */
  function removeAddressFromBlacklist(address _address) public onlyOwnerOrManagerAgent onlyIfInBlackList(_address) returns(bool) {
    blacklist[_address] = false;
    emit BlacklistedAddressRemoved(_address);
    return true;
  }
}