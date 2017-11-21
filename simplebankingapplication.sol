pragma solidity ^0.4.18;
contract bank{
    address owner;
    uint totalAmount;
    uint depositAmount;
    uint withdrawlAmount;
    uint totalAmountAfterDeposit;
    uint totalAmountAfterWithdrawl;
    
    function bank(){
        owner = msg.sender;
    }
    
    function deposit(uint _totalAmount,uint _depositAmount) returns(uint,uint){
        if(_depositAmount>0 && _totalAmount>0)
        {
        depositAmount = _depositAmount;
        totalAmount = _totalAmount + depositAmount;
        return(totalAmount,depositAmount);
        }
    }
    
    function amountAfterDeposit() constant public returns(uint){
        return(totalAmount);}
    
   function withdrawl(uint withdrawlAmount) public returns(uint)
   {
       if(totalAmount>withdrawlAmount||withdrawlAmount==0)
       {
        totalAmountAfterWithdrawl = totalAmount - withdrawlAmount;
        return(totalAmountAfterWithdrawl);
       }
       
    }
    function amountAfterWithdrawl() constant public returns(uint){
        return(totalAmountAfterWithdrawl);}
    
    
    function kill(){
        if(msg.sender == owner){
            selfdestruct(owner);
        }
    }
    
    
    
    
}
