'use client'

import Link from "next/link";
import { useTreinadorStore } from "@/context/treinador";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

export function Header() {

    const { treinador, deslogaTreinador } = useTreinadorStore()
    const router = useRouter()
    const { logaTreinador } = useTreinadorStore()

    useEffect(() => {
      async function buscaTreinador(idTreinador: string) {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/${idTreinador}`)
  
        if (response.status == 200) {
          const dados = await response.json()
          logaTreinador(dados)
        }
      }
  
      if (localStorage.getItem("treinador_key")) {
        const idTreinadorLocal = localStorage.getItem("treinador_key") as string
        buscaTreinador(idTreinadorLocal)
      }
  
      
    }, [])

    function sairTreinador() {
        deslogaTreinador()
        if (localStorage.getItem("treinador_key")) {
            localStorage.removeItem("treinador_key")
        }
        router.push("/login")
    }

    return (
        <nav className="bg-red-600 border-gray-200 dark:bg-red-600">
            <div className="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
                <Link href="/" className="flex items-center space-x-3 rtl:space-x-reverse">
                    <img src="./logo.png" className="h-16" alt="Wiki Pokedex Logo" />
                    <span className="self-center text-2xl font-semibold whitespace-nowrap text-white dark:text-white">
                        Wiki Pokedex
                    </span>
                </Link>
                <div className="flex items-center space-x-6 rtl:space-x-reverse">
                    {treinador.id ?
                        <>
                            <span className="text-gray-500 dark:text-white hover:underline">
                                {treinador.nome}
                            </span>
                            <span
                                className="cursor-pointer font-bold  text-blue-700 dark:text-blue-700 hover:underline"
                                onClick={sairTreinador}
                            >
                                Sair
                            </span>
                        </>
                        :
                        <>
                            <span className="text-gray-500 dark:text-white hover:underline">
                                (identifique-se)
                            </span>
                            <Link href="/login" className="font-bold  text-blue-700 dark:text-blue-700 hover:underline">
                                Entrar
                            </Link>
                        </>
                    }
                </div>
            </div>
        </nav>
    )
}