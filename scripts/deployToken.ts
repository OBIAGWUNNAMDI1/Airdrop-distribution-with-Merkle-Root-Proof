import { ethers } from "hardhat";

async function mainAcc() {
  //   const ClaimTokens = await ethers.getContractFactory("ClaimToken");

  //   const claimtoken = await ClaimTokens.deploy();

  //   await claimtoken.deployed();
  const owner = "0x2B31e7c64C803494D932CCd719eED086636c8154";
  const ownerSigner = await ethers.getSigner(owner);
  const tokenAddress = "0xD82faA5Fa56129569D9a6A547C09ff82B532602b";
  const token = await ethers.getContractAt("Token", tokenAddress, ownerSigner);
  const MyToken = await token.deployed();
  console.log(MyToken.address);
  const ApprovedUser = "0x1046C36531aA392fD382286f6a01E47E63Df213B";
  const amountApproved = "20000000000000000000000";
  console.log(await MyToken.allowance(owner, ApprovedUser));
  console.log(await MyToken.approve(ApprovedUser, amountApproved));
  // .log(claimtoken.address);
}

mainAcc().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
