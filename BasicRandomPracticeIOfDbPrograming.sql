use BikeStore
go

select
first_name,
last_name
from
sales.customers;

select
first_name,
last_name,
email
from
sales.customers;

select * from sales.customers
where
state='CA'

select * from sales.customers
where
state='CA'
order by
first_name

SELECT
    city,
    COUNT (*)
FROM
    sales.customers
WHERE
    state = 'CA'
GROUP BY
    city
ORDER BY
    city;


SELECT
    city,
    COUNT (*)
FROM
    sales.customers
WHERE
    state = 'CA'
GROUP BY
    city
HAVING
    COUNT (*) > 10
ORDER BY
    city;

SELECT
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    first_name,
	last_name asc

SELECT
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	first_name DESC;


SELECT
    city,
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    city DESC,
    first_name ASC

SELECT
    city,
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    state;


SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name;

SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS;


SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price DESC,
    product_name 
OFFSET 0 ROWS 
FETCH FIRST 10 ROWS ONLY;

SELECT TOP 10
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;

SELECT TOP 5 PERCENT
    product_name, 
    list_price
FROM
    production.products
ORDER BY 
    list_price DESC;


---distinct clause--
SELECT
    city
FROM
    sales.customers
ORDER BY
    city;

SELECT DISTINCT
    city
FROM
    sales.customers
ORDER BY
    city;

SELECT
    city,
    state
FROM
    sales.customers
ORDER BY 
    city, 
    state;

SELECT DISTINCT
    city,
    state
FROM
    sales.customers

SELECT DISTINCT
    phone
FROM
    sales.customers
ORDER BY
    phone;


	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    category_id = 1
ORDER BY
    list_price DESC;

	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    category_id = 1 AND model_year = 2018
ORDER BY
    list_price DESC;

	SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price > 300 AND model_year = 2018
ORDER BY
    list_price DESC;


SELECT
    product_id,
    product_name,
    category_id,
    model_year,
    list_price
FROM
    production.products
WHERE
    list_price BETWEEN 1899.00 AND 1999.99
ORDER BY
    list_price DESC;

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price IN (89.99, 109.99, 159.99)
ORDER BY
    list_price;

SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    list_price NOT IN (89.99, 109.99, 159.99)
ORDER BY
    list_price;

SELECT
    product_id
FROM
    production.stocks
WHERE
    store_id = 1 AND quantity >= 30;


SELECT
    product_name,
    list_price
FROM
    production.products
WHERE
    product_id IN (
        SELECT
            product_id
        FROM
            production.stocks
        WHERE
            store_id = 1 AND quantity >= 30
    )
ORDER BY
product_name;
SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE 'z%'
ORDER BY
    first_name;
    product_name;

SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    last_name LIKE '_u%'
ORDER BY
    first_name;


CREATE SCHEMA hr;
GO

CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

	CREATE TABLE hr.employees(
		id INT PRIMARY KEY IDENTITY,
		fullname VARCHAR(100) NOT NULL
	);

INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');

INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;

SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	LEFT JOIN hr.employees e 
		ON e.fullname = c.fullname;

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    LEFT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE 
    e.id IS  NULL;


SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products
ORDER BY
    product_name DESC;

SELECT
    product_name,
    category_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c 
    ON c.category_id = p.category_id
ORDER BY
    product_name DESC;

SELECT
    product_name,
    category_name,
    brand_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY
    product_name DESC;

select 
 product_name,
    category_name,
    brand_name,
    list_price
from
 production.products p inner join production.categories c 
 on c.category_id=p.category_id
 inner join production.brands b on b.brand_id = p.brand_id
 order by
 product_name 

 CREATE SCHEMA pm;
GO

CREATE TABLE pm.projects(
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES pm.projects(id)
);

select * from pm.members

select * from pm.projects

INSERT INTO 
    pm.projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');

	INSERT INTO
    pm.members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);
 
 
 SELECT * FROM pm.projects

 SELECT 
    m.name member, 
    p.title project
FROM 
    pm.members m
    FULL OUTER JOIN pm.projects p 
        ON p.id = m.project_id;

SELECT
    e.first_name + ' ' + e.last_name employee,
    m.first_name + ' ' + m.last_name manager
FROM
    sales.staffs e
INNER JOIN sales.staffs m ON m.staff_id = e.manager_id
ORDER BY
    manager;

SELECT
    c1.city,
    c1.first_name + ' ' + c1.last_name customer_1,
    c2.first_name + ' ' + c2.last_name customer_2
FROM
    sales.customers c1
INNER JOIN sales.customers c2 ON c1.customer_id > c2.customer_id
AND c1.city = c2.city
ORDER BY
    city,
    customer_1,
    customer_2;

SELECT
    product_id,
    product_name,
    store_id,
    0 AS quantity
FROM
    production.products
CROSS JOIN sales.stores
ORDER BY
    product_name,
    store_id;

SELECT
    s.store_id,
    p.product_id,
    ISNULL(sales, 0) sales
FROM
    sales.stores s
CROSS JOIN production.products p
LEFT JOIN (
    SELECT
        s.store_id,
        p.product_id,
        SUM (quantity * i.list_price) sales
    FROM
        sales.orders o
    INNER JOIN sales.order_items i ON i.order_id = o.order_id
    INNER JOIN sales.stores s ON s.store_id = o.store_id
    INNER JOIN production.products p ON p.product_id = i.product_id
    GROUP BY
        s.store_id,
        p.product_id
) c ON c.store_id = s.store_id
AND c.product_id = p.product_id
WHERE
    sales IS NULL
ORDER BY
    product_id,
    store_id;
