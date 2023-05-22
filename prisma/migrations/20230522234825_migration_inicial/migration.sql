-- CreateTable
CREATE TABLE `Usuario` (
    `idUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeUsuario` VARCHAR(191) NOT NULL,
    `emailUsuario` VARCHAR(191) NOT NULL,
    `senhaUsuario` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pomodoro` (
    `idPomodoro` INTEGER NOT NULL AUTO_INCREMENT,
    `tempoDescanso` DOUBLE NOT NULL,
    `tempoTrabalho` DOUBLE NOT NULL,

    PRIMARY KEY (`idPomodoro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tarefa` (
    `idTarefa` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeTarefa` VARCHAR(191) NOT NULL,
    `inicioTarefa` DATETIME(3) NOT NULL,
    `vencimentoTarefa` DATETIME(3) NOT NULL,
    `descricaoTarefa` VARCHAR(191) NOT NULL,
    `comentarioTarefa` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idTarefa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prioridade` (
    `idPrioridade` INTEGER NOT NULL AUTO_INCREMENT,
    `nomePrioridade` VARCHAR(191) NOT NULL,
    `descricaoPrioridade` VARCHAR(191) NOT NULL,
    `corPrioridade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idPrioridade`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Nota` (
    `idNota` INTEGER NOT NULL AUTO_INCREMENT,
    `tituloNota` VARCHAR(191) NOT NULL,
    `descricaoNota` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idNota`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Etiqueta` (
    `idEtiqueta` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeEtiqueta` VARCHAR(191) NOT NULL,
    `corEtiqueta` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idEtiqueta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
