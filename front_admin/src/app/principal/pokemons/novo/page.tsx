'use client'
import { useForm } from "react-hook-form"
import Cookies from "js-cookie"
import { toast } from "sonner"
import { useState, useEffect } from "react"
import { GrupoI } from "@/utils/types/grupos"

type Inputs = {
  nome: string;
  numero: number;
  peso: number;
  altura: number;
  habPassiva: string;
  descricao: string;
  tipos: string[];
  fraquezas: string[];
  foto: string;
  grupoId: number;
  evolucaoId: number | null;
  evoluiDeId: number | null;
}

function NovoPokemon() {
  const [grupos, setGrupos] = useState<GrupoI[]>([])
  const {
    register,
    handleSubmit,
    reset,
    setFocus,
    setValue
  } = useForm<Inputs>()

  useEffect(() => {
    async function getGrupos() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/grupos`)
      const dados = await response.json()
      setGrupos(dados)
    }
    getGrupos()
    setFocus("nome")
    setValue("grupoId", 1)
  }, [setFocus, setValue])

  const optionsGrupo = grupos.map(grupo => (
    <option key={grupo.id} value={grupo.id}>{grupo.nome}</option>
  ))

  async function incluirPokemon(data: Inputs) {

    const novoPokemon: Inputs = {
      nome: data.nome,
      numero: data.numero,
      peso: data.peso,
      altura: data.altura,
      habPassiva: data.habPassiva,
      descricao: data.descricao,
      tipos: data.tipos.map((tipo: string) => tipo.trim()),
      fraquezas: data.fraquezas.map((fraqueza: string) => fraqueza.trim()),
      foto: data.foto,
      grupoId: data.grupoId,
      evolucaoId: data.evolucaoId,
      evoluiDeId: data.evoluiDeId
    }

    const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/pokemons`,
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
          Authorization: "Bearer " + Cookies.get("admin_logado_token") as string
        },
        body: JSON.stringify(novoPokemon)
      },
    )

    if (response.status == 201) {
      toast.success("Ok! Pokemon cadastrado com sucesso")
      reset()
    } else {
      toast.error("Erro no cadastro do Pokemon...")
    }
  }

  return (
    <>
      <h1 className="mb-4 mt-24 text-2xl font-bold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl me-56">
        Inclusão de Pokemons
      </h1>

      <form className="max-w-xl mx-auto" onSubmit={handleSubmit(incluirPokemon)}>

        <div className="grid gap-6 mb-3 md:grid-cols-2">
          <div className="mb-3">
            <label htmlFor="nome" className="block mb-2 text-sm font-medium text-gray-900">
              Nome do Pokemon</label>
            <input type="text" id="nome"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("nome")}
            />
          </div>
          <div className="mb-3">
            <label htmlFor="numero" className="block mb-2 text-sm font-medium text-gray-900">
              Número</label>
            <input type="number" id="numero"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("numero")}
            />
          </div>
        </div>

        <div className="grid gap-6 mb-3 md:grid-cols-2">
          <div className="mb-3">
            <label htmlFor="peso" className="block mb-2 text-sm font-medium text-gray-900">
              Peso</label>
            <input type="number" id="peso" step="0.1"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("peso")}
            />
          </div>
          <div className="mb-3">
            <label htmlFor="altura" className="block mb-2 text-sm font-medium text-gray-900">
              Altura</label>
            <input type="number" id="altura" step="0.1"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("altura")}
            />
          </div>
        </div>

        <div className="grid gap-6 mb-3 md:grid-cols-2">
          <div className="mb-3">
            <label htmlFor="grupoId" className="block mb-2 text-sm font-medium text-gray-900">
              Grupo</label>
            <select id="grupoId"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("grupoId")}
            >
              {optionsGrupo}
            </select>
          </div>
          <div className="mb-3">
            <label htmlFor="habPassiva" className="block mb-2 text-sm font-medium text-gray-900">
              Habilidade</label>
            <input type="text" id="habPassiva"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("habPassiva")}
            />
          </div>
        </div>

        <div className="grid gap-6 mb-3 md:grid-cols-2">
          <div className="mb-3">
            <label htmlFor="tipos" className="block mb-2 text-sm font-medium text-gray-900">
              Tipos</label>
            <input type="text" id="tipos"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("tipos")}
            />
          </div>
          <div className="mb-3">
            <label htmlFor="fraquezas" className="block mb-2 text-sm font-medium text-gray-900">
              Fraquezas</label>
            <input type="text" id="fraquezas"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
              {...register("fraquezas")}
            />
          </div>
        </div>

        <div className="grid gap-6 mb-3 md:grid-cols-2">
          <div className="mb-3">
            <label htmlFor="evoluiDeId" className="block mb-2 text-sm font-medium text-gray-900">
              ID da Evolução Anterior</label>
            <input type="number" id="evoluiDeId"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              {...register("evoluiDeId")}
            />
          </div>
          <div className="mb-3">
            <label htmlFor="evolucaoId" className="block mb-2 text-sm font-medium text-gray-900">
              ID da Evolução Posterior</label>
            <input type="number" id="evolucaoId"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
              {...register("evolucaoId")}
            />
          </div>
        </div>

        <div className="mb-3">
          <label htmlFor="foto" className="block mb-2 text-sm font-medium text-gray-900">
            URL da Foto</label>
          <input type="text" id="foto"
            className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required
            {...register("foto")}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="descricao" className="block mb-2 text-sm font-medium text-gray-900">
            Descrição</label>
          <textarea id="descricao" rows={4}
            className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500"
            {...register("descricao")}></textarea>
        </div>
        <button type="submit" className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">
          Incluir</button>
      </form>
    </>
  )
}

export default NovoPokemon