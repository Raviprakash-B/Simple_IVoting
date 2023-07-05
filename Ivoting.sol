//SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.5.0 <=0.9.0;

interface Ivoting{
    //In tnterface function always should be external
    //Vote,totalvotes,validcandidate
    function voteForCandidate(bytes32 candidate) external;
    function totalvotes(bytes32 candidate) external view returns(uint);
    function validcandidate(bytes32  candidate) external view returns(bool);
}
