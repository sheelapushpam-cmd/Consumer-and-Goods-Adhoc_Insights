    
SELECT 
    p.segment,
    COUNT(DISTINCT p.product_code) AS product_count
FROM gdb0041.dim_product p
JOIN gdb0041.fact_sales_monthly s
    ON p.product_code = s.product_code
GROUP BY p.segment
ORDER BY product_count DESC;

WITH seg2020 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT p.product_code) AS unique_products_2020
    FROM gdb0041.dim_product p
    JOIN gdb0041.fact_sales_monthly s
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2020
    GROUP BY p.segment
),
seg2021 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT p.product_code) AS unique_products_2021
    FROM gdb0041.dim_product p
    JOIN gdb0041.fact_sales_monthly s
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2021
    GROUP BY p.segment
)

SELECT
    s20.segment,
    s20.unique_products_2020,
    s21.unique_products_2021,
    (s21.unique_products_2021 - s20.unique_products_2020) AS product_difference
FROM seg2020 s20
JOIN seg2021 s21
    ON s20.segment = s21.segment
ORDER BY product_difference DESC;