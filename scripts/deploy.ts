import {ethers} from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", ((await deployer.provider.getBalance(deployer.address)) / BigInt(1e18)).toString(10) + "ETH");

    // const BaseCollect = await ethers.getContractFactory("PartsOfABigWhole");
    const Collect = await ethers.getContractFactory("PartsOfABigWhole");
    const collect = await Collect.deploy();
    await collect.waitForDeployment();
    console.log("Collect deployed to:", await collect.getAddress());
    await collect.toggleMinting();
    console.log("Minting toggled");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
