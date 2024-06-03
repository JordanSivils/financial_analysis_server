import { Request, Response } from "express";
import { createCategories, getCategories } from "./prisma/categoryData";

export const uploadCategories = async (req: Request, res: Response) => {
  const categories = req.body.categories
  try {
    const category = await createCategories(categories);
    res.json(category);
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}

export const getAllCategories = async (req: Request, res: Response) => {
  try {
    const categories = await getCategories();
    res.json(categories)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}