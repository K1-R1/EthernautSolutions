from brownie import config, accounts, HBuilding

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    h_building = HBuilding.deploy({'from': account}, publish_source=True)
    
    h_building.callGoTo({'from': account}).wait(1)
