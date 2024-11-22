import { PrismaClient } from "@prisma/client"
import { Router } from "express"

const prisma = new PrismaClient()
const router = Router()

router.get("/gerais", async (req, res) => {
  try {
    const treinadores = await prisma.treinador.count()
    const pokemons = await prisma.pokemon.count()
    const capturas = await prisma.captura.count()
    res.status(200).json({ treinadores, pokemons, capturas })
  } catch (error) {
    res.status(400).json(error)
  }
})

router.get("/pokemonsGrupo", async (req, res) => {
  try {
    const pokemons = await prisma.pokemon.groupBy({
      by: ['grupoId'],
      _count: {
        id: true, 
      }
    })

    // Para cada pokemon, inclui o nome do grupo relacionado ao grupoId
    const pokemonsGrupo = await Promise.all(
      pokemons.map(async (pokemon) => {
        const grupo = await prisma.grupo.findUnique({
          where: { id: pokemon.grupoId }
        })
        return {
          grupo: grupo?.nome, 
          num: pokemon._count.id
        }
      })
    )
    res.status(200).json(pokemonsGrupo)
  } catch (error) {
    res.status(400).json(error)
  }
})

export default router
