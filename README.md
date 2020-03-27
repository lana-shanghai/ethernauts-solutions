# Solutions and comments to hacking ethernauts. See either contract in folder or console/terminal command.

# CONTAINS SPOILERS!

## Coin Flip

After unsuccessful exercising in psychic readings, we see that each `side` actually is derived from the previous block number, which means that we can easily predict the result by applying the same formula. But when I sent the first few transactions manually, after reaching 5 correct guesses, I saw that my `consecutiveWins` dropped to 0. I attempted sending more transactions and kept running into the same problem. It was wildly frustrating, especially because I sent manual transactions and I was sure that my solution is correct because I got a bunch of guesses right. Anyway, after some time I realized that my transaction is sometimes mined in the `wrong` block, and so my guess, even though it was correct for the previous block, it was wrong for the one it was mined in. So I wrote a contract to mitigate that issue.
```
https://github.com/lana-shanghai/ethernauts-solutions/blob/master/CoinFlip/HackFlip.sol
```

## Telephone

Pretty trivial - you need to call the `changeOwner` function from your account address in your contract so that `msg.sender` does not equal `tx.origin` - hence the contract is needed. 
```
https://github.com/lana-shanghai/ethernauts-solutions/blob/master/Telephone/HackTelephone.sol
```

## Token

Dark times before we had SafeMath. Just by sending the current owner one more token than we own, we end up with a humongous amount of tokens. Happens because of the overflow - it works kind of like a clock, and if we rewind two hours back at one, it will be eleven o'clock. 
```
contract.transfer('current_owner', 21, {from:'your_address', to: 'your_instance_address'})
```

## Delegation

tbd

## Force

My favorite one. After a number of attempts I stopped trying to shove money to a contract with no payable fallback function and think for a bit. It helped! The way a contract can receive ethers besides a standard `send` or `transfer` is it can also receive a coinbase transaction or be the resolving addresses for a `selfdestruct` function. So I wrote a contract which had a payable `selfdestruct` function and sent myself some ether which triggered the destruction, and the funds were re-directed to my instance. I didn't attmept anything with the mining transactions. 
```
https://github.com/lana-shanghai/ethernauts-solutions/blob/master/Force/HackForce.sol
```

## Vault 

```
web3.eth.getStorageAt("your_instance_address", 1, function(error, result) {console.log(result)})
```

## King

The way the current king is overthrown is first by sending more ether to the contract instance than the current `prize`, and then the ether is forwarded to the previous king. The loophole is to have the king not accept ether by writing a non-accepting fallback function or make the contract you want to hack run out of gas on its call to your hacker contract. 