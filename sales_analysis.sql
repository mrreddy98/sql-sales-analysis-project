
-- Total Sales per State
SELECT state, SUM(amount) AS total_sales
FROM orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY state
ORDER BY total_sales DESC;

-- Monthly Sales vs Target
SELECT s.month_of_order_date, s.category, s.target,
       SUM(d.amount) AS actual_sales,
       SUM(d.amount) - s.target AS difference
FROM sales_targets s
JOIN orders o ON TO_CHAR(o.order_date, 'Mon-YY') = s.month_of_order_date
JOIN order_details d ON o.order_id = d.order_id AND s.category = d.category
GROUP BY s.month_of_order_date, s.category, s.target;

-- Top 5 Products by Quantity
SELECT sub_category, SUM(quantity) AS total_quantity
FROM order_details
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;

-- Most Profitable Cities
SELECT o.city, SUM(d.profit) AS total_profit
FROM orders o
JOIN order_details d ON o.order_id = d.order_id
GROUP BY o.city
ORDER BY total_profit DESC
LIMIT 5;

-- High Loss Orders (negative profits)
SELECT o.order_id, o.city, d.profit
FROM orders o
JOIN order_details d ON o.order_id = d.order_id
WHERE d.profit < 0
ORDER BY d.profit ASC
LIMIT 10;
