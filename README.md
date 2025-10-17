## Analysis for an E-commerce Business

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up an e-commerce business database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

### 1. Data Exploration & Cleaning

 **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

 ```sql
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
```

### 1. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

### 1.How was the sales trend over the months?
```sql
    SELECT 
        DISTINCT DATEPART(Month, date) as Months,
        SUM(quantity) as Total_sales
    FROM sales_transact
    GROUP BY DATEPART(Month, date)
    order by months;
```
### 2.How was the sales trend over the years?
```sql
    SELECT 
        DISTINCT DATEPART(year, date) as Years,
        SUM(quantity) as Total_sales
    FROM sales_transact
    GROUP BY DATEPART(year, date)
    order by Years;
```

### 3.What are the most frequently purchaed product?
    Top 10 most purchased product
```sql
    SELECT Top 10 
        ProductName,
        sum(quantity) as Total_Sales
    FROM sales_transact
    Group By ProductName
    Order By Total_Sales desc;
```

### 4.How many percent does the customer purchase in each transaction?
 ### UNABLE TO SOLVE IT YET
```sql
    select 
        customerno,
        --Count(TransactionNo) as transact_per_customer,
        (Sum(quantity) / (select sum(quantity) from sales_transact) * 100) as value_purchased_per_customer
    from sales_transact
    Group by CustomerNo;
```

### 5. What is the most profitable segment customers?
    Top 10 most profitable
```sql
    select Top 10
        CustomerNo,
        Round(SUM(Price * Quantity), 0) as COGS
    from sales_transact
    Group by CustomerNo
    Order by COGS desc;
```

### 6.Write a SQL query to find the top 5 Countries based on the highest total sales
```sql
    select Top 5
        country,
        SUM(Quantity) as total_sales
    from sales_transact
    Group by country
    order by total_sales desc;
```

### 7.Write a SQL query to find the least 5 COuntries based on the highest total sales 
```sql
    select Top 5
        country,
        sum(Quantity) as total_sales
    from sales_transact
    Group by country
    order by total_sales asc;
```

## Reports
- **Sales Summary**: A detailed report summarizing total sales and customer demographics.
- **Trend Analysis**: Insights into sales trends across different months and years.
- **Customer Insights**: Reports on most profit customer segment.
