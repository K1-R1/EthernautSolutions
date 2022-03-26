1. Become `owner` in implementation, in order to use `addToWhitelist`:
- `owner` is slot 0 in implementation, `pendingAdmin` is slot 0 in proxy; so set attacker as `pendingAdmin`.

2. Add attacker to `whitelisted`, in order to access implementation functions; `multicall` `execute` `setMaxBalance`

3. Drain all funds from the implementation, in order to use `setMaxBalance`:
- use `deposit` via `multicall`, so that `msg.value` can be reused, in order to set `balances[attacker]` to maximum
- use `execute` to withdraw all funds to attacker