from brownie import config, accounts, HShop

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])
    h_shop = HShop.deploy(
        "0xc36282d13a262d9636030652BCF3aaBC638d1108",
        {'from': account}
    )

    h_shop.hack({'from': account}).wait(1)
    
