pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/token/ERC20/StandardBurnableToken.sol";                                                

 /**
    * @title Safe Approve
    * @dev  `msg.sender` approves `_spender` to spend `_amount` tokens on
    *  its behalf. This is a modified version of the ERC20 approve function
    *  to be a little bit safer
    */
contract SafeApprove is StandardBurnableToken { 
    
   /** 
    *  @param _spender The address of the account able to transfer the tokens
    *  @param _value The value of tokens to be approved for transfer
    *  @return True if the approval was successful
    **/
  function approve(address _spender, uint256 _value) public  returns (bool) {
    //  To change the approve amount you first have to reduce the addresses`
    //  allowance to zero by calling `approve(_spender,0)` if it is not
    //  already 0 to mitigate the race condition described here:
    //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    require((_value == 0) || (allowed[msg.sender][_spender] == 0));
    return super.approve(_spender, _value);
  }
}
