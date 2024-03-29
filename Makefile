-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
#	Use Below For Verification
#	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
#	Use Below Withot Verifying
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast -vvvv
endif

build :; forge build

deploy:
	@forge script script/DeployCalypto.s.sol:DeployCalypto $(NETWORK_ARGS)

deployThief:
	@forge script script/DeployThief.s.sol:DeployThief $(NETWORK_ARGS)

reader:
	@forge script script/StorageReader.s.sol:StorageReader $(NETWORK_ARGS)

hack:
	@forge script script/HackerScript.s.sol:HackerScript $(NETWORK_ARGS)

hastur_v13:
	@forge script script/Hastur_v13.s.sol:Hastur_v13 $(NETWORK_ARGS)

thief:
	@forge script script/ThiefScript.s.sol:ThiefScript $(NETWORK_ARGS)

updater:
	@forge script script/Updater.s.sol:Updater $(NETWORK_ARGS)

calypto:
	@forge script script/CalyptoHack.s.sol:CalyptoHack $(NETWORK_ARGS)
