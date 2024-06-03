import express from 'express';
import { uploadSubCategories } from './subCategoryController';
const router = express.Router()

router.post('/api/sub-categories', uploadSubCategories);

export default router;