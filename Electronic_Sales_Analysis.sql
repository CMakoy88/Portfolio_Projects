-- What is the total sales amount for each product across all orders?
SELECT product, SUM(sales) AS total_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY product;

create view totalsalesbyproduct as 
SELECT product, SUM(sales) AS total_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY product;

SELECT *
FROM electronicsalesdata.totalsalesbyproduct
order by total_sales desc;

-- What is the average customer rating for each city?
SELECT city, AVG(customer_ratings) AS average_rating
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY city;

create view averagecustomerratingbycity as
SELECT city, AVG(customer_ratings) AS average_rating
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY city;
 
-- Which product had the highest sales in each month?
SELECT month, product, MAX(sales) AS max_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY month, product
ORDER BY month, max_sales DESC;

create view highestsellingproductspermonth as
SELECT month, product, MAX(sales) AS max_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY month, product
ORDER BY month, max_sales DESC;

-- What is the total sales amount per hour of the day?
SELECT hour, SUM(sales) AS total_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY hour
ORDER BY hour;

create view totalsalesperhrbyday as
SELECT hour, SUM(sales) AS total_sales
FROM electronicsalesdata.updated_electronic_sales_data_with_ratings
GROUP BY hour
ORDER BY hour;
