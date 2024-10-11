import type { Metadata } from "next";
import "./globals.css";
import { Header } from "@/components/Header";
import { Toaster } from 'sonner'

export const metadata: Metadata = {
  title: "Wiki Pokedex",
  description: "APP de Pokedex com informações sobre pokemons",
  keywords: ['pokedex', 'pokemon', 'wiki pokemon', 'pokedex pokemon']
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
      <body>
        <Header />
        {children}
      </body>
      <Toaster position="top-right" richColors />
    </html>
  );
}
