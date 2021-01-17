// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    struct LastSpent {
        address from;
        address to;
        uint256 amount;
    }

    LastSpent private _last;

    constructor(string memory name, string memory symbol, uint256 amount) ERC20(name, symbol) public {
        _mint(msg.sender, amount);
        _setupDecimals(0);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        _last.from = from;
        _last.to = to;
        _last.amount = amount;
    }
}
