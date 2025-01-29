SELECT * FROM salesrep;
SELECT count(*) FROM salesrep
WHERE 
	`ï»¿transactions_id` is null or
    sale_date  is null or
    sale_time is null or
    customer_id is null or
    gender is null or
    age is null or
    quantiy is null or
    price_per_unit is null or
    cogs is null or
    total_sale is null ;
    
/*
how many sales done*/

select count(*) as sales_done from salesrep;

/*
how many custmors we have */

select   count(distinct customer_id) as No_of_custmors from salesrep;

/*
how many category we have*/

select distinct category from salesrep;

#1)

select * from salesrep
where sale_date='2022-11-05';

#2)

SELECT * 
FROM salesrep
WHERE 
    category = 'Clothing' AND 
    quantiy > 2 AND 
    YEAR(sale_date) = 2022 AND MONTH(sale_date) = 11;

#3)

select  category,sum(total_sale) as total_sale,
count(*) as no_of_orders
 from salesrep
group by 1
;

#4)
SELECT round(AVG(AGE)) FROM salesrep
WHERE category='Beauty';

#5)
ALTER TABLE salesrep RENAME COLUMN ï»¿transactions_id TO `transactions_id`;


SELECT * FROM salesrep
WHERE  total_sale>1000;

#6)
select distinct category,gender,count(transactions_id) as no_of_transactions
from salesrep group by 1,2 order by 1;

#7)

SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS Avg_sales,
    RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) as ran
FROM salesrep
GROUP BY YEAR(sale_date), MONTH(sale_date);
#ORDER BY YEAR(sale_date), Avg_sales DESC;

#8)
 SELECT customer_id,sum(total_sale) as total_sale from salesrep
 group by 1 order by total_sale desc limit 5;
 
 #9)
 
 select  category,count(distinct customer_id)
 from salesrep group by 1 ;

#10)
with hourly_sale
as(
select *,
	case
		when extract(hour from sale_time)<12 then 'mornig'
        when extract(hour from sale_time)between 12 and 17 then 'Afternoon'
        else 'evening'
	end as shift
from salesrep)
select shift,count(*) as transactions from hourly_sale group by 1;


select salesrep.shift,count(quantiy) from salesrep
group by 1;
        









