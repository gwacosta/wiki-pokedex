'use client'
import { Dispatch, SetStateAction, useEffect } from "react"
import { TiDeleteOutline } from "react-icons/ti"
import Cookies from "js-cookie"
import { PokemonI } from "@/utils/types/pokemons"

interface listaPokemonProps {
  pokemon: PokemonI,
  pokemons: PokemonI[],
  setPokemons: Dispatch<SetStateAction<PokemonI[]>>
}

function ItemPokemon({ pokemon, pokemons, setPokemons }: listaPokemonProps) {

  async function excluirPokemon() {

    if (confirm(`Confirma a exclusão`)) {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/pokemons/${pokemon.id}`,
        {
          method: "DELETE",
          headers: {
            "Content-type": "application/json",
            Authorization: "Bearer " + Cookies.get("admin_logado_token") as string
          },
        },
      )

      if (response.status == 200) {
        const pokemons2 = pokemons.filter(x => x.id != pokemon.id)
        setPokemons(pokemons2)
        alert("Pokemon excluído com sucesso")
      } else {
        alert("Erro... Pokemon não foi excluído")
      }
    }
  }

  return (
    <tr key={pokemon.id} className="odd:bg-white even:bg-gray-200 border-b">
      <th scope="row" className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
        <img src={pokemon.foto} alt="Foto do Pokemon"
          style={{width: 200}} />
      </th>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.nome}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.numero}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.peso} Kg
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.altura} m
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.grupo.nome}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.tipos.join(", ")}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.fraquezas.join(", ")}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {pokemon.habPassiva}
      </td>
      <td className="px-6 py-4">
        <TiDeleteOutline className="text-3xl text-red-600 inline-block cursor-pointer" title="Excluir"
          onClick={excluirPokemon} />
      </td>
    </tr>
  )
}

export default ItemPokemon