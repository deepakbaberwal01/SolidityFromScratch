/* pragma solidity ^0.4.18; //this line shows solidity version to compilor
contract SimpleStorage { //here we have created a new contract SimpelStorage
    uint storedData; //here we have declared a variable of integer type called storedData

    function set(uint x) { //set function is used to take values from user
        storedData = x; //here we have passed the value taken from user to varibale storeddata
    }

    function get() constant returns (uint) { //get function is used to return/print same variable as output,constant can be ommitted
        return storedData; //here we have return the value
    }
} */
