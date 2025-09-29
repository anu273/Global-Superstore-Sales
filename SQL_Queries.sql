select *
from global_superstore;

-- Total Sales per Sub-Category with Category
SELECT  `Sub-Category`, Category, SUM(Sales) AS TotalSales
FROM global_superstore
GROUP BY `Sub-Category`, Category
ORDER BY TotalSales DESC;

-- Top 10 countries in Sales and Profit
SELECT 
    Country,
    TotalSales,
    TotalProfit,
    RANK() OVER (ORDER BY TotalProfit DESC) AS ProfitRank
FROM (
    SELECT 
        Country,
        SUM(Sales) AS TotalSales,
        SUM(Profit) AS TotalProfit
    FROM global_superstore
    GROUP BY Country
    ORDER BY TotalSales DESC
    LIMIT 10
) AS top_sales
ORDER BY TotalSales DESC;

--  Number of Orders per Customer
SELECT  `Customer Name`, COUNT(`Order ID`) AS Totalorder
FROM global_superstore
GROUP BY `Customer Name`
ORDER BY Totalorder DESC;


-- Total Profit by Region and Market
SELECT Market, Region, SUM(Profit) AS TotalProfit
FROM global_superstore
GROUP BY Market, Region
ORDER BY TotalProfit DESC;


-- Monthly Sales Trend per Market
SELECT Market, DATE_FORMAT(`Order Date`, '%Y-%m') AS YearMonth, SUM(Sales) AS MonthlySales
FROM Global_Superstore
GROUP BY Market, YearMonth
ORDER BY Market, YearMonth;

-- Products with Negative Profit (Losses)
SELECT `Product Name`, `Sub-Category`, Category, Profit
FROM global_superstore
WHERE Profit<0;

-- Average Discount Given per Segment and Category
SELECT Segment, Category, AVG(Discount) AS AvgDiscount
FROM Global_Superstore
GROUP BY Segment, Category
ORDER BY Segment, Category;


-- Products with Above-Average Sales
SELECT `Product Name`, `Customer Name`, Sales, Profit
FROM Global_Superstore
WHERE Sales > (SELECT AVG(Sales) FROM Global_Superstore)
ORDER BY Sales DESC;



UPDATE global_superstore
SET `Order Date` = STR_TO_DATE(`Order Date`, '%d-%m-%Y');

SELECT 
    SalesYear,
    SalesMonth,
    MonthlySales,
    AVG(MonthlySales) OVER (
        PARTITION BY SalesYear
        ORDER BY SalesMonth
        ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
    ) AS MonthlyMovingAverage
FROM (
    SELECT 
        YEAR(`Order Date`) AS SalesYear,
        MONTH(`Order Date`) AS SalesMonth,
        SUM(Sales) AS MonthlySales
    FROM Global_Superstore
    GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
) AS monthly_data
ORDER BY SalesYear, SalesMonth;


--  Percentage of Total Sales by Category
SELECT Category,
    SUM(Sales) as CategorySales,
    (SUM(Sales) * 100.0) / (SELECT SUM(Sales) FROM Global_Superstore) as PercentageOfTotalSales
FROM global_superstore
GROUP BY Category
ORDER BY PercentageOfTotalSales DESC;

-- Profit Ratio per Region
SELECT Region, SUM(Profit)/SUM(Sales) AS ProfitRatio
FROM Global_Superstore
GROUP BY Region
ORDER BY ProfitRatio DESC;

-- Top 3 Sub-Categories per Category by Sales
SELECT *
FROM (
    SELECT 
        Category,
        `Sub-Category`,
        SUM(Sales) AS TotalSales,
        RANK() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS SubCategoryRank
    FROM Global_Superstore
    GROUP BY Category, `Sub-Category`
) AS ranked_subcategories
WHERE SubCategoryRank <= 3
ORDER BY Category, SubCategoryRank;



SELECT MAX(`Order Date`), MIN(`Order Date`)
FROM global_superstore;