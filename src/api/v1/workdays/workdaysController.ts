import { Request, Response } from "express";
import { createWorkdays } from "./prisma/workdaysData";

export const uploadWordays = async (req: Request, res: Response) => {
  const { days, monthId } = req.body
  try {
    const result = await createWorkdays(parseInt(days), parseInt(monthId))
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}