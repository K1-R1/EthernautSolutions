async function main() {
    const HReentrance = await hre.ethers.getContractFactory("HReentrance");
    const hreentrance = await HReentrance.deploy({ value: 200000000000000000n });
    await hreentrance.deployed();
    console.log(`Contract deployed to: ${hreentrance.address}`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
