-- CreateTable
CREATE TABLE "admins" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "senha" VARCHAR(60) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admins_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admins_email_key" ON "admins"("email");
