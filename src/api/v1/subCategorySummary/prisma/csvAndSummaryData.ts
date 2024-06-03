import { PrismaClient } from "@prisma/client";
import Papa from 'papaparse'
import { getSubCategories } from "../../subCategories/prisma/subCategoryData";
import { marginToMarkup } from "../utilities/transformData";

const prisma = new PrismaClient();

export const processCsvData = async (fileBuffer: Buffer) => {
  const csvData = fileBuffer.toString('utf-8');
  const parsedData = Papa.parse(csvData, {
    header: true,
    skipEmptyLines: true
  })

  console.log("parsed data:", parsedData.data)

  if (parsedData.errors.length) {
    throw new Error("Csv parsing error")
  }

  const financialData = parsedData.data;

  const subCategories = await getSubCategories();
  console.log('subCats', subCategories)

  const matchedData = financialData.map((row: any) => {
    const subCategory = subCategories.find((subCat) => subCat.name === row.Category);
    if (subCategory) {
      return {
        ...row,
        subCategoryId: subCategory.id
      }
    }
    return null
  }).filter((row) => row !== null);

  console.log('matched data', matchedData);

  try {
    const result = await prisma.subCategorySummary.createMany({
      data: matchedData.map((data: any) => ({
        grossSales: parseFloat(data.grossSales) || 0,
        discounts: parseFloat(data.discounts) || 0,
        netSales: parseFloat(data.netSales) || 0,
        cost: parseFloat(data.extcosts) || 0,
        profit: parseFloat(data.profit) || 0,
        markup: marginToMarkup(parseFloat(data.margin)) || 0,
        percentOfSales: parseFloat(data.percentOfSales) || 0,
        quantity: parseInt(data.quantity) || 0,
        subCategoryId: data.subCategoryId,
        monthId: 1
      }))
    })
    console.log('Insert Result:', result); // Log insert result
    return { message: 'CSV data processed successfully' };
  } catch (error) {
    console.error('Error inserting data:', error); // Log insertion errors
    throw error;
  }
   
  
}