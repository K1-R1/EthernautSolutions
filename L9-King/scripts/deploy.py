from brownie import config, accounts, HackKing

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    hack_king = HackKing.deploy({'from': account, 'value': 0.2 * 10**18}, publish_source=True)
    
    hack_king.takeTheThrone({'from': account}).wait(1)
