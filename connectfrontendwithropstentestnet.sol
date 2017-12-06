Coursetro.sol:
pragma solidity ^0.4.18;

contract Owned {
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}

contract Courses is Owned {
    
    struct Instructor {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    
    mapping (address => Instructor) instructors;
    address[] public instructorAccts;
    
    event instructorInfo(
       bytes16 fName,
       bytes16 lName,
       uint age
    );
    
    function setInstructor(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        var instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        instructorAccts.push(_address) -1;
        instructorInfo(_fName, _lName, _age);
    }
    
    function getInstructors() view public returns(address[]) {
        return instructorAccts;
    }
    
    function getInstructor(address _address) view public returns (uint, bytes16, bytes16) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    
}

index.html:
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
                <span id="countIns"></span>
        
                <h2 id="instructor"></h2>
                <span id="insTrans"></span>
                <hr>
        
                <img id="loader" src="https://loading.io/spinners/double-ring/lg.double-ring-spinner.gif">
        
                <label for="fName" class="col-lg-2 control-label">First Name</label>
                <input id="fName" type="text">
        
                <label for="lName" class="col-lg-2 control-label">Last Name</label>
                <input id="lName" type="text">
        
                <label for="age" class="col-lg-2 control-label">Instructor Age</label>
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
        var CoursetroContract = web3.eth.contract([{"constant":true,"inputs":[{"name":"_address","type":"address"}],"name":"getInstructor","outputs":[{"name":"","type":"uint256"},{"name":"","type":"bytes16"},{"name":"","type":"bytes16"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getInstructors","outputs":[{"name":"","type":"address[]"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"instructorAccts","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"countInstructors","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_address","type":"address"},{"name":"_age","type":"uint256"},{"name":"_fName","type":"bytes16"},{"name":"_lName","type":"bytes16"}],"name":"setInstructor","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"anonymous":false,"inputs":[{"indexed":false,"name":"fName","type":"bytes16"},{"indexed":false,"name":"lName","type":"bytes16"},{"indexed":false,"name":"age","type":"uint256"}],"name":"instructorInfo","type":"event"}]);
        var Coursetro = CoursetroContract.at('0x944d85D9010517c35b16163eA12E0d0d59A57018');

        
        console.log(Coursetro);
        var instructorEvent = Coursetro.instructorInfo({},'latest');
        instructorEvent.watch(function (err, result) {
            if (!err) {
                if (result.blockHash != $("#instrans").html()) 
                    $("#loader").hide();
                    
                $("#insTrans").html('Block hash: ' +result.blockHash);
                $("#instructor").html(web3.toAscii(result.args.fName) + ' ' + web3.toAscii(result.args.lName) + ' (' + result.args.age + ' years old)');
            } else {
                $("#loader").hide();
            }
        });
        Coursetro.countInstructors((err, res) => {
    if (res)
        $("#countIns").html(res.c + ' Instructors'); 
});
    $("#button").click(function() {
    $("#loader").show();
    Coursetro.setInstructor(web3.eth.defaultAccount, $("#age").val(), $("#fName").val(),$("#lName").val(), (err, res) => {
        if (err) 
            $("#loader").hide();
});
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

package.json:
{
  "name": "deepak",
  "version": "1.0.0",
  "description": "",
  "main": "truffle-config.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "dev": "lite-server",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "web3": "github:ethereum/web3.js"
  },
  "devDependencies": {
    "lite-server": "^2.3.0"
  }
}
