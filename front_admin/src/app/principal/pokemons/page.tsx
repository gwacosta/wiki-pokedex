'use client'
import { useEffect, useState } from "react"
import Link from 'next/link'

import ItemPokemon from '@/components/ItemPokemon'
import { PokemonI } from "@/utils/types/pokemons"

function CadPokemons() {
  const [pokemons, setPokemons] = useState<PokemonI[]>([])

  useEffect(() => {
    async function getPokemons() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/pokemons`)
      const dados = await response.json()
      setPokemons(dados)
    }
    getPokemons()
  }, [])

  const listaPokemons = pokemons.map(pokemon => (
    <ItemPokemon key={pokemon.id} pokemon={pokemon} pokemons={pokemons} setPokemons={setPokemons} />
  ))

  return (
    <div className='m-4 mt-24'>
      <div className='flex justify-between'>
        <h1 className="mb-4 text-2xl font-bold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl">
          Cadastro de Pokemons
        </h1>
        <Link href="pokemons/novo" 
          className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-bold rounded-lg text-md px-5 py-2.5 me-2 mb-2 focus:outline-none">
          Novo Pokemon
        </Link>
      </div>

      <div className="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table className="w-full text-sm text-left rtl:text-right text-gray-500">
          <thead className="text-xs text-center text-gray-700 uppercase bg-gray-200">
            <tr>
              <th scope="col" className="px-6 py-3">
                Foto
              </th>
              <th scope="col" className="px-6 py-3">
                Nome
              </th>
              <th scope="col" className="px-6 py-3">
                Número
              </th>
              <th scope="col" className="px-6 py-3">
                Peso
              </th>
              <th scope="col" className="px-6 py-3">
                Altura
              </th>
              <th scope="col" className="px-6 py-3">
                Grupo
              </th>
              <th scope="col" className="px-6 py-3">
                Tipos
              </th>
              <th scope="col" className="px-6 py-3">
                Fraquezas
              </th>
              <th scope="col" className="px-6 py-3">
                Habilidade
              </th>
              <th scope="col" className="px-6 py-3">
                Ações
              </th>
            </tr>
          </thead>
          <tbody>
            {listaPokemons}
          </tbody>
        </table>
      </div>
    </div>
  )
}

export default CadPokemons