
// this is my script



async function main(){
  const [deployer] = await ethers.getSigners();
  console.log("Deploying Escrow contract with account:", deployer.address);


  // Replace these addresses with actual payee and arbiter addresses for deployment
  const payeeAddress = "0xYourPayeeAddressHere";
  const arbiterAddress = "0xYourArbiterAddressHere";

  const Escrow = await ethers.getContractFactory("Escrow");
  const escrow = await Escrow.deploy(payeeAddress, arbiterAddress, { value: ethers.utils.parseEther("1") });

  await escrow.deployed();

  console.log("Escrow    contract deployed to:", escrow.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
