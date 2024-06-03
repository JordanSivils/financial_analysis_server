import { Request, Response } from "express";
import { createMonthlyCost } from "./prisma/monthlyCostData";

export const uploadMonthlyCosts = async (req: Request, res: Response) => {
  const monthlyCosts = req.body.monthlyCosts

  const convertCost = monthlyCosts.map((monthlyCost: any) => ({
    ...monthlyCost,
    monthlyCost: parseFloat(monthlyCost.monthlyCost)
  }))

  try {
    const monthlyCost = await createMonthlyCost(convertCost);
    res.json(monthlyCost)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}