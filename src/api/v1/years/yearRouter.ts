import express from 'express';
import { getAllYears, uploadYears } from './yearController';
const router = express.Router()

router.post("/api/year", uploadYears)
router.get('/api/years', getAllYears);

export default router