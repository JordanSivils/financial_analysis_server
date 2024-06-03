import { Request, Response } from "express";
import { createMonths, getMonthByQuarter, getMonths } from "./prisma/monthsData";

export const uploadMonths = async (req: Request, res: Response) => {
  const months = req.body.months
  const quarterId = req.body
  try {
    const month = await createMonths(months, parseInt(quarterId))
    res.json(month);
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}

export const getAllMonths = async (req: Request, res: Response) => {
  try {
    const {quarterId} = req.query
    const months = quarterId
    ? await getMonthByQuarter(parseInt(quarterId as string))
    : await getMonths();
    res.json(months)
  } catch (error) {
    console.error("Didnt work", error)
    res.status(500).send("failed to create years")
  }
}