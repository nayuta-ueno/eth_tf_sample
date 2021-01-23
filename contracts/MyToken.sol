// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MyTokenコントラクト
 * @notice 私のトークンコントラクト
 * @dev OpenZeppelinのERC20を継承
 */
contract MyToken is ERC20 {

    /**
     * @dev 何かしらの構造体
     * @param from from
     * @param to to
     * @param amount あまうんと
     */
    struct LastSpent {
        address from;
        address to;
        uint256 amount;
    }

    /** @dev 適当なstorage変数 */
    LastSpent private _last;

    /**
     * @dev コンストラクタ
     * @param name 名前
     * @param symbol シンボル
     * @param amount 初期mint量
     */
    constructor(string memory name, string memory symbol, uint256 amount) ERC20(name, symbol) public {
        _mint(msg.sender, amount);
        _setupDecimals(0);
    }

    /**
     * @dev 送金前の処理
     * @param from 送金元アドレス
     * @param to 送金先アドレス
     * @param amount 送金量
     * @inheritdoc ERC20
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        _last.from = from;
        _last.to = to;
        _last.amount = amount;
    }

    /**
     * @notice 適当なコントラクト情報を返す
     * @dev 特になし
     * @return cname コントラクト名
     * @return supply totalSupply()
     */
    function getContracInfo() public view returns (string memory cname, uint256 supply) {
        cname = "MyToken";
        supply = totalSupply();
    }
}
