
SELECT 
    customer,
    market,
    region
FROM gdb0041.dim_customer
WHERE customer LIKE '%Atliq Exclusive%'
  AND region LIKE '%APAC%';