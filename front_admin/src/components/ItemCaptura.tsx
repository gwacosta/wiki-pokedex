'use client'
import { Dispatch, SetStateAction } from "react"
import { TiDeleteOutline } from "react-icons/ti"
import { FaRegEdit } from "react-icons/fa"
import Cookies from "js-cookie"
import { CapturaI } from "@/utils/types/capturas"

interface listaCapturaProps {
  captura: CapturaI,
  capturas: CapturaI[],
  setCapturas: Dispatch<SetStateAction<CapturaI[]>>
  onDelete: () => void
}

function ItemCaptura({ captura, capturas, setCapturas, onDelete }: listaCapturaProps) {

  const handleDelete = async () => {



    if (confirm(`Confirma Exclusão da Captura do Pokemon "${captura.pokemon.nome}" pelo Treinador "${captura.treinador.nome}"?`)) {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/capturas`,
        {
          method: "DELETE",
          headers: {
            "Content-type": "application/json",
            Authorization: "Bearer " + Cookies.get("admin_logado_token") as string
          },
          body: JSON.stringify(
            {
              treinadorId: captura.treinadorId,
              pokemonId: captura.pokemonId
            }
          )
        },
      )

      if (response.status == 200) {
        const capturas2 = capturas.filter(x => x.id != captura.id)
        setCapturas(capturas2)
        alert("Captura excluída com sucesso")
      } else {
        alert("Erro... Captura não foi excluída")
      }
      onDelete()
    }
  }

  return (
    <tr key={captura.id} className="odd:bg-white even:bg-gray-50 border-b">
      <th scope="row" className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
        <img src={captura.pokemon.foto} alt="Foto do Pokemon"
          style={{ width: 200 }} />
      </th>
      <td className={`px-6 py-4 text-center`}>
        {captura.pokemon.nome}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {captura.pokemon.habPassiva}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {captura.pokemon.tipos.join(", ")}
      </td>
      <td className={`px-6 py-4 text-center`}>
        {captura.pokemon.fraquezas.join(", ")}
      </td>
      <td className="px-6 py-4">
        <TiDeleteOutline className="text-3xl text-red-600 inline-block cursor-pointer" title="Excluir"
          onClick={handleDelete} />
      </td>

    </tr>
  )
}

export default ItemCaptura