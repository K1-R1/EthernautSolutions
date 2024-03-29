async function main() {
    const HackTelephone = await hre.ethers.getContractFactory("HackTelephone");
    const hackTelephone = await HackTelephone.deploy();
    await hackTelephone.deployed();
    console.log(`Contract deployed to: ${hackTelephone.address}`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
