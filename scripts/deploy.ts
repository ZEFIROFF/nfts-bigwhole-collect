import hre, {ethers} from "hardhat";

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", ((await deployer.provider.getBalance(deployer.address)) / BigInt(1e18)).toString(10) + "ETH");

    const Barrel = await ethers.getContractFactory("Barrel");
    const barrel = await Barrel.deploy();
    await barrel.waitForDeployment();

    const Nippers = await ethers.getContractFactory("Nippers");
    const nippers = await Nippers.deploy();
    await nippers.waitForDeployment();

    const Uniform = await ethers.getContractFactory("Uniform");
    const uniform = await Uniform.deploy();
    await uniform.waitForDeployment();

    console.log("Barrel deployed to:", await barrel.getAddress());
    console.log("Nippers deployed to:", await nippers.getAddress());
    console.log("Uniform deployed to:", await uniform.getAddress());

    await barrel.toggleMinting();
    console.log("Barrel minting toggled on");
    await nippers.toggleMinting();
    console.log("Nippers minting toggled on");
    await uniform.toggleMinting();
    console.log("Uniform minting toggled on");

    console.log("Verifying contract barrel");

    // await verify(barrel, ["Barrel", "BRL", 3000, 1, "", '0xa560d88D55fA663764936A4d5F7377160a088aB4']);
    console.log("Verifying contract nippers");
    hre.run('verify:verify', {
        address: await nippers.getAddress(),
        constructorArguments: [],
        contract: "contracts/Nippers.sol:Nippers"
    });
    // await verify(nippers, ["Nippers", "NPR", 1000, 1, "", '0xa560d88D55fA663764936A4d5F7377160a088aB4']);
    console.log("Verifying contract uniform");
    hre.run('verify:verify', {
        address: await uniform.getAddress(),
        constructorArguments: [],
        contract: "contracts/Uniform.sol:Uniform"
    });

    hre.run('verify:verify', {
        address: await barrel.getAddress(),
        constructorArguments: [],
        contract: "contracts/Barrel.sol:Barrel"
    });
    // await verify(uniform, ["Uniform", "UNF", 1000, 1, "", '0xa560d88D55fA663764936A4d5F7377160a088aB4']);


    // const Collect = await ethers.getContractFactory("PartsOfABigWhole");
    // const collect = await Collect.deploy();
    // await collect.waitForDeployment();
    // console.log("Collect deployed to:", await collect.getAddress());
    // await collect.toggleMinting();
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
