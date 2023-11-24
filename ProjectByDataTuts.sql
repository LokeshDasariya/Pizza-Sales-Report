create database Pizzasales;
use pizzasales;
select*from pizza_sales;
select count(pizza_id) from pizza_sales;
-- 1. Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales;
 
 -- 2. Average Order values
  
  SELECT SUM(TOTAL_PRICE)/COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales;
  
  -- 3. Total Pizza Sold
select sum(quantity) as total_pizza_sold from pizza_sales;

-- 4. Total orders
select count(distinct order_id) as Total_Orders from pizza_sales;
  
  -- 5. Average Pizza per order
  select*from pizza_sales;
  
  select cast((sum(quantity)/count(distinct order_id)) as decimal(10,2)) as Average_pizza_per_order 
  from pizza_sales;
  
  use pizzasales;
  
  set sql_safe_updates=0; -- for out of the safe mode
  
  update pizza_sales
  set order_date = str_to_date(order_date,"%d-%m-%Y"); -- for conversion in yyyy-mm-dd format
  alter table pizza_sales
  modify order_date date;  -- for changing datatype
 
 
 -- DAILY TRENDS
  select*from pizza_sales;
  select dayname(order_date) as order_day, count(distinct order_id) as Total_orders
  from pizza_sales
  group by dayname(order_date);
  
  -- MONTHLY TRENDS
  
  select monthname(order_date) as order_month, count(distinct order_id) as Total_orders
  from pizza_sales
  group by monthname(order_date);
  
  -- 4. Percentage of sales  by pizza category
  select pizza_category from pizza_sales;
  SELECT pizza_category , sum(total_price) as Total_sales, sum(total_price) * 100 / ( select sum(total_price)  from pizza_sales
  WHERE month(order_date) = 1 ) as PCT from pizza_sales
  WHERE month(order_date) = 1
  group by pizza_category;
  
  -- 5. Percentage of sales by Pizza size
  select*from pizza_sales;
  select pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) As Total_revenue, CAST(SUM(total_price)*100 / (select Sum(total_price) from pizza_sales) as DECIMAL(10,2)) AS PCT
  FROM pizza_sales
  group by pizza_size
  order by pizza_size;
  
  -- 6. Total pizza Sold by Pizza Category
  SELECT*FROM pizza_sales;
  SELECT Pizza_category, SUM(quantity) as Total_Quantity_Sold
  FROM pizza_sales
 -- WHERE MONTH(order_date) = 2
  GROUP BY pizza_category
  ORDER BY Total_Quantity_Sold desc;
  
  -- 7. Top 5 Pizza by Revenue
  SELECT pizza_name, SUM(total_price) AS Total_Revenue
  FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue DESC
  LIMIT 5;
  
  -- 8. Bottom 5 Pizza by Revenue
  SELECT pizza_name, SUM(total_price) AS Total_Revenue
  FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue ASC
  LIMIT 5;
  
  -- 9. Top 5 Pizza by Quantity
  SELECT pizza_name, SUM(quantity) AS Total_Revenue
  FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue DESC
  LIMIT 5;
  
  -- 10. Bottom 5 Pizza by Quantity
  SELECT pizza_name, SUM(quantity) AS Total_Revenue
  From pizza_sales
  group by pizza_name
  ORDER BY Total_revenue ASC;
  
  
  -- 11. Top 5 pizza by Total order
  SELECT pizza_name, COUNT(distinct order_id) as Total_Order
  from Pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Order desc
  LIMIT 5;
  
  -- 12. Bottom  5 pizza by Total Order
  SELECT pizza_name, count(Distinct order_id) as Total_order
  From Pizza_sales
  Group BY Pizza_name
  ORDER BY Total_order asc
  limit 5;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

