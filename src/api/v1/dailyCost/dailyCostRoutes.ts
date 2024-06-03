import express from 'express';
import { uploadDailyCosts } from './dailyCostController';
const router = express.Router();

router.post('/api/daily-costs', uploadDailyCosts);

export default router;