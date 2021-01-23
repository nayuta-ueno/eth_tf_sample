# MyTokenコントラクト (MyToken.sol)

View Source: [contracts/MyToken.sol](contracts/MyToken.sol)

**↗ Extends: [ERC20](ERC20.md)**

**MyToken**

私のトークンコントラクト

## Structs
### LastSpent

```solidity
struct LastSpent {
 address from,
 address to,
 uint256 amount
}
```

## Contract Members
**Constants & Variables**

```solidity
struct MyToken.LastSpent private _last;

```

## Functions

- [constructor](#constructor)
- [_beforeTokenTransfer](#_beforetokentransfer)
- [getContracInfo](#getcontracinfo)

### constructor

コンストラクタ

```solidity
constructor(string name, string symbol, uint256 amount) public nonpayable ERC20 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| name | string | 名前 | 
| symbol | string | シンボル | 
| amount | uint256 | 初期mint量 | 

### _beforeTokenTransfer

送金前の処理

```solidity
function _beforeTokenTransfer(address from, address to, uint256 amount) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| from | address | 送金元アドレス | 
| to | address | 送金先アドレス | 
| amount | uint256 | 送金量 | 

### getContracInfo

適当なコントラクト情報を返す

```solidity
function getContracInfo() public view
returns(cname string, supply uint256)
```

**Returns**

cname コントラクト名

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

## Contracts

* [Context](Context.md)
* [ERC20](ERC20.md)
* [IERC20](IERC20.md)
* [Migrations](Migrations.md)
* [MyToken](MyToken.md)
* [SafeMath](SafeMath.md)
