import { MonthlyFixedCost, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()


export const createMonthlyCost = async (monthlyCosts: MonthlyFixedCost[]) => {
  return await prisma.monthlyFixedCost.createMany({
    data: monthlyCosts
  })
};