const Token = artifacts.require("MyToken");
const truffleAssert = require('truffle-assertions');

contract("MyToken test", async accounts => {
  let instance;

  it("init", async () => {
    instance = await Token.new("aaa", "bbb", 200000);
  });

  it("totalSupply", async () => {
    assert.equal(await instance.totalSupply(), 200000, "supply");
  });

  it("transfer", async () => {
    await truffleAssert.passes(
      instance.transfer(accounts[1], 10000, {from: accounts[0]})
    );
    assert.equal(await instance.balanceOf(accounts[0]), 190000, "balancePayer");
    assert.equal(await instance.balanceOf(accounts[1]), 10000, "balancePayee");
  });

  it("transfer event", async () => {
    const tx = await instance.transfer(accounts[2], 9000, {from: accounts[1]});
    truffleAssert.eventEmitted(tx, "Transfer", (ev) => {
      assert.equal(ev.from, accounts[1], "from");
      assert.equal(ev.to, accounts[2], "to");
      assert.equal(ev.value, 9000, "value");
      return true;
    });
    await truffleAssert.fails(
      instance.transfer(accounts[2], 9000, {from: accounts[1]}),
      truffleAssert.ErrorType.REVERT,
      "ERC20: transfer amount exceeds balance"
    );
  });

});
