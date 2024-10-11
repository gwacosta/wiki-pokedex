/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `treinadores` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `treinadores_email_key` ON `treinadores`(`email`);
