from brownie import config, accounts, HackCoinFlip

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    hack_coin_flip = HackCoinFlip.deploy({'from':account}, publish_source=True)