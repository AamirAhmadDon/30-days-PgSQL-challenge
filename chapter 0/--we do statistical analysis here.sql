--we do statistical analysis here

--1. calculate the mean of the dataset
select category_id, avg(price) as average_price from inventory.products
group by category_id;

--2. quartile range
SELECT 
    percentile_cont(0.25) within group(order by price) as q1,
    percentile_cont(0.5) within group(order by price) as q2,
    percentile_cont(0.75) within group(order by price) as q3,
FROM inventory.products;

--3. mode or the most frequently occouring value
select category_id, price,
    count(*) as frequency
    from inventory.products
    group by category_id, price
    order by frequency desc
    limit 1;

-- amplitude 
select
    max(price) as max_price,
    min(price) as min_price,
    (max(price) - min(price)) as amplitude
from inventory.products;

--- now we ranking data with windows and hypothethical sets

select 
    product_name, 
    price,
    row_number() 
    OVER (order by price desc) as row_number 
from inventory.products

--ranking
select
    product_name, 
    price,
    rank() 
    OVER (order by price desc) as rank
from inventory.products
--dense ranking
select
    product_name, 
    price,
    dense_rank() 
    OVER (order by price desc) as dense_rank
from inventory.products
--percentile ranking
select
    product_name, 
    price,
    percent_rank() 
    OVER (order by price desc) as percent_rank  
from inventory.products
--cumelitavie distribution
select
    product_name, 
    price,
    cume_dist() 
    OVER (order by price desc) as cume_dist
from inventory.products