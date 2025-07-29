

import { WagmiProvider, createConfig } from "wagmi";
import { bscTestnet,avalancheFuji } from "wagmi/chains";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ConnectKitProvider, getDefaultConfig } from "connectkit";
// import { Header } from "./components/Headers";

const config = createConfig(
    getDefaultConfig({
      chains: [avalancheFuji,bscTestnet],
      walletConnectProjectId:'aef07496ac7554dee112fc0189e60ac0',
      appName: "BridgeUSDT",
      appDescription: "BridgeUSDT",
      appUrl: "https://family.co",
      appIcon: "https://family.co/logo.png",
    }),
  );


const queryClient = new QueryClient();

export const Web3Provider = ({
    children,
}: Readonly<{
    children: React.ReactNode;
}>) => {
    return (
        <WagmiProvider config={config}>
            <QueryClientProvider client={queryClient}>
                <ConnectKitProvider>
                    {/* <Header /> */}
                    {children}
                </ConnectKitProvider>
            </QueryClientProvider>
        </WagmiProvider>
    );
};