-- CreateTable
CREATE TABLE "grupos" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(30) NOT NULL,

    CONSTRAINT "grupos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pokemons" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "numero" INTEGER NOT NULL,
    "peso" DECIMAL(6,1) NOT NULL,
    "altura" DECIMAL(5,1) NOT NULL,
    "habPassiva" VARCHAR(60) NOT NULL,
    "descricao" TEXT NOT NULL,
    "tipos" JSON NOT NULL,
    "fraquezas" JSON NOT NULL,
    "foto" TEXT NOT NULL,
    "grupoId" INTEGER NOT NULL,
    "evolucaoId" INTEGER,
    "evoluiDeId" INTEGER,

    CONSTRAINT "pokemons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "treinadores" (
    "id" VARCHAR(36) NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "email" VARCHAR(40) NOT NULL,
    "senha" VARCHAR(60) NOT NULL,
    "codigo" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "treinadores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capturas" (
    "treinadorId" VARCHAR(36) NOT NULL,
    "pokemonId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "capturas_pkey" PRIMARY KEY ("treinadorId","pokemonId")
);

-- CreateIndex
CREATE UNIQUE INDEX "treinadores_email_key" ON "treinadores"("email");

-- AddForeignKey
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "grupos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_evolucaoId_fkey" FOREIGN KEY ("evolucaoId") REFERENCES "pokemons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_evoluiDeId_fkey" FOREIGN KEY ("evoluiDeId") REFERENCES "pokemons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capturas" ADD CONSTRAINT "capturas_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES "treinadores"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capturas" ADD CONSTRAINT "capturas_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
