Problem Statement : Alice, Bob and Coral are 3 persons. we can see balances of all 3. if Alice sends some ether to Bob and Coral. Half of the ether credited in bob's account and half of the ether credited in coral's account. show the remaining money in all 3 persons.
 Code :
pragma solidity ^0.4.18;
contract SimpleStore {
  address creator;
  uint alice;
  uint bob;
  uint coral;
  uint aliceUpdated;
  uint bobUpdated;
  uint coralUpdated;

  function getInitialBalance(uint alice,uint bob,uint coral) public {
    creator = msg.sender;
    aliceUpdated = alice;
    bobUpdated = bob;
    coralUpdated = coral;
  }
  
  function sendAliceEther(uint amount) public{
     
      aliceUpdated = aliceUpdated - amount;
      uint amount1 = amount/2;
      bobUpdated = bobUpdated + amount1;
      coralUpdated = coralUpdated + amount1;
  }

  function getResult() constant public returns (uint,uint,uint) {
    return(aliceUpdated,bobUpdated,coralUpdated);
  }

  /**********
  Standard kill() function to recover funds 
  **********/

  function kill() public { 
    if (msg.sender == creator)
      selfdestruct(creator);  // kills this contract and sends remaining funds back to creator
  }
}
