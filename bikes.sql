CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE models (
    id VARCHAR(5) PRIMARY KEY,
    bike_name VARCHAR(25) UNIQUE NOT NULL,
    cost NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    date_placed DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL REFERENCES customers
);

CREATE TABLE models_orders (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders,
    model_id VARCHAR(5) NOT NULL REFERENCES models,
    special_price NUMERIC(10, 2),
    note TEXT
);