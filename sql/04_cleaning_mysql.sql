USE sales_demo;

DROP TEMPORARY TABLE IF EXISTS t_dedupe;
CREATE TEMPORARY TABLE t_dedupe AS
SELECT *
FROM (
  SELECT oc.*,
         ROW_NUMBER() OVER (PARTITION BY Order_ID, Product_ID ORDER BY order_date) AS rn
  FROM orders_clean as oc
) x
WHERE rn = 1;

DELETE FROM orders_clean;
INSERT INTO orders_clean
SELECT Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Customer_Name,Segment,Country,City,
State,Postal_Code,Region,Product_ID,Category,Sub_Category,Product_Name,Sales
FROM t_dedupe;

DELETE FROM orders_clean WHERE Order_ID IS NULL;
