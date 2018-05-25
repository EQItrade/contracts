pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";
/**
 * @title AdvancedOwnable
 * @dev The AdvancedOwnable contract provides advanced authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract AdvancedOwnable is Ownable {

  address public saleAgent;                                                   
  address internal managerAgent;

  /**
   * @dev The AdvancedOwnable constructor sets saleAgent and managerAgent.
   * @dev Until the owner has been given a new address, the address will be assigned to the owner.
   */
  function AdvancedOwnable() public {
    saleAgent=owner;
    managerAgent=owner;
  }
  modifier onlyOwnerOrManagerAgent {
    require(owner == msg.sender || managerAgent == msg.sender);
    _;
  }
  modifier onlyOwnerOrSaleAgent {
    require(owner == msg.sender || saleAgent == msg.sender);
    _;
  }
  function setSaleAgent(address newSaleAgent) public onlyOwner {
    require(newSaleAgent != address(0));
    saleAgent = newSaleAgent;
  }
  function setManagerAgent(address newManagerAgent) public onlyOwner {
    require(newManagerAgent != address(0));
    managerAgent = newManagerAgent;
  }

}
