import { MarcaI } from "./marcas"

export interface CarroI {
  id: number
  modelo: string
  ano: number
  preco: number
  km: number
  destaque: boolean
  foto: string
  acessorios: string
  marca: MarcaI
  marcaId: number,
  adminId: number
}