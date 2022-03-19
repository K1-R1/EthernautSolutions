async function main() {
    const res = await hre.web3.eth.getStorageAt('0x3141DeF57Fe2D5767F22899c76B9260Cf0eC1a0c', 1, (err, res) => { console.log(res); return res });
    const password = hre.web3.utils.hexToAscii(res);
    console.log(password)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
