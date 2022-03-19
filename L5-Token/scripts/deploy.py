from brownie import config, accounts, HackToken

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    hack_token = HackToken.deploy({'from':account}, publish_source=True)