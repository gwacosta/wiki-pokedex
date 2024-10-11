-- CreateTable
CREATE TABLE `grupos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pokemons` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(60) NOT NULL,
    `peso` DECIMAL(6, 1) NOT NULL,
    `altura` DECIMAL(5, 1) NOT NULL,
    `habPassiva` VARCHAR(60) NOT NULL,
    `fraquezas` JSON NOT NULL,
    `tipos` JSON NOT NULL,
    `grupoId` INTEGER NOT NULL,
    `evolucaoId` INTEGER NULL,
    `evoluiDeId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pokemons` ADD CONSTRAINT `pokemons_grupoId_fkey` FOREIGN KEY (`grupoId`) REFERENCES `grupos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemons` ADD CONSTRAINT `pokemons_evolucaoId_fkey` FOREIGN KEY (`evolucaoId`) REFERENCES `pokemons`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pokemons` ADD CONSTRAINT `pokemons_evoluiDeId_fkey` FOREIGN KEY (`evoluiDeId`) REFERENCES `pokemons`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
