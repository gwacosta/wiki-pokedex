'use client'
import { Dispatch, SetStateAction, useEffect } from "react"
import { TiDeleteOutline } from "react-icons/ti"
import { FaRegStar } from "react-icons/fa"
import Cookies from "js-cookie"
import { CarroI } from "@/utils/types/carros"

interface listaPokemonProps {
  carro: CarroI,
  carros: CarroI[],
  setCarros: Dispatch<SetStateAction<CarroI[]>>
}

function ItemCarro({ carro, carros, setCarros }: listaPokemonProps) {

  async function excluirCarro() {

    if (confirm(`Confirma a exclusão`)) {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/carros/${carro.id}`,
        {
          method: "DELETE",
          headers: {
            "Content-type": "application/json",
            Authorization: "Bearer " + Cookies.get("admin_logado_token") as string
          },
        },
      )

      if (response.status == 200) {
        const carros2 = carros.filter(x => x.id != carro.id)
        setCarros(carros2)
        alert("Carro excluído com sucesso")
      } else {
        alert("Erro... Carro não foi excluído")
      }
    }
  }

  async function alterarDestaque() {

    const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/carros/destacar/${carro.id}`,
      {
        method: "PUT",
        headers: {
          "Content-type": "application/json",
          Authorization: "Bearer " + Cookies.get("admin_logado_token") as string
        },
      },
    )

    if (response.status == 200) {
      const carros2 = carros.map(x => {
        if (x.id == carro.id) {
          return { ...x, destaque: !x.destaque }
        }
        return x
      })
      setCarros(carros2)
    }
  }

  return (
    <tr key={carro.id} className="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
      <th scope="row" className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
        <img src={carro.foto} alt="Capa do Carro"
          style={{width: 200}} />
      </th>
      <td className={`px-6 py-4 ${carro.destaque ? "font-extrabold" : ""}`}>
        {carro.modelo}
      </td>
      <td className={`px-6 py-4 ${carro.destaque ? "font-extrabold" : ""}`}>
        {carro.marca.nome}
      </td>
      <td className={`px-6 py-4 ${carro.destaque ? "font-extrabold" : ""}`}>
        {carro.ano}
      </td>
      <td className={`px-6 py-4 ${carro.destaque ? "font-extrabold" : ""}`}>
        {Number(carro.preco).toLocaleString("pt-br", { minimumFractionDigits: 2 })}
      </td>
      <td className="px-6 py-4">
        <TiDeleteOutline className="text-3xl text-red-600 inline-block cursor-pointer" title="Excluir"
          onClick={excluirCarro} />&nbsp;
        <FaRegStar className="text-3xl text-yellow-600 inline-block cursor-pointer" title="Destacar"
          onClick={alterarDestaque} />
      </td>
    </tr>
  )
}

export default ItemCarro