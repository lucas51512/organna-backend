/*
  Warnings:

  - You are about to drop the `usuario` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[idUsuario]` on the table `Pessoa` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `pessoa` ADD COLUMN `idUsuario` INTEGER NULL;

-- DropTable
DROP TABLE `usuario`;

-- CreateTable
CREATE TABLE `Usuarios` (
    `idUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeUsuario` VARCHAR(191) NOT NULL,
    `dataNascimento` VARCHAR(191) NOT NULL,
    `numeroCelular` VARCHAR(191) NOT NULL,
    `emailUsuario` VARCHAR(191) NOT NULL,
    `hash` VARCHAR(191) NOT NULL,
    `pessoaIdFk` INTEGER NULL,

    UNIQUE INDEX `Usuarios_emailUsuario_key`(`emailUsuario`),
    UNIQUE INDEX `Usuarios_pessoaIdFk_key`(`pessoaIdFk`),
    PRIMARY KEY (`idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Pessoa_idUsuario_key` ON `Pessoa`(`idUsuario`);

-- AddForeignKey
ALTER TABLE `Usuarios` ADD CONSTRAINT `Usuarios_pessoaIdFk_fkey` FOREIGN KEY (`pessoaIdFk`) REFERENCES `Pessoa`(`idPessoa`) ON DELETE SET NULL ON UPDATE CASCADE;
