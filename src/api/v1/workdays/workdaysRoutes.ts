import express from 'express';
import { uploadWordays } from './workdaysController';
const router = express.Router()

router.post('/api/workdays', uploadWordays);

export default router;