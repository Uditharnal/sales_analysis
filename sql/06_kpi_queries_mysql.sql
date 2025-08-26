USE sales_demo;

# Totals
SELECT * FROM v_kpi_totals;

# Trend
SELECT * FROM v_sales_by_month;

# Region / Product / Customer
SELECT * FROM v_sales_by_region;
SELECT * FROM v_top_products;
SELECT * FROM v_top_customers;	

# Calculation to check if revenue increased from Past years.
WITH yr AS (
  SELECT YEAR(Order_Date) AS y, SUM(Sales) AS rev
  FROM orders_clean
  WHERE Order_Date IS NOT NULL
  GROUP BY YEAR(Order_Date)
)
SELECT
  y AS year,
  rev AS revenue,
  LAG(rev) OVER (ORDER BY y) AS prev_rev,
  ROUND((rev - LAG(rev) OVER (ORDER BY y)) / NULLIF(LAG(rev) OVER (ORDER BY y),0) * 100, 2) AS yoy_pct
FROM yr
ORDER BY y;