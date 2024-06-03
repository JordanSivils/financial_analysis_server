import { PrismaClient, SubCategory } from "@prisma/client";
const prisma = new PrismaClient();

 export interface SubCategoryInput {
  name: string;
  categoryId: number;
}

export const createSubCategories = async (subCategories: SubCategoryInput[]) => {
  if (!subCategories || !Array.isArray(subCategories)) {
    throw new Error('Invalid subCategories input. Expected an array of strings.');
  }

  const transaction = subCategories.map((subCategory) => 
    prisma.subCategory.create({
      data: {
        name: subCategory.name,
        categoryId: Number(subCategory.categoryId)
      }
    })
  )
  return await prisma.$transaction(transaction);
}

export const getSubCategories = async () => {
  return await prisma.subCategory.findMany()
}

// export const createSubCategories = async (subCategories: string[], categoryId: number) => {
//   return await prisma.subCategory.createMany({
//     data: {
//       name: subCategories,
//       categoryId: categoryId
//     }
//   })
// }
