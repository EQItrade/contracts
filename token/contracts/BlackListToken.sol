pragma solidity ^0.4.21;

import "./BlackList.sol";
import "./SafeApprove.sol";

  /**
   * @title BlackList Token
   * @dev Throws if called by any account that's in blackList.
   */
contract BlackListToken is BlackList,SafeApprove {

  function transfer(address _to, uint256 _value) public notInBlackList returns (bool) {
    return super.transfer(_to, _value);
  }

  function transferFrom(address _from, address _to, uint256 _value) public notInBlackList returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  function approve(address _spender, uint256 _value) public notInBlackList returns (bool) {
    return super.approve(_spender, _value);
  }

  function increaseApproval(address _spender, uint _addedValue) public notInBlackList returns (bool) {
    return super.increaseApproval(_spender, _addedValue);
  }

  function decreaseApproval(address _spender, uint _subtractedValue) public notInBlackList returns (bool) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }

  function burn(uint256 _value) public notInBlackList {
   super.burn( _value);
  }

  function burnFrom(address _from, uint256 _value) public notInBlackList {
   super.burnFrom( _from, _value);
  }

}
