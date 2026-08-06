

with cte as(SELECT c.customer,round(sum(pd.pre_invoice_discount_pct),2) as average_discount_pct
FROM gdb0041.fact_pre_invoice_deductions pd
join dim_customer c on c.customer_code=pd.customer_code 
 where fiscal_year="2021" and market="india"
 group by c.customer)
 select c.customer,pd.average_discount_pct from cte
order by pd.average_discount_pct desc limit 5;


WITH cte AS (
    SELECT 
        pd.customer_code,
        c.customer,
        ROUND(AVG(pd.pre_invoice_discount_pct), 2) AS average_discount_percentage
    FROM gdb0041.fact_pre_invoice_deductions pd
    JOIN dim_customer c 
        ON c.customer_code = pd.customer_code
    WHERE pd.fiscal_year = 2021
      AND c.market = 'india'
    GROUP BY pd.customer_code, c.customer
)

SELECT 
    customer_code,
    customer,
    average_discount_percentage
FROM cte
ORDER BY average_discount_percentage DESC
LIMIT 5;