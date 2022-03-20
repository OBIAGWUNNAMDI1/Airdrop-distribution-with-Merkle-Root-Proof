pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    uint256 initialSupply;


    constructor(uint256 _initialSupply) ERC20("BoredApe", "BRT") {
        initialSupply = _initialSupply;
        _mint(msg.sender, initialSupply);
    }
    mapping(address=>mapping(address=>uint)) public _allowance;

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    function approve(address _spender, uint _value)public override returns (bool success){
        _allowance[msg.sender][_spender]=_value;
        // This event must trigger when a successful call is made to the approve function.
        emit Approval(msg.sender,_spender,_value);
        return true;
    }
}
