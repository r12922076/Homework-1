// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {console} from "forge-std/Test.sol";

/* Problem 1 Interface & Contract */
contract StudentV1 {
    bool public isEnrolled = false;
    
    function register() external returns (uint256) {
        if (!isEnrolled) {
            isEnrolled = true;
            return 1000;
        } else {
            return 123;
        }
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        IClassroomV2 classroom = IClassroomV2(msg.sender);
        
        if (classroom.isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    
    function register() external view returns (uint256) {
        return (gasleft() > 7000)? 1000 : 123;
    }
}
