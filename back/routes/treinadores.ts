import { PrismaClient } from "@prisma/client"
import { Router } from "express"
import bcrypt from 'bcrypt'

const prisma = new PrismaClient()
const router = Router()

router.get("/", async (req, res) => {
    try {
        const treinadores = await prisma.treinador.findMany()
        res.status(200).json(treinadores)
    } catch (error) {
        res.status(400).json(error)
    }
})

function validaSenha(senha: string) {

    const mensa: string[] = []

    // .length: retorna o tamanho da string (da senha)
    if (senha.length < 8) {
        mensa.push("Erro... senha deve possuir, no mínimo, 8 caracteres")
    }

    // contadores
    let pequenas = 0
    let grandes = 0
    let numeros = 0
    let simbolos = 0

    // senha = "abc123"
    // letra = "a"

    // percorre as letras da variável senha
    for (const letra of senha) {
        // expressão regular
        if ((/[a-z]/).test(letra)) {
            pequenas++
        }
        else if ((/[A-Z]/).test(letra)) {
            grandes++
        }
        else if ((/[0-9]/).test(letra)) {
            numeros++
        } else {
            simbolos++
        }
    }

    if (pequenas == 0 || grandes == 0 || numeros == 0 || simbolos == 0) {
        mensa.push("Erro... senha deve possuir letras minúsculas, maiúsculas, números e símbolos")
    }

    return mensa
}

router.post("/", async (req, res) => {
    const { nome, email, senha } = req.body

    if (!nome || !email || !senha) {
        res.status(400).json({ erro: "Informe nome, email e senha" })
        return
    }

    const erros = validaSenha(senha)
    if (erros.length > 0) {
        res.status(400).json({ erro: erros.join("; ") })
        return
    }

    // 12 é o número de voltas (repetições) que o algoritmo faz
    // para gerar o salt (sal/tempero)
    const salt = bcrypt.genSaltSync(12)
    // gera o hash da senha acrescida do salt
    const hash = bcrypt.hashSync(senha, salt)

    // para o campo senha, atribui o hash gerado
    try {
        const treinador = await prisma.treinador.create({
            data: { nome, email, senha: hash }
        })
        res.status(201).json(treinador)
    } catch (error) {
        res.status(400).json(error)
    }
})

router.delete("/:id", async (req, res) => {
    const { id } = req.params

    try {
        const treinador = await prisma.treinador.delete({
            where: { id: id }
        })
        res.status(200).json(treinador)
    } catch (error) {
        res.status(400).json(error)
    }
})

router.put("/:id", async (req, res) => {
    const { id } = req.params
    const { nome, email, senha } = req.body

    if (!nome || !email || !senha) {
        res.status(400).json({ "erro": "Informe nome, email, senha," })
        return
    }

    try {

        const treinador = await prisma.treinador.update({
            where: { id: id },
            data: {
                nome,
                email,
                senha
            }
        })

        res.status(200).json(treinador)
    } catch (error) {
        res.status(400).json(error)
    }
})

router.post("/login", async (req, res) => {
  const { email, senha } = req.body

  // em termos de segurança, o recomendado é exibir uma mensagem padrão
  // a fim de evitar de dar "dicas" sobre o processo de login para hackers
  const mensaPadrao = "Login ou senha incorretos"

  if (!email || !senha) {
    res.status(400).json({ erro: mensaPadrao })
    return
  }

  try {
    const treinador = await prisma.treinador.findUnique({
      where: { email }
    })

    if (treinador == null) {
      res.status(400).json({ erro: mensaPadrao })
      return
    }

    // se o e-mail existe, faz-se a comparação dos hashs
    if (bcrypt.compareSync(senha, treinador.senha)) {
      res.status(200).json({
        id: treinador.id,
        nome: treinador.nome,
        email: treinador.email,
      })
    } else {
      res.status(400).json({ erro: mensaPadrao })
    }
  } catch (error) {
    res.status(400).json(error)
  }
})

export default router