pragma solidity ^0.4.21;

import "./SafeCheckToken.sol";
import "./AccidentallyTokens.sol";

/**
 * @title MainToken
 * @dev  ERC20 Token contract, where all tokens are send to the Token Wallet Holder.
 */
contract MainToken is SafeCheckToken,AccidentallyTokens {
    
  address public TokenWalletHolder;
  
  string public constant name = "EQI Token";
  string public constant symbol = "EQI"; 
  uint8 public constant decimals = 18; 

  uint256 public constant INITIAL_SUPPLY = 880000000 * (10 ** uint256(decimals));

  /**
   * @dev Constructor that gives TokenWalletHolder all of existing tokens.
   */
  function MainToken(address _TokenWalletHolder) public {
    require(_TokenWalletHolder != address(0));
    TokenWalletHolder = _TokenWalletHolder;
    totalSupply_ = INITIAL_SUPPLY;
    balances[TokenWalletHolder] = INITIAL_SUPPLY;
    emit Transfer(address(this), msg.sender, INITIAL_SUPPLY);
  }
   
  /**
   * @dev  Don't accept ETH.
   */
  function () public payable {
    revert();
  }

}

