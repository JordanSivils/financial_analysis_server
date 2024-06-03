import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()

export const createWorkdays = async (days: number, monthId: number) => {
  // Fetch all daily dependent costs
  const dailyDependantCosts = await prisma.dailyDependentCost.findMany()
  const totalDailyDependentCosts = dailyDependantCosts.reduce((acc, cost) => acc + cost.dailyCost, 0)

  // Fetch all monthly fixed costs
  const monthlyFixedCosts = await prisma.monthlyFixedCost.findMany();
  const totalMonthlyFixedCosts = monthlyFixedCosts.reduce((acc, cost) => acc + cost.monthlyCost, 0)

  // Calculate the daily cost
  const dailyCost = totalDailyDependentCosts + (totalMonthlyFixedCosts / days)

   await prisma.costPerDay.create({
    data: {
      dailyCost: dailyCost,
      monthId: monthId
    }
  })

  await prisma.workdays.create({
    data: {
      days: days,
      monthId: monthId
    }
  })
}