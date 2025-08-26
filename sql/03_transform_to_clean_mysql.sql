use sales_demo;

Delete from orders_clean;

insert into orders_clean(
Row_ID,Order_ID,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Customer_Name,Segment,Country,City,
State,Postal_Code,Region,Product_ID,Category,Sub_Category,Product_Name,Sales)
Select
Trim(col1) As Row_ID,
Trim(col2) As Order_ID,
   CASE
        WHEN TRIM(col3) REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' THEN
            CASE
                WHEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y') IS NOT NULL THEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y')
                WHEN STR_TO_DATE(TRIM(col3), '%m/%d/%Y') IS NOT NULL THEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y')
                ELSE NULL
            END
        ELSE NULL
    END AS Order_Date,
     CASE
        WHEN TRIM(col4) REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' THEN
            CASE
                WHEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y') IS NOT NULL THEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y')
                WHEN STR_TO_DATE(TRIM(col3), '%m/%m/%Y') IS NOT NULL THEN STR_TO_DATE(TRIM(col3), '%d/%m/%Y')
                ELSE NULL
            END
        ELSE NULL
    END AS Ship_Date,
Trim(col5) As Ship_Mode,
Trim(Col6) As Customer_ID,
Trim(Col7) As Customer_Name,
Trim(Col8) As Segment,
Trim(Col9) As Country,
Trim(Col10) As City,
Trim(Col11) As State,
NULLIF(Trim(Col12),'')	As Postal_Code,
Trim(Col13) As Region,
Trim(Col14) As Product_ID,
Trim(Col15) As Category,
Trim(Col16) As Sub_Category,
Trim(Col17) As Product_Name,
CAST(NULLIF(Trim(col18), '') AS DECIMAL(12,2)) AS sales
From orders_staging;
