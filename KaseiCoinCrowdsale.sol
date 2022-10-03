pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint256 rate, // rate in TKNbits 
        address payable wallet, // sale beneficiary
        KaseiCoin coin // the KaseiCoin itself that the KaseiCoinCrowdsale will work with
    ) public Crowdsale(rate, wallet, coin) 
    {
        // constructor can stay empty
    }
}

/*
contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    // I AM USING 'coin' INSTEAD OF 'token' IN MY VARIABLE NAMES.  ALSO STYLING VARIABLE NAMES AS CAMEL CASE INSTEAD OF SNAKE CASE
    address public kaseiCoinAddress;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    // I AM USING 'coin' INSTEAD OF 'token' IN MY VARIABLE NAMES.  ALSO STYLING VARIABLE NAMES AS CAMEL CASE INSTEAD OF SNAKE CASE
    address public kaseiCrowdsaleAddress;

    // Add the constructor.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    ) public {
        // Create a new instance of the KaseiCoin contract.
        KaseiCoin coin = new KaseiCoin(name, symbol, 0);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        kaseiCoinAddress = address(coin);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        KaseiCoinCrowdsale kaseiCrowdsale = new KaseiCoinCrowdsale(1, wallet, coin);
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        kaseiCrowdsaleAddress = address(kaseiCrowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
        coin.addMinter(kaseiCrowdsaleAddress);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        coin.renounceMinter();
    }
}
*/