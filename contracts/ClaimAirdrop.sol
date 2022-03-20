// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
import "./IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract ClaimToken{
    IERC20 TokenMer;
       
    bytes32 merkleRoot; //merkle root for the airdrop contract.
    mapping(address => bool) public claimed;

    event TokenClaim(address reciever, uint256 amount);
    constructor(address _tokenAddress, bytes32 _merkleRoot){
        TokenMer = IERC20(_tokenAddress);
        merkleRoot = _merkleRoot;
    }

    modifier notClaimed(){
        require(claimed[msg.sender] == false, "Already Claimed");
        _;
    }

    function claimForAddress(address _user, uint256 id,uint _amount,bytes32[] calldata _merkleProof) external notClaimed() returns(bool) {
    
        // Verify the merkle proof to ensure he can claim an airdrop.
        bytes32 node = keccak256(abi.encodePacked(msg.sender, id, _amount));

        require(MerkleProof.verify(_merkleProof, merkleRoot, node), "MerkleDistributor: Invalid proof.");
        

        // Mark it claimed and send the token.
        TokenMer.transfer(msg.sender, _amount);
        //only emit when successful
        emit TokenClaim(msg.sender, _amount);
        return true;
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

     fallback() external payable {
    }



    


}
