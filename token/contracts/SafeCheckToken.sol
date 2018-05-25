pragma solidity ^0.4.21;

import "./PausableToken.sol";

/**
 * @title SafeCheckToken
 * @dev More secure functionality.
 */
contract SafeCheckToken is PausableToken {


    function transfer(address _to, uint256 _value) public returns (bool) {
      // Do not send tokens to this contract
      require(_to != address(this));
      // Check  Short Address
      require(msg.data.length >= 68);
      // Check Value is not zero
      require(_value != 0);

      return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
      // Do not send tokens to this contract
      require(_to != address(this));
      // Check  Short Address
      require(msg.data.length >= 68);
      // Check  Address from is not zero
      require(_from != address(0));
      // Check Value is not zero
      require(_value != 0);

      return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
      // Check  Short Address
      require(msg.data.length >= 68);
      return super.approve(_spender, _value);
    }

    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
      // Check  Short Address
      require(msg.data.length >= 68);
      return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
      // Check  Short Address
      require(msg.data.length >= 68);
      return super.decreaseApproval(_spender, _subtractedValue);
    }

    function burn(uint256 _value) public {
      // Check Value is not zero
      require(_value != 0);
      super.burn( _value);
    }

    function burnFrom(address _from, uint256 _value) public {
      // Check  Short Address
      require(msg.data.length >= 68);
      // Check Value is not zero
      require(_value != 0);
      super.burnFrom( _from, _value);
    }

}
