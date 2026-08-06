
SELECT 
    get_fiscal_quarter(s.date) AS Quarter,
    SUM(s.sold_quantity) AS total_sold_quantity
FROM gdb0041.fact_sales_monthly s
WHERE s.fiscal_year = 2020
GROUP BY get_fiscal_quarter(s.date)
ORDER BY total_sold_quantity DESC;