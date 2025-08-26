Use sales_demo;

#Creating a key for Month Start  
DROP VIEW IF EXISTS v_orders_base;
CREATE VIEW v_orders_base AS
SELECT
Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Customer_Name,Segment,Country,City,
State,Postal_Code,Region,Product_ID,Category,Sub_Category,Product_Name,Sales,
DATE_FORMAT (Order_Date, '%Y-%m-01') AS month_start
FROM orders_clean;

#KPI(Key Performance Indicator)

#Total sales, Total orders, Total customers and Avg order
DROP VIEW IF EXISTS v_kpi_totals;
CREATE VIEW v_kpi_totals AS
SELECT
  ROUND(SUM(Sales),2)         AS total_sales,
  COUNT(DISTINCT Order_ID)    AS total_orders,
  COUNT(DISTINCT Customer_ID) AS total_customers,
  ROUND(SUM(Sales) / NULLIF(COUNT(DISTINCT Order_ID),0),2) AS avg_order_value
FROM v_orders_base;

#Sales By Months
DROP VIEW IF EXISTS v_sales_by_month;
CREATE VIEW v_sales_by_month AS
SELECT month_start, ROUND(SUM(Sales),2) AS monthly_sales
FROM v_orders_base
WHERE order_date IS NOT NULL
GROUP BY month_start
ORDER BY month_start;

#Sales by Region
DROP VIEW IF EXISTS v_sales_by_region;
CREATE VIEW v_sales_by_region AS
SELECT Region, ROUND(SUM(Sales),2) AS r_sales
FROM v_orders_base
GROUP BY Region
ORDER BY r_sales DESC;

#Top 10 Products
DROP VIEW IF EXISTS v_top_products;
CREATE VIEW v_top_products AS
SELECT Product_Name, ROUND(SUM(Sales),2) AS p_sales
FROM v_orders_base
GROUP BY Product_Name
ORDER BY p_sales DESC
LIMIT 10;

#Top 10 Customers
DROP VIEW IF EXISTS v_top_customers;
CREATE VIEW v_top_customers AS
SELECT Customer_Name, ROUND(SUM(Sales),2) AS c_sales
FROM v_orders_base
GROUP BY Customer_Name
ORDER BY c_sales DESC
LIMIT 10;