
(
    SELECT 
        p.product_code,
       p.product,
        m.manufacturing_cost
    FROM gdb0041.dim_product p join fact_manufacturing_cost m on m.product_code=p.product_code
      
    ORDER BY m.manufacturing_cost DESC
    LIMIT 1
)
UNION ALL
(
    SELECT 
          p.product_code,
       p.product,
        m.manufacturing_cost
    FROM gdb0041.dim_product p join fact_manufacturing_cost m on m.product_code=p.product_code
      
    ORDER BY m.manufacturing_cost ASC
    limit 1
);