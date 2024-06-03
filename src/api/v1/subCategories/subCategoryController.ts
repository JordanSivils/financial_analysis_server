import { Request, Response } from "express";
import { SubCategoryInput, createSubCategories } from "./prisma/subCategoryData";

export const uploadSubCategories = async (req: Request, res: Response) => {
  const {subCategories}: {subCategories: SubCategoryInput[]} = req.body
  
  try {
    const createdSubCategories = await createSubCategories(subCategories);
    res.json(createdSubCategories);
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}