 pragma solidity ^0.4.21;
 
 import "zeppelin-solidity/contracts/ownership/Ownable.sol";
  
  
//Interface for accidentally send ERC20 tokens
interface accidentallyERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
}

/**
 * @title AccidentallyTokens
 * @dev Owner can transfer out any accidentally sent ERC20 tokens.
 */
contract AccidentallyTokens is Ownable {
  
    function transferAnyERC20Token(address tokenAddress,address _to, uint _value) public onlyOwner returns (bool) {
      require(_to != address(this));
      require(tokenAddress != address(0));
      require(_to != address(0));
      return accidentallyERC20(tokenAddress).transfer(_to,_value);
    }
}  
