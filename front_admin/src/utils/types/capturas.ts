import { PokemonI } from "./pokemons"
import { TreinadorI } from "./treinadores"

export interface CapturaI {
  id: number
  treinadorId: string
  treinador: TreinadorI
  pokemonId: number
  pokemon: PokemonI
  createdAt: string
}