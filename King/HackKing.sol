pragma solidity 0.5.6;

contract HackKing {
    
    function becomeKing(address payable king) public payable {
        (bool success, bytes memory data) = king.call.value(msg.value)("");
        require(success, "could not send");
    }

    // Define fallback function
    function () external payable {
    }
}
