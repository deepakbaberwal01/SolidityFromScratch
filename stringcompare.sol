pragma solidity ^0.4.18;
contract TwoD {

address creater;
string a;
string b;

function compareStrings (string a, string b) view returns (bool) //compute the Ethereum-SHA-3 (Keccak-256) hash of the (tightly packed) arguments
    {
       return keccak256(a) == keccak256(b);
   }
}
