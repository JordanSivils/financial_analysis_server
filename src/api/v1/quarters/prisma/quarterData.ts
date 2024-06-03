import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export const createQuarter = async (name: string, yearId: number) => {
  return await prisma.quarter.create({
    data: { 
      name: name,
      yearId: yearId
     }
  })
}

export const getQuarters = async () => {
  return await prisma.quarter.findMany({
    include:{
      year: true
    }
  })
}

export const getQuartersWithYear = async (yearId: number) => {
  return await prisma.quarter.findMany({
    where: {
      yearId: (yearId)
    }
  })
}