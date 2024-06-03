import { Request, Response } from "express";
import { createYear, getYears } from "./prisma/yearData";


export const uploadYears = async (req: Request, res: Response) => {
  const name  = req.body.year
  try {
    const years = await createYear(name)
    res.json(years)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}

export const getAllYears = async (req: Request, res: Response) => {
  try {
    const years = await getYears();
    res.json(years)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}