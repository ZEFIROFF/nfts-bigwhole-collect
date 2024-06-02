import {ethers} from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", ((await deployer.provider.getBalance(deployer.address)) / BigInt(1e18)).toString(10) + "ETH");

    // const BaseCollect = await ethers.getContractFactory("PartsOfABigWhole");
    const Barrel = await ethers.getContractFactory("Barrel");
    const Nippers = await ethers.getContractFactory("Nippers");
    const Uniform = await ethers.getContractFactory("Uniform");

    const barrel = await Barrel.deploy();
    await barrel.waitForDeployment();
    console.log("Barrel deployed to:", await barrel.getAddress());

    const nippers = await Nippers.deploy();
    await nippers.waitForDeployment();
    console.log("Nippers deployed to:", await nippers.getAddress());

    const uniform = await Uniform.deploy();
    await uniform.waitForDeployment();
    console.log("Uniform deployed to:", await uniform.getAddress());

    // const collect = await BaseCollect.deploy();
    // await collect.waitForDeployment();
    // console.log("BaseCollect deployed to:", await collect.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
