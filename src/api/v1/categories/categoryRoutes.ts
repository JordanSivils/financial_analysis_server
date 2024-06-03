import express from 'express';
import { getAllCategories, uploadCategories } from './categoryController';
const router = express.Router();

router.post('/api/categories', uploadCategories);
router.get('/api/categories', getAllCategories);

export default router