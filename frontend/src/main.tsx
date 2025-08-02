import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import '@rainbow-me/rainbowkit/styles.css'
import './index.css'
import {App} from './App.tsx'
import { ConnectButton, RainbowKitProvider } from '@rainbow-me/rainbowkit'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { config } from './config.ts'
import { WagmiProvider } from 'wagmi'
const queryClient = new QueryClient()
createRoot(document.getElementById('root')!).render(
  <StrictMode>
      <WagmiProvider config={config}>
          <QueryClientProvider client={queryClient}>
            <RainbowKitProvider>
              <div style={{ padding: '2rem' }}>
                <h1>Bridge App Demo</h1>
                <ConnectButton />
                <App></App>
              </div>
            </RainbowKitProvider>
          </QueryClientProvider>
        </WagmiProvider>
  </StrictMode>,
)
