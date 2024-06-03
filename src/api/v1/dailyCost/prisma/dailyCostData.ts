import {  DailyDependentCost, PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();



export const createDailyCost = async (dailyCosts: DailyDependentCost[]) => {
  return await prisma.dailyDependentCost.createMany({
    data: dailyCosts
  })
}