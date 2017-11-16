pragma solidity ^0.4.18;
contract SimpleStore {
  address creator;
  uint a = 1;
  uint b = 2;
  uint c;

  function addition() public {
    creator = msg.sender;
    c = a + b;
  }

  function getResult() constant public returns (uint) {
    return c; // should return 3
  }

  /**********
  Standard kill() function to recover funds 
  **********/

  function kill() public { 
    if (msg.sender == creator)
      selfdestruct(creator);  // kills this contract and sends remaining funds back to creator
  }
}
