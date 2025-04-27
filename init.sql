-- Create tables
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    group_id INTEGER REFERENCES groups(id),
    active BOOLEAN DEFAULT FALSE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    details JSONB  -- Adding a JSONB field to store additional employee details
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    country VARCHAR(100),
    sale_amount DECIMAL
);

-- Insert sample data into sales table
INSERT INTO sales (product_name, country, sale_amount) VALUES
('Laptop', 'USA', 1200.00),
('Smartphone', 'USA', 800.00),
('Laptop', 'Canada', 1300.00),
('Smartphone', 'Canada', 850.00),
('Laptop', 'USA', 1400.00),
('Smartphone', 'Canada', 900.00);

-- Create index on members table
CREATE INDEX idx_members_group_id ON members(group_id);

-- Insert sample data into groups table
INSERT INTO groups (name) VALUES ('Group A'), ('Group B'), ('Group C'), ('Group D');

-- Insert sample data into members table
INSERT INTO members (name, group_id, active) VALUES
('Alice', 1, true),
('Bob', 1, true),
('Charlie', 2, true),
('David', 2, false),
('Eve', 3, false),
('Frank', 3, false),
('Grace', 4, true),
('Heidi', 4, true);

-- Insert sample data into departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Marketing');

-- Insert sample data into employees table, including JSONB details
INSERT INTO employees (employee_id, employee_name, department_id, details) VALUES
(1, 'Alice', 1, '{"age": 30,"phone": "123-456-7890", "address": {"city": "New York", "state": "NY"}}'),
(2, 'Bob', 2, '{"age": 35, "address": {"city": "San Francisco", "state": "CA"}}'),
(3, 'Charlie', 3, '{"age": 25, "address": {"city": "Chicago", "state": "IL"}}'),
(4, 'David', NULL, '{"age": 40, "phone": "987-654-3210", "address": {"city": "Los Angeles", "state": "CA"}}'),
(5, 'Pero', 1, '{"age": 28, "address": {"city": "Miami", "state": "FL"}}');
(6, 'Michael', 3, '{"age": 28, "address": {"city": "Miami", "state": "FL"}}');
