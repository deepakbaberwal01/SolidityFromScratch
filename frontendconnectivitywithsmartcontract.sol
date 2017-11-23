Coursetro.sol:
pragma solidity ^0.4.18;
contract Coursetro{
    string public fname;
    uint public age;
    
       function setInstructor(string _fname,uint _age) public{ //demo is constructor function
        fname = _fname;
        age = _age;
                    }
    function getInstructor() public constant returns(string,uint){
        return(fname,age);
    }
}

index.html file :
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="main.css">

    <script src="./node_modules/web3/dist/web3.min.js"></script>

</head>
<body>
    <div class="container">

        <h1>Coursetro Instructor</h1>

        <h2 id="instructor"></h2>

        <label for="name" class="col-lg-2 control-label">Instructor Name</label>
        <input id="name" type="text">

        <label for="name" class="col-lg-2 control-label">Instructor Age</label>
        <input id="age" type="text">

        <button id="button">Update Instructor</button>


    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

    <script>

        if (typeof web3 !== 'undefined') {
            web3 = new Web3(web3.currentProvider);
        } else {
            // set the provider you want from Web3.providers
            web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
        }
        web3.eth.defaultAccount = web3.eth.accounts[0];
        var CoursetroContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"_fname","type":"string"},{"name":"_age","type":"uint256"}],"name":"setInstructor","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"age","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getInstructor","outputs":[{"name":"","type":"string"},{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"fname","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"}]);
        var Coursetro = CoursetroContract.at('0xd36f796883c724d0228e95a29a04a85aed1005f8');
        console.log(Coursetro);

        Coursetro.getInstructor(function(error, result){
            if(!error)
                {
                    $("#instructor").html(result[0]+' ('+result[1]+' years old)');
                    console.log(result);
                }
            else
                console.error(error);
        });

        $("#button").click(function() {
            Coursetro.setInstructor($("#name").val(), $("#age").val());
        });


    </script>

</body>
</html>

main.css:
body {
    background-color:#F0F0F0;
    padding: 2em;
    font-family: 'Raleway','Source Sans Pro', 'Arial';
}
.container {
    width: 50%;
    margin: 0 auto;
}
label {
    display:block;
    margin-bottom:10px;
}
input {
    padding:10px;
    width: 50%;
    margin-bottom: 1em;
}
button {
    margin: 2em 0;
    padding: 1em 4em;
    display:block;
}

#instructor {
    padding:1em;
    background-color:#fff;
    margin: 1em 0;
}
#loader {
    width: 100px;
    display:none;
}
