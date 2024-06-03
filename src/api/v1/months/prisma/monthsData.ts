import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();


export const createMonths = async (months: string[], quarterId: number) => {
  const transaction = months.map((month) =>
    prisma.month.create({
      data: {
        name: month,
        quarterId: quarterId
      }
    })
  )
  return await prisma.$transaction(transaction)
}

export const getMonths = async () => {
  return await prisma.month.findMany({
    include: {
      quarter: true
    }
  })
}

export const getMonthByQuarter = async (quarterId: number) => {
  return await prisma.month.findMany({
    where: {
      quarterId: quarterId
    }
  })
}