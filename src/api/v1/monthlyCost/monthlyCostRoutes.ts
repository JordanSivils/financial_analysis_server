import express from 'express';
import { uploadMonthlyCosts } from './monthlyCostController';
const router = express.Router();

router.post('/api/monthly-costs', uploadMonthlyCosts);

export default router;