# Deploy

```shell
npx hardhat compile
npx hardhat run scripts/deploy.ts --network polygon
```

# Verify

```shell
npx hardhat verify --network polygon 0xe00AE26F500Edabaf0eeBBA5F6014454F8958F75 
npx hardhat verify --network polygon 0xBB3E169F37b478Fc356842213855920E4e9acD5f 
npx hardhat verify --network polygon 0x4B2d2DD78011325258c30C6A5D6c035923CaA13c 
```

## Contracts

- Nippers deployed to: 0x6DCC15CaA97AC1351DC8B294b97789A2DE4A84BD
- Uniform deployed to: 0x1939b63eA9398fC77Eb75eEF037B02b48af11274
- Barrel deployed to: 0xCa7D3129883E74736D008173f1F170be73750908
- Collect deployed at: 0x4223aE0EcEB4BB59e1dd92D7b12F9F3f9aD44E71

## Intro for frontend

#### toggleMinting()

Позволяет владельцу включить или отключить процесс минтинга. Когда минтинг включен, можно создавать новые NFT; когда
выключен, минтинг не разрешен.
_baseURI

#### _baseURI()

Возвращает базовый URI для метаданных NFT.

#### safeMint(address to)

Позволяет внешнему адресу создать новый NFT для указанного адреса, при условии, что минтинг включен и не превышены
ограничения на количество минтинга (1) на кошелек и общее количество.

- to: Адрес, на который будет создан NFT.

#### mintEnabled()

Возвращает текущее состояние флага минтинга. Текущее состояние флага минтинга (true или false).

#### currentSupply()

Возвращает текущее количество выпущенных NFT.

#### ownerOf(uint256 tokenId)

Возвращает адрес владельца указанного токена.

- tokenId: Идентификатор токена.

#### maxSupply()

Возвращает максимальное количество NFT, которое может быть выпущено.