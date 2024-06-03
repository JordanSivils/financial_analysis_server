-- CreateTable
CREATE TABLE `Workdays` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `days` INTEGER NOT NULL,
    `monthId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Workdays` ADD CONSTRAINT `Workdays_monthId_fkey` FOREIGN KEY (`monthId`) REFERENCES `Month`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
