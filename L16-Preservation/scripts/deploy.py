from brownie import config, accounts, HPreservation

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    h_preservation = HPreservation.deploy(
        "0x387b6900e3e8e1f217A03b4F2A7c2Cc811b538db",
        {'from': account}
    )
    h_preservation.claimOwnership({'from': account}).wait(1)
    
