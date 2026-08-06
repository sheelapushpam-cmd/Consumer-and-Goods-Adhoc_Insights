create temporary table percentage_change( distinct product as Unique_Products_2020 FROM gdb0041.dim_product p 
join fact_sales_monthly s on s.product_code=p.product_code
where fiscal_year="2020";
SELECT distinct product as Unique_Products_2021 FROM gdb0041.dim_product p 
join fact_sales_monthly s on s.product_code=p.product_code
where fiscal_year="2021";

WITH p2020 AS (
    SELECT 
        COUNT(DISTINCT p.product_code) AS unique_products_2020
    FROM gdb0041.dim_product p
    JOIN gdb0041.fact_sales_monthly s 
        ON s.product_code = p.product_code
    WHERE s.fiscal_year = 2020
),
p2021 AS (
    SELECT 
        COUNT(DISTINCT p.product_code) AS unique_products_2021
    FROM gdb0041.dim_product p
    JOIN gdb0041.fact_sales_monthly s 
        ON s.product_code = p.product_code
    WHERE s.fiscal_year = 2021
)

SELECT
    p2020.unique_products_2020,
    p2021.unique_products_2021,
    ROUND(
        ((p2021.unique_products_2021 - p2020.unique_products_2020)
         / p2020.unique_products_2020) * 100, 2
    ) AS percentage_chg
FROM p2020
CROSS JOIN p2021;