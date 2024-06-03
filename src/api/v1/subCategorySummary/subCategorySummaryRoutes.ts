import express from 'express';
import upload from '../../../middleware/multer';
import { uploadSummartCsv } from './subCategorySummaryController';
const router = express.Router();

router.post('/api/upload-csv', upload.single('file'), uploadSummartCsv);

export default router;