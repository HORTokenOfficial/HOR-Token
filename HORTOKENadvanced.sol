// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HORToken is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("HOR Token", "HOR") {
        _mint(msg.sender, 10_000_000_000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _update(address from, address to, uint256 value)
        internal
        override
    {
        require(!paused(), "HOR: token transfer while paused");
        super._update(from, to, value);
    }
}
