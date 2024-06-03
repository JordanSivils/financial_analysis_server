import { Request, Response } from "express";
import { createDailyCost } from "./prisma/dailyCostData";

export const uploadDailyCosts = async (req: Request, res: Response) => {
  const dailyCosts = req.body.dailyCosts

  const convertCost = dailyCosts.map((dailyCost: any) => ({
    ...dailyCost,
    dailyCost: parseFloat(dailyCost.dailyCost)
  }))
  try {
    const dailyCost = await createDailyCost(convertCost);
    res.json(dailyCost)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}