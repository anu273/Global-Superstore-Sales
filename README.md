# Global SuperStore Analytics

A SQL-based analytics project analyzing retail performance across global markets from 2011-2014.

## Overview

This project provides insights into sales, profitability, and operational metrics for a global retail superstore through SQL queries and interactive dashboards.

**Key Metrics:**
- Total Sales: $12.6M
- Total Profit: $1.5M
- Total Orders: 178,312
- Markets: 7 (Africa, APAC, Canada, EMEA, EU, LATAM, US)

## Dashboard

View the interactive dashboard on Tableau Public: [Global SuperStore Dashboard](https://public.tableau.com/shared/3GTPHGTGZ?:display_count=n&:origin=viz_share_link)

### Sales Overview
<img width="1706" height="959" alt="Image" src="https://github.com/user-attachments/assets/e3cbdb41-eba2-4911-95e3-8760c651351c" />

### Top Sellers
<img width="1706" height="959" alt="Image" src="https://github.com/user-attachments/assets/44360648-bbee-4912-95d0-8071f11054eb" />

### Bottom Sellers
<img width="1706" height="959" alt="Image" src="https://github.com/user-attachments/assets/2e3ab802-96f8-4678-9ca7-74f17a65f93b" />

### Key Insights
<img width="1706" height="959" alt="Image" src="https://github.com/user-attachments/assets/118f83ab-9877-4edd-8e10-2270249a5eca" />

### Details
<img width="1706" height="959" alt="Image" src="https://github.com/user-attachments/assets/8fe2925a-1094-4dca-8f6a-f78355d44e04" />

## Features

- **Sales Analysis:** Track performance by category, sub-category, and market
- **Profitability Metrics:** Identify profitable and loss-making products
- **Customer Insights:** Analyze order patterns and segment behavior
- **Shipping Analytics:** Monitor delivery performance and costs
- **Trend Analysis:** Monthly and quarterly sales trends with moving averages

## SQL Analytics

The project includes comprehensive SQL queries for various analyses:

### Sales Performance
- Total sales per sub-category with category grouping
- Monthly sales trends per market
- Products with above-average sales
- Percentage of total sales by category

### Profitability Analysis
- Top 10 countries by sales and profit with ranking
- Total profit by region and market
- Products with negative profit (loss identification)
- Profit ratio per region
- Top 3 sub-categories per category by sales

### Customer Analytics
- Number of orders per customer
- Average discount given per segment and category

### Advanced Analytics
- 12-month moving average calculation for sales trends
- Window functions for ranking and aggregation
- Date range analysis (min/max order dates)

All queries utilize advanced SQL techniques including:
- Window Functions (RANK, AVG OVER)
- Common Table Expressions (CTEs)
- Subqueries and Aggregations
- Date formatting and manipulation

## Tech Stack

- **Database:** MySQL 8.0+
- **Visualization:** Tableau Public
- **Analytics:** SQL (Window Functions, CTEs, Aggregations)

## Project Structure

```
├── README.md
├── SQL_Queries.sql
├── Global_SuperStore_DashBoard/
│   ├── overview.png
│   ├── top-sellers.png
│   ├── bottom-sellers.png
│   ├── insights.png
│   └── details.png
└── Global_Superstore.xslx   
```

## License

MIT License

