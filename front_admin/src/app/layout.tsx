import type { Metadata } from "next";
import "./globals.css";
import { Toaster } from 'sonner'

export const metadata: Metadata = {
  title: "Admin: Wiki Pokedex",
  description: "Área adiministrativa da Wiki Pokedex",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
      <body>
        {children}
        <Toaster position="top-right" richColors />
      </body>
    </html>
  );
}
