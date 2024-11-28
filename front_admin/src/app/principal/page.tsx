'use client'
import { useEffect, useState } from "react";
import { Chart } from "react-google-charts";

interface pokemonsGrupoI {
  grupo: string
  num: number
}

interface geralDadosI {
  treinadores: number
  pokemons: number
  capturas: number
}

type DataRow = [string, number, string]

export default function Principal() {
  const [pokemonsGrupo, setPokemonsGrupo] = useState<pokemonsGrupoI[]>([])
  const [dados, setDados] = useState<geralDadosI>({} as geralDadosI)

  useEffect(() => {
    async function getDadosGerais() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/dashboard/gerais`)
      const dados = await response.json()
      setDados(dados)
    }
    getDadosGerais()

    async function getDadosGrafico() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/dashboard/pokemonsGrupo`)
      const dados = await response.json()
      setPokemonsGrupo(dados)
    }
    getDadosGrafico()
  }, [])

  const data: (["Grupo", "Nº Pokemons", { role: string }] | DataRow)[] = [
    ["Grupo", "Nº Pokemons", { role: "style" }],
  ];
  
  const cores = ["red", "blue", "violet", "green", "gold", "cyan", "chocolate", "purple", "brown", "orangered"]

  pokemonsGrupo.forEach((pokemon, index) => {
    data.push([pokemon.grupo, pokemon.num, cores[index%10]])
  })

  return (
    <div className="container mt-24">
      <h2 className="text-3xl mb-4 font-bold">Visão Geral do Sistema</h2>

      <div className="w-2/3 flex justify-between mx-auto mb-5">
        <div className="border-blue-600 border rounded p-6 w-1/3 me-3">
          <span className="bg-blue-100 text-blue-800 text-xl text-center font-bold mx-auto block px-2.5 py-5 rounded dark:bg-blue-900 dark:text-blue-300">
            {dados.treinadores}</span>
          <p className="font-bold mt-2 text-center">Nº Treinadores</p>
        </div>
        <div className="border-red-600 border rounded p-6 w-1/3 me-3">
          <span className="bg-red-100 text-red-800 text-xl text-center font-bold mx-auto block px-2.5 py-5 rounded dark:bg-red-900 dark:text-red-300">
            {dados.pokemons}</span>
          <p className="font-bold mt-2 text-center">Nº Pokemons</p>
        </div>
        <div className="border-green-600 border rounded p-6 w-1/3">
          <span className="bg-green-100 text-green-800 text-xl text-center font-bold mx-auto block px-2.5 py-5 rounded dark:bg-green-900 dark:text-green-300">
            {dados.capturas}</span>
          <p className="font-bold mt-2 text-center">Nº Capturas</p>
        </div>
      </div>

      <h2 className="text-2xl font-bold mt-4">Gráfico: Nº de Pokemons por Grupo</h2>
      <Chart chartType="ColumnChart" width="95%" height="380px" data={data} />

    </div>
  )
}