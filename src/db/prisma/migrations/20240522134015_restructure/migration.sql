/*
  Warnings:

  - You are about to drop the column `cost` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `discounts` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `grossSales` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `markup` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `monthId` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `netSales` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `percentOfSales` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `profit` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `cost` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `discounts` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `grossSales` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `markup` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `netSales` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `percentOfSales` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `profit` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `month` table. All the data in the column will be lost.
  - You are about to drop the column `cost` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `discounts` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `grossSales` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `markup` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `netSales` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `percentOfSales` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `profit` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `quarter` table. All the data in the column will be lost.
  - You are about to drop the column `cost` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `discounts` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `grossSales` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `markup` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `netSales` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `percentOfSales` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `profit` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `subcategory` table. All the data in the column will be lost.
  - You are about to drop the column `cost` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `discounts` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `grossSales` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `markup` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `netSales` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `percentOfSales` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `profit` on the `year` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `year` table. All the data in the column will be lost.
  - You are about to drop the `_financialstosubcategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `financials` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `Category` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Month` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Quarter` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `SubCategory` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Year` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `_financialstosubcategory` DROP FOREIGN KEY `_FinancialsToSubCategory_A_fkey`;

-- DropForeignKey
ALTER TABLE `_financialstosubcategory` DROP FOREIGN KEY `_FinancialsToSubCategory_B_fkey`;

-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `Category_monthId_fkey`;

-- AlterTable
ALTER TABLE `category` DROP COLUMN `cost`,
    DROP COLUMN `discounts`,
    DROP COLUMN `grossSales`,
    DROP COLUMN `markup`,
    DROP COLUMN `monthId`,
    DROP COLUMN `netSales`,
    DROP COLUMN `percentOfSales`,
    DROP COLUMN `profit`,
    DROP COLUMN `quantity`;

-- AlterTable
ALTER TABLE `month` DROP COLUMN `cost`,
    DROP COLUMN `discounts`,
    DROP COLUMN `grossSales`,
    DROP COLUMN `markup`,
    DROP COLUMN `netSales`,
    DROP COLUMN `percentOfSales`,
    DROP COLUMN `profit`,
    DROP COLUMN `quantity`;

-- AlterTable
ALTER TABLE `quarter` DROP COLUMN `cost`,
    DROP COLUMN `discounts`,
    DROP COLUMN `grossSales`,
    DROP COLUMN `markup`,
    DROP COLUMN `netSales`,
    DROP COLUMN `percentOfSales`,
    DROP COLUMN `profit`,
    DROP COLUMN `quantity`;

-- AlterTable
ALTER TABLE `subcategory` DROP COLUMN `cost`,
    DROP COLUMN `discounts`,
    DROP COLUMN `grossSales`,
    DROP COLUMN `markup`,
    DROP COLUMN `netSales`,
    DROP COLUMN `percentOfSales`,
    DROP COLUMN `profit`,
    DROP COLUMN `quantity`;

-- AlterTable
ALTER TABLE `year` DROP COLUMN `cost`,
    DROP COLUMN `discounts`,
    DROP COLUMN `grossSales`,
    DROP COLUMN `markup`,
    DROP COLUMN `netSales`,
    DROP COLUMN `percentOfSales`,
    DROP COLUMN `profit`,
    DROP COLUMN `quantity`;

-- DropTable
DROP TABLE `_financialstosubcategory`;

-- DropTable
DROP TABLE `financials`;

-- CreateTable
CREATE TABLE `CategorySummary` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `categoryId` INTEGER NOT NULL,
    `monthId` INTEGER NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategorySummary` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subCategoryId` INTEGER NOT NULL,
    `monthId` INTEGER NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Category_name_key` ON `Category`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `Month_name_key` ON `Month`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `Quarter_name_key` ON `Quarter`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `SubCategory_name_key` ON `SubCategory`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `Year_name_key` ON `Year`(`name`);

-- AddForeignKey
ALTER TABLE `CategorySummary` ADD CONSTRAINT `CategorySummary_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategorySummary` ADD CONSTRAINT `CategorySummary_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategorySummary` ADD CONSTRAINT `SubCategorySummary_subCategoryId_fkey` FOREIGN KEY (`subCategoryId`) REFERENCES `SubCategory`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategorySummary` ADD CONSTRAINT `SubCategorySummary_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
