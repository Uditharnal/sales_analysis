CREATE DATABASE IF NOT EXISTS sales_demo;
USE sales_demo;
DROP TABLE IF EXISTS orders_staging;
CREATE TABLE orders_staging (
  col1  TEXT,  col2  TEXT,  col3  TEXT,  col4  TEXT,  col5  TEXT,
  col6  TEXT,  col7  TEXT,  col8  TEXT,  col9  TEXT,  col10 TEXT,
  col11 TEXT,  col12 TEXT,  col13 TEXT,  col14 TEXT,  col15 TEXT,
  col16 TEXT,  col17 TEXT,  col18 TEXT,  col19 TEXT,  col20 TEXT
);
DROP TABLE IF EXISTS orders_clean;
CREATE TABLE orders_clean (
  order_id        VARCHAR(50),
  order_date      DATE,
  ship_date       DATE,
  customer_id     VARCHAR(50),
  customer_name   VARCHAR(150),
  segment         VARCHAR(50),
  country         VARCHAR(50),
  city            VARCHAR(100),
  state           VARCHAR(100),
  postal_code     VARCHAR(20),
  region          VARCHAR(50),
  product_id      VARCHAR(50),
  product_name    VARCHAR(255),
  category        VARCHAR(100),
  sub_category    VARCHAR(100),
  quantity        INT,
  unit_price      DECIMAL(10,2),
  sales           DECIMAL(12,2),
  discount        DECIMAL(6,4),
  profit          DECIMAL(12,2),
  PRIMARY KEY (order_id, product_id)  -- adjust if needed
);
