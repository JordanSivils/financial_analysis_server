import { Request, Response } from 'express';
import { processCsvData } from './prisma/csvAndSummaryData';

export const uploadSummartCsv = async (req: Request, res: Response) => {
  const file = req.file

  if (!file) {
    return res.status(400).send("No file found")
  }

  try {
    const result = await processCsvData(file.buffer)
    res.json(result)
  } catch (error) {
    console.error('Error processing CSV:', error);
    res.status(500).send('Failed to process CSV');
  }
}