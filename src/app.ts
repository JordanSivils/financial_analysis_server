import express from "express";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import compression from "compression";
import cors from "cors";
import dotenv from 'dotenv';
import yearRouter from './api/v1/years/yearRouter'
import quarterRouter from './api/v1/quarters/quarterRoutes'
import monthRouter from './api/v1/months/monthsRoutes'
import categoryRouter from './api/v1/categories/categoryRoutes'
import subCategoryRouter from './api/v1/subCategories/subCategoryRoutes';
import dailyCostRouter from './api/v1/dailyCost/dailyCostRoutes';
import monthlyCostRouter from './api/v1/monthlyCost/monthlyCostRoutes';
import workdaysRouter from './api/v1/workdays/workdaysRoutes';
import subCategorySummaryRouter from './api/v1/subCategorySummary/subCategorySummaryRoutes';

const app = express();
const port = 3300;

app.use(express.json());
app.use(compression());
app.use(cookieParser());
app.use(bodyParser.json());
app.use(cors({
  credentials: true
}));
app.use(express.urlencoded({extended: false}));
dotenv.config();

app.use(yearRouter);
app.use(quarterRouter);
app.use(monthRouter);
app.use(categoryRouter);
app.use(subCategoryRouter);
app.use(dailyCostRouter);
app.use(monthlyCostRouter);
app.use(workdaysRouter);
app.use(subCategorySummaryRouter);

app.listen(port, () => {
  console.log(`Port: ${port}`)
})