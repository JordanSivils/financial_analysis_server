-- CreateTable
CREATE TABLE `Year` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
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
CREATE TABLE `Quarter` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `yearId` INTEGER NOT NULL,

    INDEX `Quarter_yearId_idx`(`yearId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Month` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `quarterId` INTEGER NOT NULL,

    INDEX `Month_quarterId_idx`(`quarterId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `monthId` INTEGER NOT NULL,

    INDEX `Category_monthId_idx`(`monthId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubCategory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,

    INDEX `SubCategory_categoryId_idx`(`categoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Financials` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `grossSales` DOUBLE NOT NULL,
    `discounts` DOUBLE NOT NULL,
    `netSales` DOUBLE NOT NULL,
    `cost` DOUBLE NOT NULL,
    `profit` DOUBLE NOT NULL,
    `markup` DOUBLE NOT NULL,
    `percentOfSales` DOUBLE NOT NULL,
    `quantity` INTEGER NOT NULL,
    `subCategoryId` INTEGER NOT NULL,

    INDEX `Financials_subCategoryId_idx`(`subCategoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FixedCost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `type` ENUM('Constant', 'DailyDependent') NOT NULL,
    `monthlyAmount` DOUBLE NOT NULL,
    `dailyAmount` DOUBLE NOT NULL,
    `workDaysInMonth` INTEGER NOT NULL,
    `monthId` INTEGER NOT NULL,

    INDEX `FixedCost_monthId_idx`(`monthId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_FinancialsToSubCategory` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_FinancialsToSubCategory_AB_unique`(`A`, `B`),
    INDEX `_FinancialsToSubCategory_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Quarter` ADD CONSTRAINT `Quarter_yearId_fkey` FOREIGN KEY (`yearId`) REFERENCES `Year`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Month` ADD CONSTRAINT `Month_quarterId_fkey` FOREIGN KEY (`quarterId`) REFERENCES `Quarter`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Category` ADD CONSTRAINT `Category_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubCategory` ADD CONSTRAINT `SubCategory_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FixedCost` ADD CONSTRAINT `FixedCost_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FinancialsToSubCategory` ADD CONSTRAINT `_FinancialsToSubCategory_A_fkey` FOREIGN KEY (`A`) REFERENCES `Financials`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FinancialsToSubCategory` ADD CONSTRAINT `_FinancialsToSubCategory_B_fkey` FOREIGN KEY (`B`) REFERENCES `SubCategory`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
