# Migrations.sol

View Source: [contracts/Migrations.sol](contracts/Migrations.sol)

**Migrations**

## Contract Members
**Constants & Variables**

```solidity
address public owner;
uint256 public last_completed_migration;

```

## Modifiers

- [restricted](#restricted)

### restricted

```solidity
modifier restricted() internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

## Functions

- [setCompleted](#setcompleted)

### setCompleted

```solidity
function setCompleted(uint256 completed) public nonpayable restricted 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| completed | uint256 |  | 

## Contracts

* [Context](Context.md)
* [ERC20](ERC20.md)
* [IERC20](IERC20.md)
* [Migrations](Migrations.md)
* [MyToken](MyToken.md)
* [SafeMath](SafeMath.md)
