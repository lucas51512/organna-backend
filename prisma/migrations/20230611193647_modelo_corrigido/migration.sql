/*
  Warnings:

  - You are about to alter the column `dataNascimento` on the `usuarios` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `DateTime(3)`.
  - You are about to drop the `etiqueta` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `nota` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pomodoro` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `prioridade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tarefa` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `usuarios` DROP FOREIGN KEY `Usuarios_pessoaIdFk_fkey`;

-- AlterTable
ALTER TABLE `usuarios` MODIFY `dataNascimento` DATETIME(3) NULL,
    MODIFY `numeroCelular` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `etiqueta`;

-- DropTable
DROP TABLE `nota`;

-- DropTable
DROP TABLE `pessoa`;

-- DropTable
DROP TABLE `pomodoro`;

-- DropTable
DROP TABLE `prioridade`;

-- DropTable
DROP TABLE `tarefa`;

-- CreateTable
CREATE TABLE `pomodoros` (
    `idPomodoro` INTEGER NOT NULL AUTO_INCREMENT,
    `tempoDescanso` DOUBLE NULL,
    `tempoTrabalho` DOUBLE NULL,
    `usuarioIdFk` INTEGER NULL,

    PRIMARY KEY (`idPomodoro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tarefas` (
    `idTarefa` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeTarefa` VARCHAR(191) NOT NULL,
    `inicioTarefa` DATETIME(3) NULL,
    `vencimentoTarefa` DATETIME(3) NULL,
    `descricaoTarefa` VARCHAR(191) NOT NULL,
    `comentarioTarefa` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idTarefa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prioridades` (
    `idPrioridade` INTEGER NOT NULL AUTO_INCREMENT,
    `nomePrioridade` VARCHAR(191) NOT NULL,
    `descricaoPrioridade` VARCHAR(191) NOT NULL,
    `corPrioridade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idPrioridade`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notas` (
    `idNota` INTEGER NOT NULL AUTO_INCREMENT,
    `tituloNota` VARCHAR(191) NOT NULL,
    `descricaoNota` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idNota`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `etiquetas` (
    `idEtiqueta` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeEtiqueta` VARCHAR(191) NOT NULL,
    `corEtiqueta` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idEtiqueta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pessoas` (
    `idPessoa` INTEGER NOT NULL AUTO_INCREMENT,
    `nomePessoa` VARCHAR(191) NOT NULL,
    `fonePessoa` VARCHAR(191) NOT NULL,
    `emailPessoa` VARCHAR(191) NOT NULL,
    `senhaPessoa` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idPessoa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UsuarioTarefa` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_UsuarioTarefa_AB_unique`(`A`, `B`),
    INDEX `_UsuarioTarefa_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UsuarioNota` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_UsuarioNota_AB_unique`(`A`, `B`),
    INDEX `_UsuarioNota_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_UsuarioEtiqueta` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_UsuarioEtiqueta_AB_unique`(`A`, `B`),
    INDEX `_UsuarioEtiqueta_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_pessoaIdFk_fkey` FOREIGN KEY (`pessoaIdFk`) REFERENCES `pessoas`(`idPessoa`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pomodoros` ADD CONSTRAINT `pomodoros_usuarioIdFk_fkey` FOREIGN KEY (`usuarioIdFk`) REFERENCES `usuarios`(`idUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioTarefa` ADD CONSTRAINT `_UsuarioTarefa_A_fkey` FOREIGN KEY (`A`) REFERENCES `tarefas`(`idTarefa`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioTarefa` ADD CONSTRAINT `_UsuarioTarefa_B_fkey` FOREIGN KEY (`B`) REFERENCES `usuarios`(`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioNota` ADD CONSTRAINT `_UsuarioNota_A_fkey` FOREIGN KEY (`A`) REFERENCES `notas`(`idNota`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioNota` ADD CONSTRAINT `_UsuarioNota_B_fkey` FOREIGN KEY (`B`) REFERENCES `usuarios`(`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioEtiqueta` ADD CONSTRAINT `_UsuarioEtiqueta_A_fkey` FOREIGN KEY (`A`) REFERENCES `etiquetas`(`idEtiqueta`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_UsuarioEtiqueta` ADD CONSTRAINT `_UsuarioEtiqueta_B_fkey` FOREIGN KEY (`B`) REFERENCES `usuarios`(`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `usuarios` RENAME INDEX `Usuarios_emailUsuario_key` TO `usuarios_emailUsuario_key`;
