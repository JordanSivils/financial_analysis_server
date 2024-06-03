import { Category, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const createCategories = async (categories: Category[]) => {
  return await prisma.category.createMany({
    data: categories
  })
}

export const getCategories = async () => {
  return await prisma.category.findMany()
}