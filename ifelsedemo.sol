pragma solidity ^0.4.11;

contract test {
    address public creater ;
    uint public check;

    function test() payable public {
        creater = msg.sender;
            }

    function testing(int check) payable returns (bool) {  //here if i use uint check then when testing with negetive values it will show error that negetive values are in use so we have to take int on the place of uint
        if (check > 0) 
        {
            return true;
        }
        else 
        {
            return false;
        }
    }
}
