SELECT * FROM users;

SELECT * FROM categories;

SELECT * FROM products WHERE category = 1;
SELECT * FROM products WHERE category = 1;
SELECT * FROM products WHERE category = 1;

SELECT products.name AS product_name, products.price, categories.name AS category_name
FROM products
INNER JOIN categories 
    ON categories.category_id = 1 
    AND products.category = categories.category_id;

SELECT products.name AS product_name, products.price, categories.name AS category_name
FROM products
INNER JOIN categories 
    ON categories.name = 'informatique' 
    AND products.category = categories.category_id;

SELECT products.name AS product_name, products.price, categories.name AS category_name
FROM products
INNER JOIN categories 
    ON categories.name = 'livres' 
    AND products.category = categories.category_id;

SELECT COUNT(name) FROM products WHERE category = 3;

SELECT SUM(price)
FROM products
INNER JOIN products_in_orders ON products_in_orders.order_id = 1 
    AND products.product_id = products_in_orders.product_id;

SELECT SUM(price)
FROM products
INNER JOIN products_in_orders ON products_in_orders.order_id = 2 
    AND products.product_id = products_in_orders.product_id;

SELECT orders.order_id, products.name AS product_name, products.price, orders.total_price, users.email_adress AS user_email, addresses.city AS to_city, addresses.street
FROM orders
INNER JOIN products_in_orders 
    ON products_in_orders.order_id = orders.order_id
INNER JOIN products 
    ON products.product_id = products_in_orders.product_id
INNER JOIN users 
    ON users.user_id = orders.from_user
INNER JOIN addresses 
    ON addresses.address_id = orders.to_address;

SELECT category FROM products GROUP BY category;