-- schema.sql --

-- create the 'customers' table --
create table customers(
    customer_id int primary key auto_increment,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) unique not null,
    phone varchar(12) not null
);

-- Create the 'pizzas' table --
create table pizzas(
    pizza_id int primary key auto_increment,
    name varchar(255) not null,
    size varchar(20) not null,  -- Small, Medium, Large
    price decimal(10,2) not null
);

-- Create the 'orders' table --
create table orders(
    order_id int primary key auto_increment,
    customer_id int,
    order_date date not null,
    status varchar(20) not null,  -- Pending, In Progress, Completed
    total_amount decimal(10, 2) not null,
    foreign key (customer_id) references customers(customer_id)
);

-- Create the 'order_items' table --
create table order_items (
    order_item_id int primary key auto_increment,
    order_id int,
    pizza_id int,
    quantity int not null,
    price decimal(10,2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (pizza_id) references pizzas(pizza_id)
);

-- Add sample data --
-- data.sql --

-- Insert sample data in customers table --
insert into customers (first_name, last_name, email, phone)
values
('John', 'Doe', 'johndoe@example.com', '123-456-7890'),
('Jane', 'Smith', 'janesmith@example.com', '234-567-8901'),
('Alice', 'Johnson', 'alicej@example.com', '345-678-9012'),
('Bob', 'Williams', 'bobwilliams@example.com', '456-789-0123'),
('Charlie', 'Brown', 'charlieb@example.com', '567-890-1234'),
('David', 'Taylor', 'davidtaylor@example.com', '678-901-2345'),
('Emma', 'Harris', 'emmaharris@example.com', '789-012-3456'),
('Frank', 'Clark', 'frankclark@example.com', '890-123-4567'),
('Grace', 'Lewis', 'gracelewis@example.com', '901-234-5678'),
('Hannah', 'Walker', 'hannahwalker@example.com', '012-345-6789'),
('Isla', 'Allen', 'islaallen@example.com', '123-456-7891'),
('Jack', 'Young', 'jackyoung@example.com', '234-567-8902'),
('Kathy', 'King', 'kathyking@example.com', '345-678-9013'),
('Leo', 'Scott', 'leoscott@example.com', '456-789-0124'),
('Megan', 'Adams', 'meganadams@example.com', '567-890-1235'),
('Nathan', 'Baker', 'nathanbaker@example.com', '678-901-2346'),
('Olivia', 'Nelson', 'olivianelson@example.com', '789-012-3457'),
('Peter', 'Carter', 'petercarter@example.com', '890-123-4568'),
('Quincy', 'Morris', 'quincymorris@example.com', '901-234-5679');

-- Insert sample data in pizzas table --
(5 pizzas, 4 different sizes each, totaling 20)

insert into pizzas (name, size, price) 
values
('Margherita', 'Small', 7.99),
('Margherita', 'Medium', 9.99),
('Margherita', 'Large', 12.99),
('Margherita', 'X-Large', 14.99),
('Pepperoni', 'Small', 8.99),
('Pepperoni', 'Medium', 11.99),
('Pepperoni', 'Large', 14.99),
('Pepperoni', 'X-Large', 16.99),
('Veggie', 'Small', 7.49),
('Veggie', 'Medium', 9.49),
('Veggie', 'Large', 12.49),
('Veggie', 'X-Large', 14.49),
('BBQ Chicken', 'Small', 9.99),
('BBQ Chicken', 'Medium', 12.99),
('BBQ Chicken', 'Large', 15.99),
('BBQ Chicken', 'X-Large', 17.99),
('Hawaiian', 'Small', 8.49),
('Hawaiian', 'Medium', 10.49),
('Hawaiian', 'Large', 13.49),
('Hawaiian', 'X-Large', 15.49);

-- Insert sample data in orders table --
insert into orders (customer_id, order_date, status, total_amount)
VALUES
(1, '2024-11-01', 'Pending', 35.97),
(2, '2024-11-02', 'Completed', 45.97),
(3, '2024-11-03', 'In Progress', 27.47),
(4, '2024-11-04', 'Completed', 42.97),
(5, '2024-11-05', 'Pending', 52.97),
(6, '2024-11-06', 'In Progress', 36.47),
(7, '2024-11-07', 'Completed', 47.97),
(8, '2024-11-08', 'Pending', 39.97),
(9, '2024-11-09', 'Completed', 33.47),
(10, '2024-11-10', 'In Progress', 46.97),
(11, '2024-11-11', 'Completed', 37.97),
(12, '2024-11-12', 'Pending', 44.97),
(13, '2024-11-13', 'Completed', 49.97),
(14, '2024-11-14', 'In Progress', 41.97),
(15, '2024-11-15', 'Completed', 51.97),
(16, '2024-11-16', 'Pending', 48.97),
(17, '2024-11-17', 'Completed', 40.97),
(18, '2024-11-18', 'In Progress', 43.47),
(19, '2024-11-19', 'Completed', 38.97),
(20, '2024-11-20', 'Pending', 53.97);

-- Insert sample data in order_items
insert into order_items (order_id, pizza_id, quantity, price)
values
(1, 1, 3, 7.99),
(1, 5, 2, 8.99),
(2, 2, 2, 11.99),
(2, 6, 2, 9.99),
(3, 4, 2, 12.99),
(3, 9, 1, 7.49),
(4, 3, 2, 12.99),
(4, 7, 1, 9.99),
(5, 10, 1, 9.49),
(5, 8, 2, 12.99),
(6, 11, 3, 12.49),
(6, 14, 1, 12.99),
(7, 13, 2, 15.99),
(7, 16, 1, 13.49),
(8, 2, 1, 11.99),
(8, 5, 1, 8.99),
(9, 12, 1, 10.49),
(9, 17, 2, 15.49),
(10, 14, 2, 12.99),
(10, 19, 1, 13.49);

-- SQL Queries --
-- Basic Queries--

Query 1: Get all customers
Ans-- SELECT * FROM customers;

Query 2: Get all pizzas in the menu
Ans-- SELECT pizza_id, name, size, price FROM pizzas;

Query 3: Get all orders for customer 1
Ans-- SELECT * FROM orders WHERE customer_id = 1;

Query 4: Get all order items for order 1
Ans-- SELECT * FROM order_items WHERE order_id = 1;

Query 5: Get all orders and their total amounts
Ans-- SELECT order_id, total_amount FROM orders;

-- Intermediate Queries --

Query 1: Get the total spent by each customer
Ans-- SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS total_spent
     FROM orders
     JOIN customers ON orders.customer_id = customers.customer_id
     GROUP BY customers.customer_id;

Query 2: Get the details of order items for order 1
Ans-- SELECT order_items.order_item_id, pizzas.name, order_items.quantity, order_items.price
     FROM order_items
     JOIN pizzas ON order_items.pizza_id = pizzas.pizza_id
     WHERE order_items.order_id = 1;

Query 3: Get the total sales for each pizza
Ans-- SELECT pizzas.name, SUM(order_items.quantity) AS total_sales
     FROM order_items
     JOIN pizzas ON order_items.pizza_id = pizzas.pizza_id
     GROUP BY pizzas.name;

Query 4: Get the average order value by status
Ans-- SELECT status, AVG(total_amount) AS avg_order_value
     FROM orders
     GROUP BY status;

Query 5: Get orders placed on a specific date (e.g., '2024-11-01')
Ans-- SELECT * FROM orders WHERE order_date = '2024-11-01';


--Advanced Queries--

Ans-- Query 1: Get the most popular pizza (most ordered)
     SELECT pizzas.name, SUM(order_items.quantity) AS total_orders
     FROM order_items
     JOIN pizzas ON order_items.pizza_id = pizzas.pizza_id
     GROUP BY pizzas.name
     ORDER BY total_orders DESC
     LIMIT 1;

Query 2: Get the total revenue generated by each customer
Ans-- SELECT customers.first_name, customers.last_name, SUM(orders.total_amount) AS total_revenue
     FROM orders
     JOIN customers ON orders.customer_id = customers.customer_id
     GROUP BY customers.customer_id
     ORDER BY total_revenue DESC;

Query 3: Get the most frequent order status
Ans-- SELECT status, COUNT(*) AS frequency
     FROM orders
     GROUP BY status
     ORDER BY frequency DESC
     LIMIT 1;

Query 4: Get the total sales for each pizza size
Ans-- SELECT pizzas.size, SUM(order_items.quantity) AS total_sales
     FROM order_items
     JOIN pizzas ON order_items.pizza_id = pizzas.pizza_id
     GROUP BY pizzas.size;

Query 5: Get the total number of orders placed on each date
Ans-- SELECT order_date, COUNT(*) AS total_orders
     FROM orders
     GROUP BY order_date
     ORDER BY order_date;
