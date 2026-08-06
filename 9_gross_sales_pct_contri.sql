WITH channel_sales AS (
    SELECT 
        c.channel,
        ROUND(SUM(g.gross_price * s.sold_quantity) / 1000000, 2) AS gross_sales_mln
    FROM gdb0041.fact_sales_monthly s
    JOIN dim_customer c 
        ON c.customer_code = s.customer_code
    JOIN fact_gross_price g 
        ON g.product_code = s.product_code
       AND g.fiscal_year = get_fiscal_year(s.date)
    WHERE s.fiscal_year = 2021
    GROUP BY c.channel
)

SELECT 
    channel,
    gross_sales_mln,
    ROUND(gross_sales_mln * 100 / SUM(gross_sales_mln) OVER (), 2) AS percentage
FROM channel_sales
ORDER BY gross_sales_mln DESC;