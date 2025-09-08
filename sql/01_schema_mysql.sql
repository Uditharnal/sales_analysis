CREATE DATABASE IF NOT EXISTS sales_demo;
USE sales_demo;
DROP TABLE IF EXISTS orders_staging;
CREATE TABLE orders_staging (
  col1  TEXT,  col2  TEXT,  col3  TEXT,  col4  TEXT,  col5  TEXT,
  col6  TEXT,  col7  TEXT,  col8  TEXT,  col9  TEXT,  col10 TEXT,
  col11 TEXT,  col12 TEXT,  col13 TEXT,  col14 TEXT,  col15 TEXT,
  col16 TEXT,  col17 TEXT,  col18 TEXT
);
DROP TABLE IF EXISTS orders_clean;
CREATE TABLE orders_clean (
  ROW_ID        VARCHAR(50),
  Order_ID     VARCHAR(50),
  Order_Date      DATE,
  Ship_Date       DATE,
  Ship_Mode      VARCHAR(150),
  Customer_ID    VARCHAR(50),
  Customer_Name  VARCHAR(50),
  Segment        VARCHAR(100),
  Country         VARCHAR(100),
  City            VARCHAR(20),
  State          VARCHAR(50),
  Postal_Code      VARCHAR(50),
  Region         VARCHAR(255),
  Product_ID        VARCHAR(100),
  Category      VARCHAR(100),
  Sub_Category    VARCHAR(100),
  Product_Name     VARCHAR(100),
  Sales           DECIMAL(12,2),
 
  PRIMARY KEY (Row_ID, Order_ID)
);
