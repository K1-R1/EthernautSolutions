const hre = require("hardhat");

async function main() {
  const HGatekeeperTwo = await hre.ethers.getContractFactory("HGatekeeperTwo");
  const hGatekeeperTwo = await HGatekeeperTwo.deploy();

  await hGatekeeperTwo.deployed();

  console.log("HGatekeeperTwo deployed to:", hGatekeeperTwo.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
