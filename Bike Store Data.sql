CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50)
);

select * from brands;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

select * from categories

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    street VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code INT
);

select * from customers;

CREATE TABLE stores (
	store_id INT PRIMARY KEY,
	store_name VARCHAR(50),
	phone VARCHAR(20),
	email VARCHAR(50),
	street VARCHAR(100),
	city VARCHAR(50),
	state CHAR(10),
	zip_code INT
);

select * from stores;

CREATE TABLE stocks (
	store_id INT REFERENCES stores(store_id),
	product_id INT REFERENCES products(product_id),
	quantity INT
);

select * from stocks;

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(100),
	brand_id INT REFERENCES brands(brand_id),
	category_id INT REFERENCES categories(category_id),
	model_year INT,
	list_price FLOAT
);

select * from products;

CREATE TABLE staffs(
	staff_id INT PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(50),
	email VARCHAR(100),
	phone VARCHAR(25),
	active INT,
	store_id INT REFERENCES stores(store_id),
	manager_id INT
);

select * from staffs;

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	customer_id INT REFERENCES customers(customer_id),
	order_status VARCHAR(20),
	order_date DATE,
	required_date DATE,
	shipped_date DATE,
	store_id INT REFERENCES stores(store_id),
	staff_id INT REFERENCES staffs(staff_id)
);

select * from orders;

CREATE TABLE order_items(
	order_id INT REFERENCES orders(order_id),
	item_id INT,
	product_id INT REFERENCES products(product_id),
	quantity INT,
	list_price FLOAT,
	discount FLOAT
);

select * from order_items;