-- AlterTable
ALTER TABLE "pokemons" ADD COLUMN     "adminId" INTEGER NOT NULL DEFAULT 1;

-- AddForeignKey
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES "admins"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
