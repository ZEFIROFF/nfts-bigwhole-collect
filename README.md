# Deploy

```shell
npx hardhat compile
npx hardhat run scripts/deploy.ts --network polygon
```
# Verify

```shell
npx hardhat verify --network polygon 0x4223aE0EcEB4BB59e1dd92D7b12F9F3f9aD44E71
```

## Contracts

- Nippers deployed to: 0x1DB8751145680dDe8Fb59eb4A3f61a12891692f6
- Uniform deployed to: 0xc2Bc86eE3C524A5CD4550393DE9E350F79ec596c
- Barrel deployed to: 0xB678159cE303DDC1A07B5080344F98e84D7e67A3
- Collect deployed at: 0xe104D4444D65DA9F87153F1455956B2b2BdB31E2

## Intro for frontend

#### toggleMinting()
Позволяет владельцу включить или отключить процесс минтинга. Когда минтинг включен, можно создавать новые NFT; когда выключен, минтинг не разрешен.
_baseURI
#### _baseURI()
Возвращает базовый URI для метаданных NFT.
#### safeMint(address to)
Позволяет внешнему адресу создать новый NFT для указанного адреса, при условии, что минтинг включен и не превышены ограничения на количество минтинга (1) на кошелек и общее количество.
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