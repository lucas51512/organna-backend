-- CreateTable
CREATE TABLE `Pessoa` (
    `idPessoa` INTEGER NOT NULL AUTO_INCREMENT,
    `nomePessoa` VARCHAR(191) NOT NULL,
    `fonePessoa` VARCHAR(191) NOT NULL,
    `emailPessoa` VARCHAR(191) NOT NULL,
    `senhaPessoa` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idPessoa`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
