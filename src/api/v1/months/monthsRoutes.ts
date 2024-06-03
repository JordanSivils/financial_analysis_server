import express from 'express';
import { getAllMonths, uploadMonths } from './monthsController';
const router = express.Router()

router.post('/api/month/create', uploadMonths);
router.get('/api/months', getAllMonths);

export default router;