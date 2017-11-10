contract HelloSolidity{  // The contract definition. A constructor of the same name will be automatically called on contract creation. 
    address creator; //using this an empty "address"-type variable of the name "creator". Will be set in the constructor,address cant be changed further
    string greeting; ////using this an empty "string"-type variable of the name "greeting". Will be set in the constructor,can be change
    
    function Greeter(string _greeting) public //The constructor. It accepts a string input and saves it to the contract's "greeting" variable.
    {
        creator = msg.sender;
        greeting = _greeting;
    }
     function greet() constant returns (string)          
    {
        return greeting;
    }
}
