'use client'

import { PokemonI } from "@/utils/types/pokemons"
import Link from "next/link"
import { useParams } from "next/navigation"
import { useEffect, useState } from "react"
import { useTreinadorStore } from "@/context/treinador"

export default function Detalhes() {

    const params = useParams()

    const [pokemon, setPokemon] = useState<PokemonI>()
    const [capturado, setCapturado] = useState<boolean>(false)
    const { treinador } = useTreinadorStore()

    useEffect(() => {
        async function buscaDados() {
            const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/pokemons/${params.pokemon_id}`)
            const dados = await response.json()
            setPokemon(dados)
        }
        buscaDados()
    }, [])

    const getEvolucoes = (pokemon: PokemonI) => {
        const evolucoes = [];
        let currentPokemon = pokemon;

        // Adiciona o Pokémon atual
        evolucoes.push(currentPokemon);

        // Adiciona as evoluções futuras
        while (currentPokemon.evolucao) {
            currentPokemon = currentPokemon.evolucao;
            evolucoes.push(currentPokemon);
        }

        // Adiciona as evoluções anteriores
        currentPokemon = pokemon;
        while (currentPokemon.evoluiDe) {
            evolucoes.unshift(currentPokemon.evoluiDe);
            currentPokemon = currentPokemon.evoluiDe;
        }

        return evolucoes;
    };

    const evolucoes = pokemon ? getEvolucoes(pokemon) : [];

    return (

        <section className="flex flex-col mt-32 mx-auto items-center bg-white border border-gray-400 rounded-lg shadow md:flex-row md:max-w-5xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
            <img className="object-cover w-full rounded-t-lg h-96 md:h-2/4 md:w-2/4 md:rounded-none md:rounded-s-lg" src={pokemon?.foto} alt="" />
            <div className="flex flex-col justify-between p-4 leading-normal">
                <h5 className="flex justify-between mb-2 text-4xl font-bold tracking-tight text-gray-900 dark:text-white">
                    {pokemon?.nome}
                    {treinador.id &&
                        <img
                            src={capturado ? "/pokeball.png" : "/pokeball_pb.png"}
                            alt="Pokebola Preto e Branca"
                            className="w-10 h-10 cursor-pointer"
                            onClick={() => setCapturado(!capturado)}
                        />
                    }
                </h5>
                <div className="flex justify-between mb-3">
                    <p className="font-bold text-2xl text-gray-700 dark:text-gray-400">
                        Nº: {pokemon?.numero}
                    </p>
                    <p className="font-bold text-2xl text-gray-700 dark:text-gray-400">
                        Tipo: {pokemon?.tipos.length > 1 ? pokemon?.tipos.join(', ') : pokemon?.tipos[0]}
                    </p>
                </div>
                <div className="flex justify-between mb-3">
                    <p className="font-bold text-xl text-gray-700 dark:text-gray-400">
                        Peso:&nbsp;
                        <span className="font-normal text-xl text-gray-700 dark:text-gray-400">
                            {pokemon?.peso} Kg
                        </span>
                    </p>
                    <p className="font-bold text-xl text-gray-700 dark:text-gray-400">
                        Altura:&nbsp;
                        <span className="font-normal text-xl text-gray-700 dark:text-gray-400">
                            {pokemon?.altura} m
                        </span>
                    </p>
                </div>
                <div className="flex justify-between mb-3">
                    <p className="font-bold text-xl text-gray-700 dark:text-gray-400">
                        Habilidade:&nbsp;
                        <span className="font-normal text-xl text-gray-700 dark:text-gray-400">
                            {pokemon?.habPassiva}
                        </span>
                    </p>
                    <p className="font-bold text-xl text-gray-700 dark:text-gray-400">
                        Grupo:&nbsp;
                        <span className="font-normal text-xl text-gray-700 dark:text-gray-400">
                            {pokemon?.grupo.nome}
                        </span>
                    </p>
                </div>
                <p className="font-bold text-xl mb-3 text-gray-700 dark:text-gray-400">
                    Fraquezas:&nbsp;
                    <span className="font-normal text-xl text-gray-700 dark:text-gray-400">
                        {pokemon?.fraquezas.length > 1 ? pokemon?.fraquezas.join(', ') : pokemon?.fraquezas[0]}
                    </span>
                </p>
                <p className="mb-3 font-normal text-xl text-gray-700 dark:text-gray-400">
                    {pokemon?.descricao}
                </p>
                <p className="font-bold text-center text-2xl text-gray-700 dark:text-gray-400">
                    Cadeia Evolutiva:
                </p>
                <div className="flex mx-auto space-x-4 mb-4">
                    {evolucoes.map((evo, index) => (
                        <div key={index} className="flex items-center">
                            <Link href={`/detalhes/${evo.id}`}>
                                <img className="w-32 h-32" src={evo.foto} alt={`Evolução ${index + 1}`} />
                            </Link>
                            {index < evolucoes.length - 1 && (
                                <img className="ms-4 w-8 h-8" src="/seta.png" alt="Seta de Evolução" />
                            )}
                        </div>
                    ))}
                </div>
            </div>
        </section >

    )
}