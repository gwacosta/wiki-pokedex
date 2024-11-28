'use client'
import { useEffect, useState } from "react"
import { CapturaI } from "@/utils/types/capturas"
import ItemCaptura from "@/components/ItemCaptura"
import { TreinadorI } from "@/utils/types/treinadores"

export default function ControleCapturas() {
  const [capturas, setCapturas] = useState<CapturaI[]>([])
  const [treinadores, setTreinadores] = useState<TreinadorI[]>([])
  const [treinadorSelecionado, setTreinadorSelecionado] = useState<string>("")

  useEffect(() => {
    async function getTreinadores() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/treinadores`)
      const dados = await response.json()
      setTreinadores(dados)
    }
    getTreinadores()
  }, [])

  useEffect(() => {
    async function getCapturas() {
      if (treinadorSelecionado) {
        const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/treinadores/${treinadorSelecionado}/capturassemmap`)
        const dados = await response.json()
        setCapturas(dados)
      } else {
        setCapturas([])
      }
    }
    getCapturas()
  }, [treinadorSelecionado])

  const handleDelete = async () => {
    if (treinadorSelecionado) {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/treinadores/${treinadorSelecionado}/capturassemmap`)
      const dados = await response.json()
      setCapturas(dados)
    }
  }

  const listaCapturas = capturas.map(captura => (
    <ItemCaptura key={captura.treinadorId + String(captura.pokemonId)} captura={captura} capturas={capturas} setCapturas={setCapturas} onDelete={handleDelete} />
  ))

  return (
    <div className='m-4 mt-24'>
      <div className='flex justify-between items-center'>
        <h1 className="mb-4 text-2xl font-bold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl">
          Controle de Pokedex
        </h1>
        <div className="flex items-center mb-4">
          <label htmlFor="treinador" className="block mb-2 text-sm font-medium text-gray-900">Selecione um Treinador</label>
          <select
            id="treinador"
            className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            value={treinadorSelecionado}
            onChange={(e) => setTreinadorSelecionado(e.target.value)}
          >
            <option value="">Selecione um treinador</option>
            {treinadores.map(treinador => (
              <option key={treinador.id} value={treinador.id}>{treinador.nome}</option>
            ))}
          </select>
        </div>
      </div>
      <div className="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table className="w-full text-sm text-left rtl:text-right text-gray-500">
          <thead className="text-xs text-center text-gray-700 uppercase bg-gray-200">
            <tr>
              <th scope="col" className="px-6 py-3">
                Foto do Pokemon
              </th>
              <th scope="col" className="px-6 py-3">
                Nome
              </th>
              <th scope="col" className="px-6 py-3">
                Habilidade
              </th>
              <th scope="col" className="px-6 py-3">
                Tipos
              </th>
              <th scope="col" className="px-6 py-3">
                Fraquezas
              </th>
              <th scope="col" className="px-6 py-3">
                Ações
              </th>
            </tr>
          </thead>
          <tbody>
            {listaCapturas}
          </tbody>
        </table>
      </div>
    </div>
  )
}