INSERT INTO users (firstname, lastname, email_adress, phone_number, created_at) 
    VALUES 
    ('jean', 'pierre', 'jean@pierre.com', '123456789', NOW()),
    ('claude', 'jean', 'claude@jean.com', '78908721', NOW()),
    ('john', 'doe', 'johndoe@gmail.com', '0102030405', NOW()),
    ('toto', 'tata', 'tota@free.fr', '0689675423', NOW()),
    ('salut', 'lol', 'salol@outlook.fr', '123490876', NOW())
;

INSERT INTO categories (name, description)
    VALUES
    ('vêtements', 'découvrez notre sélection de vêtements!'),
    ('livres', 'tous les livres auxquels vous pouvez penser sont sur notre site!'),
    ('informatique', "notre séléction d'appareils informatique est la meilleure du marché")
;

INSERT INTO products (name, stock, price, description, image, rating, is_available, category)
    VALUES 
    ('t-shirt rose', 20, 15.99, 'un magnifique t shirt rose', 'tshirt.jpg', 4.2, 1, 1),
    ('jean noir', 5, 79.99, '', 'jean.png', 3.2, 1, 1),
    ('pull vert fluo', 0, 208.5, 'notre best seller! ne passez pas à côté de ce produit!', 'fluo.png', 5.0, 0, 1),
    ('le temps des tempêtes', 999, 10.0, "vous avez écouté l'audiobook ? n'hésitez pas à acheter la version materielle ;)", 'sarkoenculé.png', 1.2, 1, 2),
    ('le seigneur des anneaux intégrale', 0, 30.99, 'gandalf', 'golum.jpg', 4.6, 0, 2),
    ('harry potter', 18, 22.99, "n'achetez surtout pas ce livre l'autrice est une grosse transphobe!!!!!!", 'transrights.png', 2.6, 1, 2),
    ('macbook pro puce m4', 30, 2399.00, '', 'apple.jpeg', 4.1, 1, 3),
    ('nvidia geforce 10090 ti pro max turbo fusion gtr', 4, 5668.99, 'nouvelle carte graphique surpuissante, le strict minimum pour jouer à minecraft!!! ;)', 'nvidia.jpg', 4.8, 1, 3),
    ('clavier mechanique custom', 2, 299.00, 'switchs lubrifiés foam intégré dans la case, clavier 75% disponible dans tous les layouts du monde avec keycaps en pcb!!', 'superbeclavier.png', 4.9, 1, 3)
;

UPDATE categories
SET products_in_category = (SELECT COUNT(name) FROM products WHERE category = 1)
WHERE category_id = 1;

UPDATE categories
SET products_in_category = (SELECT COUNT(name) FROM products WHERE category = 2)
WHERE category_id = 2;

UPDATE categories
SET products_in_category = (SELECT COUNT(name) FROM products WHERE category = 3)
WHERE category_id = 3;

INSERT INTO orders (from_user, created_at)
    VALUES
    (1, NOW()),
    (2, NOW()),
    (5, NOW())
;

INSERT INTO products_in_orders (order_id, product_id)
    VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 7),
    (2, 9),
    (3, 4),
    (3, 6)
;

UPDATE orders
SET total_price = (
    SELECT SUM(price)
    FROM products
    INNER JOIN products_in_orders ON products_in_orders.order_id = 1 
    AND products.product_id = products_in_orders.product_id
)
WHERE order_id = 1;

UPDATE orders
SET total_price = (
    SELECT SUM(price)
    FROM products
    INNER JOIN products_in_orders ON products_in_orders.order_id = 2 
    AND products.product_id = products_in_orders.product_id
)
WHERE order_id = 2;

UPDATE orders
SET total_price = (
    SELECT SUM(price)
    FROM products
    INNER JOIN products_in_orders ON products_in_orders.order_id = 3 
    AND products.product_id = products_in_orders.product_id
)
WHERE order_id = 3;

INSERT INTO payments (from_client, for_order, is_fulfilled, fulfilled_at)
    VALUES
    ((SELECT from_user FROM orders WHERE order_id = 1), 1, 0, NULL),
    ((SELECT from_user FROM orders WHERE order_id = 2), 2, 1, NOW()),
    ((SELECT from_user FROM orders WHERE order_id = 3), 3, 1, NOW())
;