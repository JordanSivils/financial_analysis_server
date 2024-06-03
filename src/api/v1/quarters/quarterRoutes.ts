import express from 'express';
import { getAllQuarters, uploadQuarter } from './quarterControllers';
const router = express.Router()

router.post("/api/quarter/create", uploadQuarter);
router.get("/api/quarters", getAllQuarters)

export default router