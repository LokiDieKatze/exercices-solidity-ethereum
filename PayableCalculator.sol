// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import library Address
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";


contract PayableCalculator (uint256 a, uint256 b) public returns (uint256) {
    //library usage
    using Address for address payable;
    
    // state variables
    address private _owner;
    uint private _ownerGains;
    mapping(address => uint256) private _balances;
    
    // events
    event Operated(uint indexed _countOperations);
    
    // constructor, déclaration du owner
    constructor (address _owner) {
        _owner = owner_
        _;
    };
    
    // modifier pour vérifier balance du msg.sender et le montant correct de msg.value à 1 finney
    modifier enoughCrypto () {
        require(_balance[msg.sender] >= 0,001 ether);
        require(msg.value == 0,001 ether);
    };
    
    // fonction pour déposer des ether avant de pouvoir utiliser le calculateur "payant"
    function deposit() public payable {
        payable(address[msg.sender]).transfer(msg.value);
        _balances[msg.sender] += msg.value;
    };
    
    // fonction générique qu'on passera à chaque fonction afin d'inscrire sur le registre le débit du msg.sender pour crédit du owner 
    function transaction() public {
        _balances[msg.sender] -= 0,001 ether;
        _ownerGains += 0,001 ether;
    };
    
    // Les différentes fonctions du calculateur avec application de transaction(), incrémentation du compteur des opérations via indexation (event/emit), et resultat avec le return
    function add (a, b) public returns (uint256) {
        transaction();
        emit Operated(_countOperations += 1);
        return a + b;
    };
    
    function sub (a, b) public return (uint256) {
        transaction();
        emit Operated(_countOperations += 1);
        return a - b;
    };
    
    function mul (a, b) public return (uint256) {
        transaction();
        emit Operated(_countOperations += 1);
        return a * b;
    };
    
    function div (a, b) public return (uint256) {
        transaction();
        emit Operated(_countOperations += 1);
        return a / b;
    };
    
    function modulo (a, b) public return (uint256) {
        transaction();
        emit Operated(_countOperations += 1);
        return a % b;
    };
  
    // fonction pour permettre à owner de retirer tous ses gains, puis de mettre le compteur à 0
    function withdraw(_ownerGains) private payable {
        require(_owner == owner_, "Sorry, you are not allowed to withdraw")
        payable(address[_owner]).sendValue(_ownerGains);
        _ownerGains = 0;
    };
    
}