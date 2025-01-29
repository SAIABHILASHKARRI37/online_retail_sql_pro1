# 🛒 Online Retail SQL Project

## 📌 Overview
This project involves analyzing retail sales data using SQL. The dataset was imported into MySQL Workbench, and various data cleaning, exploration, and analytical queries were performed to gain insights into customer behavior, sales trends, and product performance.

## 🔍 Data Cleaning
- Checked if the imported data matched the original dataset.
- Identified and removed null values as they were not useful for analysis.

## 📊 Data Exploration
```sql
-- Number of unique customers
SELECT COUNT(DISTINCT customer_id) AS No_of_customers FROM salesrep;

-- Number of unique product categories
SELECT DISTINCT category FROM salesrep;
```

## 📈 Data Analysis Queries

### 1️⃣ Retrieve all sales made on `2022-11-05`
```sql
SELECT * FROM salesrep WHERE sale_date = '2022-11-05';
```

### 2️⃣ Transactions where category is 'Clothing' & quantity > 2 in November 2022
```sql
SELECT * FROM salesrep 
WHERE category = 'Clothing' 
AND quantity > 2 
AND YEAR(sale_date) = 2022 
AND MONTH(sale_date) = 11;
```

### 3️⃣ Total sales for each category
```sql
SELECT category, SUM(total_sale) AS total_sale, COUNT(*) AS no_of_orders
FROM salesrep
GROUP BY category;
```

### 4️⃣ Average age of customers who purchased from 'Beauty' category
```sql
SELECT ROUND(AVG(age)) FROM salesrep WHERE category = 'Beauty';
```

### 5️⃣ Transactions where total sale > 1000
```sql
SELECT * FROM salesrep WHERE total_sale > 1000;
```

### 6️⃣ Total transactions by gender in each category
```sql
SELECT category, gender, COUNT(transaction_id) AS no_of_transactions
FROM salesrep
GROUP BY category, gender
ORDER BY category;
```

### 7️⃣ Average sale per month & best-selling month in each year
```sql
SELECT YEAR(sale_date) AS year, 
       MONTH(sale_date) AS month, 
       AVG(total_sale) AS Avg_sales, 
       RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rank
FROM salesrep
GROUP BY YEAR(sale_date), MONTH(sale_date);
```

### 8️⃣ Top 5 customers based on highest total sales
```sql
SELECT customer_id, SUM(total_sale) AS total_sale 
FROM salesrep
GROUP BY customer_id 
ORDER BY total_sale DESC 
LIMIT 5;
```

### 9️⃣ Unique customers who purchased from each category
```sql
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers 
FROM salesrep 
GROUP BY category;
```

### 🔟 Number of orders by shift (Morning, Afternoon, Evening)
```sql
WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM salesrep
)
SELECT shift, COUNT(*) AS transactions FROM hourly_sale GROUP BY shift;
```

## 📌 Conclusion
- The dataset was successfully analyzed using MySQL.
- Identified key customer trends, sales insights, and product performance.
- Found best-selling months, high-value customers, and transaction trends based on time shifts.

## 🔗 Project & Dataset Links
- 📜 SQL Code: [Project SQL Script](https://github.com/SAIABHILASHKARRI37/online_retail_sql_pro1/blob/main/Project1_online_retail_store.sql)
- 📂 Dataset: [Retail Sales CSV](https://github.com/SAIABHILASHKARRI37/online_retail_sql_pro1/blob/main/SQL%20-%20Retail%20Sales%20Analysis_utf%20.csv)

📌 **Done by:** K Sai Abhilash 🚀
