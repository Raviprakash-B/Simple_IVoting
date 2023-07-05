//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 <=0.9.0;

import "./Ivoting.sol";
contract Voting is Ivoting{
    mapping (bytes32 => uint)  public votesRecieved; //if we use bytes then we can fetch the number of votes of that particular candidate
    bytes32[] public candidateList; // Store candidate list in an array of type bytes since it is string type

    constructor(bytes32[] memory candidatesNames){
        candidateList = candidatesNames;
    }

    function voteForCandidate(bytes32 candidate) public override{
        require(validcandidate(candidate)); //check whether the candidate is valid
        votesRecieved[candidate] +=1 ;  //Using mapping variable we can store the votes //votesrecieved of the candidate
    }

    function validcandidate(bytes32 candidate) view public override returns(bool){
        //checking if the candidste is present in the candidatelist
        for(uint i=0;i<candidateList.length; i++) 
        {
            if(candidateList[i] == candidate)
            { 
                return true;
            }
            else{ 
                return false;
            }
        }
    }
    function totalvotes(bytes32 candidate) view public override returns(uint)
    {
        //check whether the candidate is valid or not
        require(validcandidate(candidate));
        return votesRecieved[candidate];  //votes recieved by the candidate
    }
    
}
