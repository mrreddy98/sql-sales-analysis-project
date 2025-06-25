-- Table: sales_targets
CREATE TABLE sales_targets (
    id SERIAL PRIMARY KEY,
    month_of_order_date VARCHAR(10),
    category VARCHAR(50),
    target DECIMAL
);

-- Table: orders
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100)
);

-- Table: order_details
CREATE TABLE order_details (
    id SERIAL PRIMARY KEY,
    order_id VARCHAR(20),
    amount DECIMAL,
    profit DECIMAL,
    quantity INT,
    category VARCHAR(50),
    sub_category VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
