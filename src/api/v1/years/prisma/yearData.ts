import { PrismaClient } from "@prisma/client";
import { generateMonthsForQuarter, generateQuarters } from "../utilities/yearMonth";
const prisma = new PrismaClient();

export const createYear = async (name: string) => {
  const year = await prisma.year.create({
    data: {
      name: name
    }
  })

  const quartersData = generateQuarters(year.id)

  const createdQuarters = await Promise.all(
    quartersData.map(async quartersData => {
      const quarter = await prisma.quarter.create({
        data: quartersData
      })

      const monthsData = generateMonthsForQuarter(quarter.id, quartersData.name)

      await prisma.month.createMany({
        data: monthsData
      })

      return quarter
    })
  )
}

export const getYears = async () => {
  return await prisma.year.findMany()
}