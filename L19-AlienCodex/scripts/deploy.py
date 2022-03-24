from brownie import config, accounts, HAlienCodex

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    h_alien_codex = HAlienCodex.deploy(
        "0xF09503d5222393057021d30240FD41FA530509fb",
        {'from': account}
    )
    
