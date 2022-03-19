from brownie import config, accounts, HackCoinFlip

def main():
    hackflip()

def hackflip():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    hack_coin_flip = HackCoinFlip[-1]

    hack_coin_flip.HackFlip({'from': account})