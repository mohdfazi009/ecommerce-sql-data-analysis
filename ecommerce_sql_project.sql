create database ecommerce_project;
use ecommerce_project;
create table customers(
customer_id int not null primary key,
customer_name varchar(100),
email varchar(100),
city varchar(50),
state varchar(50),
sign_up date);

describe customers;
create table products(
product_id int not null primary key,
product_name varchar(100),
category varchar(50),
price decimal(10,2),
stock int);
describe products;

create table orders(
order_id int not null primary key,
customer_id int,
order_date DATE,
order_status varchar(30),
foreign key (customer_id) REFERENCES customers(customer_id));
describe orders;

CREATE TABLE order_items (
    order_item_id INT NOT NULL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id));
describe order_items;
INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 25),
(2, 'Smartphone', 'Electronics', 30000.00, 40),
(3, 'Headphones', 'Electronics', 2500.00, 100),
(4, 'Keyboard', 'Electronics', 1500.00, 80),
(5, 'Mouse', 'Electronics', 800.00, 120),
(6, 'T-Shirt', 'Clothing', 700.00, 150),
(7, 'Jeans', 'Clothing', 1800.00, 70),
(8, 'Shoes', 'Footwear', 2500.00, 60),
(9, 'Backpack', 'Accessories', 1200.00, 90),
(10, 'Watch', 'Accessories', 3500.00, 45);
select* from products;
INSERT INTO customers
(customer_id, customer_name, email, city, state, sign_up)
VALUES
(101, 'Arun Kumar', 'arun@gmail.com', 'Chennai', 'Tamil Nadu', '2026-01-05'),
(102, 'Rahul Sharma', 'rahul@gmail.com', 'Bangalore', 'Karnataka', '2026-01-08'),
(103, 'Priya S', 'priya@gmail.com', 'Chennai', 'Tamil Nadu', '2026-01-12'),
(104, 'Vijay Kumar', 'vijay@gmail.com', 'Hyderabad', 'Telangana', '2026-01-15'),
(105, 'Anjali R', 'anjali@gmail.com', 'Mumbai', 'Maharashtra', '2026-01-18'),
(106, 'Karthik M', 'karthik@gmail.com', 'Coimbatore', 'Tamil Nadu', '2026-01-20'),
(107, 'Sneha P', 'sneha@gmail.com', 'Pune', 'Maharashtra', '2026-01-22'),
(108, 'Rohit Singh', 'rohit@gmail.com', 'Delhi', 'Delhi', '2026-01-25'),
(109, 'Divya K', 'divya@gmail.com', 'Chennai', 'Tamil Nadu', '2026-01-28'),
(110, 'Suresh B', 'suresh@gmail.com', 'Kochi', 'Kerala', '2026-02-01');
select *from customers;

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1021, 101, '2026-03-03', 'Delivered'),
(1022, 102, '2026-03-04', 'Shipped'),
(1023, 103, '2026-03-05', 'Delivered'),
(1024, 104, '2026-03-06', 'Pending'),
(1025, 105, '2026-03-07', 'Delivered'),
(1026, 106, '2026-03-08', 'Cancelled'),
(1027, 107, '2026-03-09', 'Delivered'),
(1028, 108, '2026-03-10', 'Shipped'),
(1029, 109, '2026-03-11', 'Delivered'),
(1030, 110, '2026-03-12', 'Delivered'),
(1031, 101, '2026-03-14', 'Shipped'),
(1032, 102, '2026-03-15', 'Delivered'),
(1033, 103, '2026-03-16', 'Delivered'),
(1034, 104, '2026-03-17', 'Cancelled'),
(1035, 105, '2026-03-18', 'Pending'),
(1036, 106, '2026-03-19', 'Delivered'),
(1037, 107, '2026-03-20', 'Shipped'),
(1038, 108, '2026-03-21', 'Delivered'),
(1039, 109, '2026-03-22', 'Delivered'),
(1040, 110, '2026-03-23', 'Shipped');
select *from orders;
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 1, 1, 55000),
(2, 1001, 3, 2, 2500),
(3, 1002, 2, 1, 30000),
(4, 1002, 5, 2, 800),
(5, 1003, 6, 3, 700),
(6, 1003, 7, 1, 1800),
(7, 1004, 4, 2, 1500),
(8, 1004, 8, 1, 2500),
(9, 1005, 9, 1, 1200),
(10, 1006, 10, 1, 3500),
(11, 1006, 3, 2, 2500),
(12, 1007, 5, 3, 800),
(13, 1008, 1, 1, 55000),
(14, 1008, 9, 2, 1200),
(15, 1009, 2, 1, 30000),
(16, 1010, 8, 2, 2500),
(17, 1011, 6, 2, 700),
(18, 1011, 7, 1, 1800),
(19, 1012, 4, 1, 1500),
(20, 1012, 5, 2, 800),
(21, 1013, 10, 1, 3500),
(22, 1014, 3, 3, 2500),
(23, 1015, 1, 1, 55000),
(24, 1016, 9, 1, 1200),
(25, 1017, 2, 1, 30000),
(26, 1018, 8, 1, 2500),
(27, 1019, 6, 4, 700),
(28, 1020, 7, 2, 1800);
select * from order_items;

