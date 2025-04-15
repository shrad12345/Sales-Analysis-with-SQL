use shraddhadb;

#Get Month from Order Date:

SELECT EXTRACT(MONTH FROM date) AS month
FROM orders;

#Join Orders with Order Details:

SELECT *
FROM orders o
JOIN order_details od ON o.order_id = od.order_id;

#  Join with Pizza Prices:

SELECT *
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id;

#Calculate Revenue (quantity * price):

SELECT EXTRACT(MONTH FROM date) AS month,
       quantity * price AS revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id;

# Sum Revenue by Month:

SELECT EXTRACT(MONTH FROM date) AS month,
       SUM(quantity * price) AS total_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY month
ORDER BY month;


#Extract Month from Date:

SELECT EXTRACT(MONTH FROM date) AS month
FROM orders;

# Count Unique Order IDs:

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

# Group Orders by Month:

SELECT EXTRACT(MONTH FROM date) AS month,
       COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY month;

# Sort by Month:

SELECT EXTRACT(MONTH FROM date) AS month,
       COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;
#. Top 5 Pizzas by Quantity

SELECT pt.name,
       SUM(quantity) AS total_qty
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_qty DESC
LIMIT 5;


#Top 5 Pizzas by Revenue
SELECT pt.name,
       SUM(quantity * price) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 5;

#  Revenue by Pizza Category
SELECT pt.category,
       SUM(quantity * price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;


