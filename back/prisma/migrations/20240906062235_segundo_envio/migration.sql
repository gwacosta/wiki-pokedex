/*
  Warnings:

  - Added the required column `foto` to the `pokemons` table without a default value. This is not possible if the table is not empty.
  - Added the required column `miniatura` to the `pokemons` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `pokemons` ADD COLUMN `foto` VARCHAR(191) NOT NULL,
    ADD COLUMN `miniatura` VARCHAR(191) NOT NULL;
