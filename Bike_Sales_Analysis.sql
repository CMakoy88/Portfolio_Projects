CREATE DATABASE IF NOT EXISTS BikeSalesDB;
USE BikeSalesDB;


SELECT * FROM bikesalesdb.clean_bike_sales LIMIT 10;
SELECT COUNT(*) FROM bikesalesdb.clean_bike_sales;

ALTER TABLE clean_bike_sales
MODIFY Unit_Cost DECIMAL(10, 2),
MODIFY Unit_Price DECIMAL(10, 2),
MODIFY Profit DECIMAL(10, 2),
MODIFY Cost DECIMAL(10, 2),
MODIFY Revenue DECIMAL(10, 2);


SELECT * FROM bikesalesdb.clean_bike_sales LIMIT 10;

-- Summary Statistics
SELECT
    MIN(Revenue) AS Min_Revenue,
    MAX(Revenue) AS Max_Revenue,
    AVG(Revenue) AS Avg_Revenue,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM clean_bike_sales;

create view SummaryStats as
SELECT
    MIN(Revenue) AS Min_Revenue,
    MAX(Revenue) AS Max_Revenue,
    AVG(Revenue) AS Avg_Revenue,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM clean_bike_sales;

-- Sales Trends by Month
SELECT
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Revenue) AS Monthly_Revenue,
    COUNT(*) AS Transaction_Count
FROM clean_bike_sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

Create view SalesTrend as
SELECT
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Revenue) AS Monthly_Revenue,
    COUNT(*) AS Transaction_Count
FROM clean_bike_sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

-- Sales by Customer Demographics
SELECT
    Age_Group,
    Customer_Gender,
    COUNT(*) AS Transactions,
    SUM(Revenue) AS Total_Revenue
FROM bikesalesdb.clean_bike_sales
GROUP BY Age_Group, Customer_Gender
ORDER BY Total_Revenue DESC;

Create view SalesbyCustomerDemo as
SELECT
    Age_Group,
    Customer_Gender,
    COUNT(*) AS Transactions,
    SUM(Revenue) AS Total_Revenue
FROM bikesalesdb.clean_bike_sales
GROUP BY Age_Group, Customer_Gender
ORDER BY Total_Revenue DESC;

-- Best-Selling Products
SELECT
    Product,
    SUM(Order_Quantity) AS Total_Quantity_Sold,
    SUM(Revenue) AS Total_Revenue
FROM bikesalesdb.clean_bike_sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

Create view BestSellingProducts as
SELECT
    Product,
    SUM(Order_Quantity) AS Total_Quantity_Sold,
    SUM(Revenue) AS Total_Revenue
FROM bikesalesdb.clean_bike_sales
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Profitability by Product Category
SELECT
    Product_Category,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Avg_Profit
FROM bikesalesdb.clean_bike_sales
GROUP BY Product_Category
ORDER BY Total_Profit DESC;

Create view ProfitbyProductCategory as
SELECT
    Product_Category,
    SUM(Profit) AS Total_Profit,
    AVG(Profit) AS Avg_Profit
FROM bikesalesdb.clean_bike_sales
GROUP BY Product_Category
ORDER BY Total_Profit DESC;