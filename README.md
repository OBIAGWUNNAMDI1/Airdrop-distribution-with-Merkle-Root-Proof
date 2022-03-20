# Airdrop distribution with Merkle Root Proof.

This project demonstrates how to use a merkle root proof to confirm an address that can claim airdrop from an airdrop contract.Using varioius advanced Hardhat use case such as mainnet forking to local network, integrating other tools commonly used alongside Hardhat in the ecosystem.

The project comes with a claimAirdrop, an IERC20 token, scripts for deploying both the token and airdrop contracts a test for that contract It also comes with a variety of other tools, preconfigured to work with the project code.


# STEPS NEEDED FOR THE AIRDROP CLAIMS WITH AN ADDRESS THAT HAS A MERKLE PROOF.
# Contracts Folder has two major files.
IERC20.sol that creates the airdrop token we want to use which is BRT token deployed on this address 0xD82faA5Fa56129569D9a6A547C09ff82B532602b on polygon testnet.
ClaimAirdrop.sol that creates the contract for airdrop claims deployed on polygon testnet0x92aa9534Be7a80311918075E44670c821B341050

# Script folder has three major files.
deployToken.ts which deploys the token
deployAirdrop which deploys the claim contract and allows users who has a merkleproof to claim their airdrop.
merkle.js is the scripts that does the proof and stores it.
