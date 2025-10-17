-- Check all dataset
SELECT 
	*
FROM sales_transact;

-- Check for any null values in the dataset and delete records with missing data.
SELECT 
	*
FROM sales_transact
WHERE TransactionNo IS NULL 
	OR 
	ProductNo IS NULL
	OR 
	Price IS NULL
	OR
	Quantity IS NULL
	OR
	CustomerNo IS NULL
	OR
	Country	IS NULL;

DELETE	FROM sales_transact
WHERE TransactionNo IS NULL 
	OR 
	ProductNo IS NULL
	OR 
	Price IS NULL
	OR
	Quantity IS NULL
	OR
	CustomerNo IS NULL
	OR
	Country	IS NULL;

-- Data Analysis & Findings

-- How was the sales trend over the months?
SELECT 
	DISTINCT DATEPART(Month, date) as Months,
	SUM(quantity) as Total_sales
FROM sales_transact
GROUP BY DATEPART(Month, date)
order by months;

-- How was the sales trend over the years?
SELECT 
	DISTINCT DATEPART(year, date) as Years,
	SUM(quantity) as Total_sales
FROM sales_transact
GROUP BY DATEPART(year, date)
order by Years;

-- WHat are the most frequently purchaed product?

-- Top 10 most purchased product
SELECT Top 10 
	ProductName,
	sum(quantity) as Total_Sales
FROM sales_transact
Group By ProductName
Order By Total_Sales desc;

-- How many percent does the customer purchase in each transaction?
-- NOT SOLVED YET
select 
	customerno,
	--Count(TransactionNo) as transact_per_customer,
	(Sum(quantity) / (select sum(quantity) from sales_transact) * 100) as value_purchased_per_customer
from sales_transact
Group by CustomerNo;


-- What is the most profitable segment customers?
--Top 10 most profitable
select Top 10
	CustomerNo,
	Round(SUM(Price * Quantity), 0) as COGS
from sales_transact
Group by CustomerNo
Order by COGS desc;

--Write a SQL query to find the top 5 COuntries based on the highest total sales
select Top 5
	country,
	SUM(Quantity) as total_sales
from sales_transact
Group by country
order by total_sales desc;

--Write a SQL query to find the least 5 COuntries based on the highest total sales 
select Top 5
	country,
	sum(Quantity) as total_sales
from sales_transact
Group by country
order by total_sales asc;