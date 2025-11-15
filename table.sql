CREATE TABLE Products (
product_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price DECIMAL(10,2) NOT NULL,
category VARCHAR(50)
);

CREATE TABLE Users (
user_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
user_id INT NOT NULL,
order_date DATE,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE OrderItems (
order_id INT NOT NULL,
product_id INT NOT NULL,
qty INT DEFAULT 1,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE INDEX idx_orders_user ON Orders(user_id);
CREATE INDEX idx_orderitems_product ON OrderItems(product_id);