-- overall business KPIs

-- total customers
select count(*) as total_customers from customers;

-- total products
select count(*) as total_products from products;

-- total orders
select count(*) as total_orders from orders;

-- total units sold
select sum(quantity) as total_units from order_items;

-- total revenue
select sum(quantity*unit_price) as total_revenue from order_items;

-- average order values
select avg(order_total) as average_order from(
select order_id,sum(quantity*unit_price) as order_total 
from order_items group by order_id) as order_total;


-- phase 2 customer analysis

-- how much each customers spent
select c.customer_id,c.customer_name,sum(quantity*unit_price) as total_spent
from customers as c join orders as o on c.customer_id=o.customer_id join order_items as oi 
on o.order_id=oi.order_id group by c. customer_id,customer_name 
order by total_spent desc;

-- customer placed more than one order
select c.customer_id,c.customer_name,count(order_id) as more_than_oneorder
from customers as c join orders o on c.customer_id=o.customer_id 
group by c.customer_id,customer_name having count(order_id)>1
order by more_than_oneorder desc;

-- customer never placed order
select c.customer_id,c.customer_name from customers as c
left join orders as o on c.customer_id=o.customer_id 
where o.order_id is null;

-- city gernerated more order-item value
select c.city,sum(quantity*unit_price) as city_itemvalue
from customers as c join orders as o  on c.customer_id= o.customer_id join order_items oi 
on o.order_id=oi.order_id group by c.city 
order by city_itemvalue desc;

-- top 5 customers recorded spending
select c.customer_id,c.customer_name,sum(quantity*unit_price) as record_spend
from customers as c join orders as o on c.customer_id=o.customer_id join order_items as oi
on o.order_id=oi.order_id group by c.customer_id,c.customer_name
order by record_spend desc limit 5 ;

-- phase 3 product analysis
select p.product_id,p.product_name,sum(oi.quantity) highest_unit
from products as p join order_items oi on p.product_id=oi.product_id 
group by p.product_id,p.product_name 
order by highest_unit desc;

-- product category more item_value
select p.product_id,p.category,sum(quantity*unit_price) as item_value
from products as p join order_items oi on p.product_id=oi.product_id group by p.product_id,p.category
order by item_value desc;

-- products never ordered
select p.product_name from products as p left join order_items 
as oi on p.product_id = oi.product_id where oi.order_id is null;

-- selling price above average price
select p.product_name,p.category,p.price from products as p
join (select avg(price) as avg_price from products) as a on p.price> a.avg_price
order by p.price desc;

-- products most expensive than other
select product_name,category,price from products 
where price>(select max(price) as expensive_price 
from products where category='clothing')
order by price desc;

-- below average stock
select product_name,price,stock from products as p 
where stock<(select avg(stock) from products) order by stock asc;

-- inventory value of each product
select category,sum(price*stock) as inventory_value from products as p
group by category 
order by inventory_value desc;

-- phase 4 order analysis

-- oredrs for each order_status
select order_status,count(*) as total_orders 
from orders group by order_status order by total_orders desc;

-- total order- item value for order
select o.order_status,sum(quantity*unit_price) as total_item_value
from orders as o join order_items oi on o.order_id=oi.order_id 
group by o.order_status order by total_item_value desc;

--  highest -value order
select o.order_id,o.order_status,sum(quantity*unit_price) as order_value
from orders o  join order_items oi on o.order_id =oi.order_id 
group by order_id,order_status order by order_value desc
limit 1;

-- average order value for each order
select o.order_status,round(avg(order_totals.order_value),2)
as average_order_value from orders as o join (select order_id,sum(quantity*unit_price) as order_value
from order_items group by order_id) as order_totals
on o.order_id=order_totals.order_id group by order_status 
order by average_order_value desc;

-- orders with no items
select o.order_id,o.order_date,order_status from orders as o 
left join order_items as oi on o.order_id=oi.order_id 
where oi.order_id is null order by o.order_id;

-- total quantity of products in each order
select o.order_id,sum(oi.quantity) as total_quantity
from orders as o join order_items as oi on o.order_id =oi.order_id
group by order_id 
order by total_quantity desc;

-- order total value >10000
select order_id,sum(quantity*unit_price) as order_value 
from order_items  as o group by order_id having sum(quantity*unit_price) >10000
order by order_value desc;

-- orders each custromer have in order status
select c.customer_name,o.order_status,count(order_id)as total_orders
from customers as c join orders as o on c.customer_id=o.customer_id 
group by c.customer_name,o.order_status order by c.customer_name,total_orders desc;

-- phase 5 -- time analysis

-- orders placed in each month
select date_format(order_date,'%y-%m') as order_month,
count(*) as total_orders
from orders as o group by date_format(order_date,'%y-%m')
order by order_MONTH;

-- recorderd order item for each month
select YEAR(o.order_date) as order_year,month(o.order_date)as order_month,sum(quantity*unit_price)as monthly_item_value
from orders as o join order_items as oi on o.order_id=oi.order_id 
group by year(o.order_date),month(o.order_date) order by order_year, order_month;

