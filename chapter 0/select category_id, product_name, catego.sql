select category_id, product_name, category_id, size, price FROM inventory.products WHERE price > 20 


--inner join
SELECT
    ol.order_id,
    ol.sku,
    ol.quantity,
    p.product_name
FROM sales.order_lines ol
JOIN inventory.products p
    ON ol.sku = p.sku;
--left join
SELECT 
    c.category_id,
     c.category_description, 
     p.product_name
FROM inventory.categories c LEFT JOIN inventory.products p ON c.category_id = p.category_id;

SELECT c.category_id, c.category_description, p.product_name
FROM inventory.categories c RIGHT JOIN inventory.products p ON c.category_id = p.category_id;

--like
SELECT * from inventory.products WHERE product_name ILIKE '%virgin%';

--groupby
SELECT customer_id, count(*) AS orderCount FROM sales.orders GROUP BY customer_id;

-- group by
SELECT customer_id, count(*) as OrderCount FROM sales.orders ORDER BY sales.price DESC;

SELECT
    state,
    COUNT(*),
    BOOL_AND(newsletter),
    BOOL_OR(newsletter)
FROM sales.customers
GROUP BY state;