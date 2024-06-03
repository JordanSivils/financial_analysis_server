import { Request, Response } from "express";
import { createQuarter, getQuarters, getQuartersWithYear } from "./prisma/quarterData";


export const uploadQuarter = async (req: Request, res: Response) => {
  const { name, yearId } = req.body
  try {
    const quarter = await createQuarter(name, parseInt(yearId));
    res.json(quarter);
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}

export const getAllQuarters = async (req: Request, res: Response) => {
  try {
    const { yearId } = req.query
    const quarters = yearId
      ? await getQuartersWithYear(parseInt(yearId as string))
      : await getQuarters()
    res.json(quarters)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}