-- avg recorderd order item by month
select year(o.order_date) as order_year,month(o.order_date) as order_month,
round(avg(oi.quantity*unit_price),2) as avg_monthly_order from orders as o join
order_items as oi on o.order_id=oi.order_id group by year(o.order_date),month(order_date)
order by order_year,order_month;

-- day of week most order placed
select DAYNAME(order_date) as day_name, count(*) as total_orders from orders
group by dayname(order_date) order by total_orders desc;

-- avg number of products per order
select dayname(o.order_date) as day_name, round(avg(order_totals.total_quantity),2)
as avg_product_order from orders as o join(select order_id,sum(quantity) as total_quantity
from order_items group by order_id ) as order_totals on o.order_id= order_totals.order_id
group by dayname(o.order_date) order by avg_product_order desc;

-- month had most orders
select year(order_date) as order_year,month(order_date) as order_month,count(order_id) as total_orders
from orders as o  group by year(order_date),
MONTH(order_date) order by total_orders desc limit 1;

-- date had most orders
select order_date,count(order_id) AS total_orders from orders as o 
group by order_date 
order by total_orders desc
limit 1;

-- diff of first and last order
select min(order_date) as first_order_date,max(order_date) as last_order_date,
datediff(max(order_date),min(order_date))as total_days from orders;

-- date has high sales value
select o.order_date,sum(quantity*unit_price) as sale_value from orders as o
join order_items as oi on o.order_id=oi.order_id group by o.order_date 
order by sale_value desc limit 1;

-- week of ordrer date
select week(order_date) as order_week, count(order_id) as total_orders from orders as o
group by week(order_date) order by order_week;

-- phase 6 advanced queries
-- customer spending

with customer_spending as(select o.customer_id,sum(quantity*unit_price) as total_spent
from orders as o join order_items oi on o.order_id=oi.order_id group by o.customer_id)
select c.customer_name,cs.total_spent from customer_spending cs join customers c on cs.customer_id
=c.customer_id order by cs.total_spent desc;

-- order date ranking
select order_id,order_date,row_number() over(order by order_date) as row_num 
from orders;

-- rank products based on price
select product_name,price,rank() over(order by price desc) as rank_price
from products;

-- rank products from low to high
select product_name,price,dense_rank() over(order by price desc) 
from products;

-- rank products with each category based on price
select product_name,category,price,rank() over(partition by category order by price desc)
as price_rank from products;

-- high-product price in each category
select product_name,category,price,price_rank from(select product_name,category,price,rank()
over(partition by category order by price desc) as price_rank from products) as ranked_products
where price_rank=1;

-- top 2 product in each category
select product_name,category,price,price_rank from
(select product_name,category,price, rank() over(partition by category order by price desc)
as price_rank from products) as ranked_products where price_rank<=2
order by category,price_rank;

-- running total of product price
select product_name,price,sum(price) over(order by product_id) as running_total 
from products order by product_id;

-- compare product price with previous price
select product_name,price,lag(price) over(order by product_id) as previous_price
from products order by product_id;

-- compare with next products price
select product_name,price,lead(price) over(order by product_Id) as next_price
from products order by product_id;

-- difference of previous price vs current price
select product_name,price,lag(price) over (order by product_id) as previous_price,
price-lag(price) over(order by product_id) as price_difference from products 
order by product_id;

-- each customer seperate order number based on ORDER DATE
select customer_id,order_id,order_date,row_number()over(partition by customer_id
order by order_date) as order_number from orders order by customer_id,order_date;

-- latest order for each customer
select customer_id,order_id,order_date from ( select customer_id,order_id,order_date,
row_number() over(partition by customer_id order by order_date asc) as rn
 from orders) as customer_orders where rn=2;
 
 -- how many order each customer placed, while keeping every order row
 select order_id,customer_id,order_date,count(*) over (partition by customer_id )
 as customer_order_count from orders order by customer_id,order_id,order_date;
 
 -- total sales of product while keeping every row item
 select product_id,order_id,quantity,unit_Price,sum(quantity*unit_price)
 over (partition by product_id) as product_total_sales from order_items order by product_id;
 
 -- max product
 select product_name,category,price,max(price) over (partition by category)
 as max_category_price from products order by category,price desc;
 
 -- phase 7- overall business performance
 select (select count(*) from customers) as total_customers,
 (select count(*) from products) as total_products,
 (select count(*) from orders ) as total_orders,
 (select sum(quantity) from order_items) as total_units_sold,
 (select sum(quantity*unit_price) from order_items) as total_itemn_value;
 
 -- customer perfomance
 select c.customer_id,c.customer_name,count(DISTINCT o.order_id) as total_orders,
 sum(quantity*unit_price) as total_spent from customers c join orders as o
 on c.customer_id=o.customer_id join order_items oi on o.order_id= oi.order_id
 group by c.customer_id,c.customer_name having count(distinct o.order_id)>=2
 order by total_spent desc;
 
 -- best perfoming category and sales
 select p.category,sum(quantity*oi.unit_price) as total_sales from products p
 join order_items oi on p.product_id=oi.product_id group by category
 order by total_sales desc;
 



 


