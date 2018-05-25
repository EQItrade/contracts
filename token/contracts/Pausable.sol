pragma solidity ^0.4.21;


import "./AdvancedOwnable.sol";


/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is AdvancedOwnable {
  event Pause();
  event Unpause();

  bool public paused = false;

  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is paused.
   */
  modifier whenPaused() {
    require(paused);
    _;
  }
  
  /**
   * @dev Modifier to make a function callable only for owner and saleAgent when the contract is paused.
   */
   modifier onlyWhenNotPaused() {
     if(owner != msg.sender && saleAgent != msg.sender) {
       require (!paused);
     }
    _;
   }
  
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwnerOrSaleAgent whenNotPaused public {                  
    paused = true;
    emit Pause();                                                               
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function unpause() onlyOwnerOrSaleAgent whenPaused public {                   
    paused = false;
    emit Unpause();                                                             
  }
}

