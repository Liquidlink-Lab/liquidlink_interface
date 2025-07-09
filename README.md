
# Iota Mainnet Protocol

ID: 0x12fc1744dbd2401a0bbc1cb07995e1d7b2d9179a42a90ae7311e4c477112bf83

# Share 

ID: 0x4d62811016a2e0a3a44adcdaaf1f8fc46aa2e807ccb208dfb4cb00642a668b2a

### sender address
- 0xd6a54ff7f851b58c19729c11d210d46fd46d702b9d9caff78747de1914c934ee


# Getting Started

若要新增一個新環境提供測試或其他功能

- step1: 部署一個新的 liquidlink protocol package，並記錄該 ID
- step2: 根據用途新開 branch (eg. testnet / mainnet )
- step3: 更改 Move.toml 的 `publish-at` `liquidlink_protocol` 為新的 ID

## 第三方對接

在第三方 package 的 Move.toml，根據用途更改 dependencies LiquidlinkProtocol 的 `rev` 欄位
可參考 https://github.com/Liquidlink-Lab/liquidlink-staking-point-demo/blob/main/staking/Move.toml

```toml

[dependencies]
LiquidlinkProtocol = { git = "https://github.com/Liquidlink-Lab/liquidlink_interface.git", subdir = "./", rev = <branch name> }

```
