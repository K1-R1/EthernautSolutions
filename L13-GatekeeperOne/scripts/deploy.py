from brownie import config, accounts, HGatekeeperOne

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    h_gate_keeper_one = HGatekeeperOne.deploy({'from': account}, publish_source=True)
