require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-web3");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

require('dotenv').config()
const PK1 = process.env.PK1
const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL
const ETHERSCAN_API = process.env.ETHERSCAN_API

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.6.0",
  defaultNetwork: "rinkeby",
  networks: {
    rinkeby: {
      url: RINKEBY_RPC_URL,
      accounts: [PK1]
    }
  },
  etherscan: {
    apiKey: ETHERSCAN_API
  }
};