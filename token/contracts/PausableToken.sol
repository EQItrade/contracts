pragma solidity ^0.4.21;


import "./Pausable.sol";
import "./BlackListToken.sol";

/**
 * @title Pausable token
 * @dev BlackListToken modified with pausable transfers.
 **/
contract PausableToken is Pausable,BlackListToken {

  function transfer(address _to, uint256 _value) public onlyWhenNotPaused returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public onlyWhenNotPaused returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(address _spender, uint256 _value) public onlyWhenNotPaused returns (bool) {
    return super.approve(_spender, _value);
  }

  function increaseApproval(address _spender, uint _addedValue) public onlyWhenNotPaused returns (bool) {
    return super.increaseApproval(_spender, _addedValue);
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public onlyWhenNotPaused returns (bool) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }

  function burn(uint256 _value) public onlyWhenNotPaused {
   super.burn( _value);
  }

  function burnFrom(address _from, uint256 _value) public onlyWhenNotPaused {
   super.burnFrom( _from, _value);
  }
  
}
