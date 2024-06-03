/*
  Warnings:

  - You are about to drop the `fixedcost` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `fixedcost` DROP FOREIGN KEY `FixedCost_monthId_fkey`;

-- DropTable
DROP TABLE `fixedcost`;

-- CreateTable
CREATE TABLE `CostPerDay` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dailyCost` DOUBLE NOT NULL,
    `monthId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DailyDependentCost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `dailyCost` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MonthlyFixedCost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `monthlyCost` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CostPerDay` ADD CONSTRAINT `CostPerDay_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
