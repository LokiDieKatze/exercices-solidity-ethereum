// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract CheckOdd {
    function check(uint number) pure returns (bool) {
        return (number % 2) == 0 ? true : false ;
    }
}
