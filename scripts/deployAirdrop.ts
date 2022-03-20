import { ethers } from "hardhat";

async function mainAcc() {
  // deploys the airdrop contract
  //   const token = await ethers.getContractFactory("ClaimToken");

  //   const Mytoken = await token.deploy(addressOfToken, merkleRootofAirdropContract);

  //   await myToken.deployed();
  // const owner = "0xD82faA5Fa56129569D9a6A547C09ff82B532602b";
  // const root ="0x4a3dd90a105fbc0d2cd044e27f85df84c73211667974a8fefb85bb806dd81127";

  const token = await ethers.getContractAt(
    "ClaimToken",
    "0x92aa9534Be7a80311918075E44670c821B341050"
  );
  const Mytoken = await token.deployed();

  const claimerAddress = "0x2b31e7c64c803494d932ccd719eed086636c8154";
  // this function allows an account that has been verified to be able to claim the contract.
  await Mytoken.claimForAddress(claimerAddress, 0, 1000000, [
    "0xd95ff6ced934d1ac69d5183112c7059467ca71b78a97afcf4884e60035781d5a",
  ]);
  console.log(Mytoken.address);
}

mainAcc().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
