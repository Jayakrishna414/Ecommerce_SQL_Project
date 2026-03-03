CREATE DATABASE ecommerce_practice;
USE ecommerce_practice;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (name, email, city) VALUES
('Ravi Kumar', 'ravi@gmail.com', 'Hyderabad'),
('Priya Sharma', 'priya@gmail.com', 'Delhi'),
('Amit Singh', 'amit@gmail.com', 'Mumbai'),
('Sneha Reddy', 'sneha@gmail.com', 'Chennai');


INSERT INTO products (product_name, price, stock) VALUES
('Laptop', 55000, 10),
('Mobile', 20000, 25),
('Headphones', 1500, 50),
('Keyboard', 800, 40);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-01-10'),
(2, '2025-01-11'),
(1, '2025-01-15'),
(3, '2025-01-20');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 1, 1);

select * from customers;
 
select * from products 
where price > 1000

select * from customers 
where city='hyderabad'

select * from products 
where stock <20

select product_name,price
from products

select * from orders
where order_date>'2025-01-12'

select * from products
order by price desc

select count(*) as total_customers
from customers

select  avg(price) as average_price
from products

select sum(stock) as available_stocks
from products

select * from customers c
join order_items o on o.order_id=c.customer_id

select * from order_items o
inner join products p on p.product_id=o.product_id

SELECT c.name,o.order_id,p.product_name,oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

select sum(quantity) as total_quantity,p.product_name
from products p
join order_items o on o.product_id=p.product_id
group by p.product_name

select sum(order_id) as no_of_orders , c.name
from customers c
join orders o on o.customer_id=c.customer_id
group by c.name

SELECT * FROM customers
WHERE name IN ('Ravi kumar','amit singh');













































select * from products









