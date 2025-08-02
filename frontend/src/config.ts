import { http, createConfig } from 'wagmi'
import { holesky, mainnet, sepolia } from 'wagmi/chains'

export const config = createConfig({
  chains: [mainnet, sepolia ,holesky],
  transports: {
    [mainnet.id]: http(),
    [sepolia.id]: http(),
    [holesky.id]:  http()
  },
})