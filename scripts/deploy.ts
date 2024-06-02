import { ethers } from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    // console.log("Account balance:", (await deployer.getBalance()).toString());

    const BaseNFT = await ethers.getContractFactory("BaseNFT");
    const Barrel = await ethers.getContractFactory("Barrel");
    const Nippers = await ethers.getContractFactory("Nippers");
    const Uniform = await ethers.getContractFactory("Uniform");

    const barrel = await Barrel.deploy();
    await barrel.deployed();
    console.log("Barrel deployed to:", barrel.address);

    const nippers = await Nippers.deploy();
    await nippers.deployed();
    console.log("Nippers deployed to:", nippers.address);

    const uniform = await Uniform.deploy();
    await uniform.deployed();
    console.log("Uniform deployed to:", uniform.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
