Remittense : Alice want to send some money to bob. alice is having INR with him but bob wants the money in his local currrency. fortunately coral is running his exchange where they can convirt the money. we have to write a smart contract in which if the sender and reciever currency is same then simply amount to be transfer will be added to reciever account and debited froms sender's account. but if both currency differs then the money will transferred in recievers account after conversion.
pragma solidity ^0.4.18;
contract remitense{
    uint alice;
    uint bob;
    uint coral;
    string alicecurrency;
    string bobcurrency;
    uint amount;
    uint bobupdated;
    uint aliceupdated;
    uint currentValue;
    uint amountafterconversion;
        function getMoneynCurrency(uint _alice,uint _bob,string alicecurrency,string bobcurrency) {
        bob = _bob;
        alice = _alice;
    }
    
    function result() constant public returns(uint,uint,string,string){
        return(alice,bob,alicecurrency,bobcurrency);}

    function compareStrings (string alicecurrency, string bobcurrency,uint _amount,uint _currentValue) //compute the Ethereum-SHA-3 (Keccak-256) hash of the (tightly packed) arguments
    {
      bool value = keccak256(alicecurrency) == keccak256(bobcurrency);
      if (value == true) {
           bob = bob + _amount;
           alice= alice - _amount;
             } 
      else {
          amountafterconversion = _amount * _currentValue;
          bob = bob + amountafterconversion;
          alice = alice - _amount;
           
      }
   }
}
