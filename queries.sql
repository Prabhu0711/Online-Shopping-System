SELECT SUM(p.price * oi.qty) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id;

SELECT p.name, SUM(oi.qty) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

SELECT u.name AS customer, o.order_id, o.order_date, p.name AS product, oi.qty, p.price
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
ORDER BY o.order_date DESC;

SELECT o.order_date, SUM(p.price * oi.qty) AS revenue
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;

SELECT p.*
FROM Products p
LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
