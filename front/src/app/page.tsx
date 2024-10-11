'use client'

import { InputPesquisa } from "@/components/InputPesquisa";
import { ItemPokemon } from "@/components/ItemPokemon";
import { PokemonI } from "@/utils/types/pokemons";
import { useEffect, useState } from "react";
import { useTreinadorStore } from "@/context/treinador";

export default function Home() {

  const [pokemons, setPokemons] = useState<PokemonI[]>([])
  const { logaTreinador } = useTreinadorStore()

  useEffect(() => {
    async function buscaDados() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/pokemons`)
      const dados = await response.json()
      setPokemons(dados)
    }

    buscaDados()

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


  const listaPokemons = pokemons.map(pokemon => (
    <ItemPokemon data={pokemon} key={pokemon.id} />
  ))

  return (
    <main>
      <InputPesquisa setPokemons={setPokemons} />
      <section className="max-w-screen-xl mx-auto mt-1">
        <h1 className="mb-6 text-3xl font-extrabold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl dark:text-black">
          Lista de&nbsp;
          <span className="underline underline-offset-3 decoration-8 decoration-red-600 dark:decoration-red-600">
            todos os Pokémons
          </span>
        </h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
          {listaPokemons}
        </div>
      </section>
    </main>
  );
}
