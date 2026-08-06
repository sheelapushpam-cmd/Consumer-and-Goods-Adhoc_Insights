
with cte1 as(SELECT dp.division,dp.product,dp.product_code,sum(sm.sold_quantity) as total_sold_qty
FROM gdb0041.dim_product dp join fact_sales_monthly sm on dp.product_code=sm.product_code
where sm.fiscal_year="2021"
group by dp.product,dp.division,dp.product_code),
cte2 as(select *,dense_rank() over(partition by division order by total_sold_qty desc) as rank_order from cte1)
select * from cte2 where rank_order<=3;