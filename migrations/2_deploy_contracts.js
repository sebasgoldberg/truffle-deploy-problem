var InnerLib = artifacts.require("../contracts/InnerLib.sol");
var TestLib = artifacts.require("../contracts/TestLib.sol");
var Test = artifacts.require("../contracts/Test.sol");

async function doDeploy(deployer, network){
    await deployer.deploy([TestLib, InnerLib]);
    await deployer.link(InnerLib, [TestLib, Test]);
    await deployer.link(TestLib, [InnerLib, Test]);
    await deployer.deploy(Test);
}

module.exports = (deployer, network) => {
    deployer.then(async () => {
        await doDeploy(deployer, network)
    });
};
