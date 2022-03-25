const hre = require("hardhat");

async function main() {
  const HDexTwo = await hre.ethers.getContractFactory("HDexTwo");
  const hDexTwo = await HDexTwo.deploy();
  await hDexTwo.deployed();

  console.log("HDexTwo deployed to:", hDexTwo.address);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
