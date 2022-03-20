const { ethers } = require("ethers");

async function main() {
    const HPrivacy = await hre.ethers.getContractFactory("HPrivacy");
    const hPrivacy = await HPrivacy.deploy();
    await hPrivacy.deployed();
    console.log(`Contract deployed to: ${hPrivacy.address}`)

    const provider = new ethers.providers.JsonRpcProvider(process.env.RINKEBY_RPC_URL);
    const data32 = await provider.getStorageAt('0x0F38b15E270aD7bF04D51d8091642dc39939345C', 5)
    console.log(`data32: ${data32}`)

    const data16 = await hPrivacy.castBytes(data32)
    console.log(`data16: ${data16}`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

// Slots
// 0. locked
// 1. ID
// 2. flattening, denom, awk
// 3. data[0]
// 4. data[1]
// 5. data[2]