'use client'

import { InputPesquisaCapturados } from "@/components/InputPesquisaCapturados";
import { ItemPokemon } from "@/components/ItemPokemon";
import { PokemonI } from "@/utils/types/pokemons";
import { useEffect, useState } from "react";
import { useTreinadorStore } from "@/context/treinador";

export default function MinhaPokedex() {

  const [pokemons, setPokemons] = useState<PokemonI[]>([])
  const { treinador } = useTreinadorStore()

  useEffect(() => {
    async function buscaPokemonsCapturados() {
      if (treinador.id) {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/${treinador.id}/capturas`)
        const dados = await response.json()
        setPokemons(dados)
      }
    }

    buscaPokemonsCapturados()

  }, [treinador])

  const listaPokemons = pokemons.map(pokemon => (
    <ItemPokemon data={pokemon} key={pokemon.id} />
  ))

  return (
    <main>
      <InputPesquisaCapturados setPokemons={setPokemons} />
      <section className="max-w-screen-xl mx-auto mt-1">
        <h1 className="mb-6 text-3xl font-extrabold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl dark:text-black">
          Minha Pokedex
        </h1>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
          {listaPokemons}
        </div>
      </section>
    </main>
  );
}