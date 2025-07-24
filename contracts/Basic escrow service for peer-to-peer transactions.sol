/  / SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Escrow{
    address public payer;
    address public payee;
    address public arbiter;
    uint256 public amount;
    bool public isFunded;
    bool public isReleased;

    constructor(address _payee, address _arbiter) payable {
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
        amount = msg.value;
        isFunded = true;
        isReleased = false;
    }



    function releaseFunds() external {
        require(msg.sender == arbiter, "Only arbiter can release funds");
        require(isFunded, "Escrow not funded");
        require(!isReleased, "Funds already released");

        isReleased = true;
        payable(payee).transfer(amount);
    }

    function refundPayer() external {
        require(msg.sender == arbiter, "Only arbiter can refund");
        require(isFunded, "Escrow not funded");
        require(!isReleased, "Funds already released");

        isReleased = true;
        payable(payer).transfer(amount);
    }
}
