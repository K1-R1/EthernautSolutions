const hre = require("hardhat");

async function main() {
  const account = process.env.pubK1
  /*
  bytecode for solver

  RUNTIME bytcode:
  602a push1 0x2a (value is 42; hex 0x2a)
  6080 push1 0x80 (memory slot is 0x80)
  52   mstore     (store 0x2a at positiion 0x80)
  6020 push1 0x20 (value is 32 bytes in size)
  6080 push1 0x80 (value was stored in slot 0x80)
  f3   return     (return 32 byte sized value, currently at position 0x80)

  602a 6080 52 6020 6080 f3

  INITIALISATION bytecode:
  600a push1 0x0a (10 bytes: size of RUNTIME bytecode)
  600c push1 0x0c (12 bytes: starting index of RUNTIME code)
  6000 push1 0x00 (destination memory index 0)
  39   CODECOPY   (copy 10 byte sized code, from starting index 12 in the entire contract bytecode,
                   to destination position 0)
  600a push1 0x0a (10 bytes: RUNTIME bytcode length)
  6000 push1 0x00 (destination memory index 0, where RUNTIME bytecode was copied to)
  f3   return     (return to EVM: RUNTIME bytecode of length 10 bytes, currently in memory index 0)
  
  600a 600c 6000 39 600a 6000 f3

  INITIALISATION + RUNTIME:
  0x600a600c600039600a6000f3602a60805260206080f3
  */
  const bytecode = "0x600a600c600039600a6000f3602a60805260206080f3"
  const tx = await hre.web3.eth.sendTransaction(
    {
      from: account,
      data: bytecode,
      function(err, res) { console.log(res) }
    }
  )
  console.log(tx)

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
