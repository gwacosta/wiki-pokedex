import { PokemonI } from "@/utils/types/pokemons"
import Link from "next/link"
import { useForm } from "react-hook-form"
import { toast } from "sonner"

type Inputs = {
    termo: string
}

type InputPesquisaProps = {
    setPokemons: React.Dispatch<React.SetStateAction<PokemonI[]>>
}

export function InputPesquisaIniciais({ setPokemons }: InputPesquisaProps) {
    const { register, handleSubmit, reset } = useForm<Inputs>()

    async function enviaPesquisa(data: Inputs) {

        if (data.termo.length < 3 && isNaN(Number(data.termo))) {
            toast.warning("Digite no mínimo 3 caracteres para a pesquisa!")
            reset({ termo: "" })
            return
        }

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/pokemons/pesquisaIniciais/${data.termo}`)
        const dados = await response.json()

        if (dados.length == 0) {
            toast.error("Não foi encontrado Pokémons para a pesquisa informada!")
            reset({ termo: "" })
            return
        }

        setPokemons(dados)
    }

    async function buscaIniciais() {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/pokemons/pesquisaGrupo/2`)
        const dados = await response.json()
        setPokemons(dados)
        reset({ termo: "" })
    }

    return (
        <section>
            <div className="flex max-w-5xl mx-auto mt-3">
                <form className="flex-1" onSubmit={handleSubmit(enviaPesquisa)}>
                    <label htmlFor="text-search" className="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">
                        Pesquisar
                    </label>
                    <div className="relative">
                        <div className="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                            <svg className="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                        </div>
                        <input
                            type="text"
                            id="text-search"
                            className="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-400 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="Qual pokémon você procura? (Nome, Habilidade Passiva, Número)"
                            required
                            {...register("termo")}
                        />
                        <button type="submit" className="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            Buscar
                        </button>
                    </div>
                </form>
            </div>
            <div className="flex max-w-5xl justify-center mx-auto mt-3">
                <Link href="/">
                    <button type="button" className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                        Ver Todos
                    </button>
                </Link>
                <button type="button" className="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                    onClick={buscaIniciais}
                >
                    Ver Iniciais
                </button>
                <Link href="/miticos">
                    <button type="button" className="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900">
                        Ver Míticos
                    </button>
                </Link>
                <Link href="/lendarios">
                    <button type="button" className="focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">
                        Ver Lendários
                    </button>
                </Link>
            </div>
        </section>
    )
}