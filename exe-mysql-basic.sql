CREATE DATABASE app_food;

-- user table
CREATE TABLE users (
users_id INT PRIMARY KEY AUTO_INCREMENT, 
full_name VARCHAR(255),
email VARCHAR(255),
passwords VARCHAR(255) 
)
INSERT INTO users (full_name, email) VALUES
('Nguyễn Văn A', 'a@gmail.com'),
('Nguyễn Văn B', 'B@gmail.com'),
('Nguyễn Văn C', 'c@gmail.com'),
('Nguyễn Văn D', 'd@gmail.com'),
('Nguyễn Văn E', 'e@gmail.com'),
('Nguyễn Văn H', 'h@gmail.com'),
('Nguyễn Văn G', 'g@gmail.com')
DROP TABLE users

-- restaurant
CREATE TABLE restaurant (
res_id INT PRIMARY KEY AUTO_INCREMENT,
res_name VARCHAR(255),
image VARCHAR(255),
descs VARCHAR(255)
)

INSERT INTO restaurant (res_name, image, descs) VALUES
('restaurant_1', 'image_1', 'restaurant number one' ),
('restaurant_2', 'image_1', 'restaurant number one' ),
('restaurant_3', 'image_1', 'restaurant number one' ),
('restaurant_4', 'image_1', 'restaurant number one' ),
('restaurant_5', 'image_1', 'restaurant number one' ),
('restaurant_6', 'image_1', 'restaurant number one' ),
('restaurant_7', 'image_1', 'restaurant number one' )

-- rate 
CREATE TABLE rate_res(
rate_id INT PRIMARY KEY AUTO_INCREMENT,
users_id INT,
res_id INT,
amount INT,
date_rate DATETIME,
FOREIGN KEY (users_id) REFERENCES users(users_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)
INSERT INTO rate_res (users_id, res_id,amount, date_rate) VALUES
(1,3,1, '2024-12-12 00:00:00'),
(2,4,2, '2024-12-12 00:00:00'),
(1,5,4, '2024-12-12 00:00:00'),
(4,6, 3, '2024-12-12 00:00:00'),
(6,4,5, '2024-12-12 00:00:00')

DELETE FROM rate_res
WHERE rate_id BETWEEN 1 AND 5;



-- order
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
users_id INT,
food_id INT,
amount INT,
codes VARCHAR(255),
arr_sub_id VARCHAR(255),
FOREIGN KEY (users_id) REFERENCES users(users_id),
FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO orders (users_id, food_id,amount,codes,arr_sub_id) VALUES
(1,2,2,'221','001'),
(1,3,1,'223','002'),
(2,4,3,'224','003'),
(3,5,2,'225','004'),
(4,1,5,'226','005'),
(5,6,1,'227','006'),
(6,1,1,'228','007')




-- food
CREATE TABLE food(
food_id INT PRIMARY KEY AUTO_INCREMENT, 
food_name VARCHAR(255),
image VARCHAR(255),
price FLOAT,
descs VARCHAR(255),
type_id INT,
FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)
INSERT INTO food (food_name, image, price, descs, type_id) VALUES
('Bùn Bò', 'https://bunbo.png', 50000, 'đặc sản sứ Huế', 1),
('Chè', 'https://che.png', 30000, 'làm mát cơ thể', 2),
('Hủ tiếu gõ', 'https://hutueu.png', 30000, 'món ăn nhanh tiện', 1),
('cơm mẹ nấu', 'https://com.png', 0, 'món ăn free', 1),
('cơm gà', 'https://com.png', 35000, 'món ăn ', 1),
('cơm sường', 'https://com.png', 35000, 'món ăn ', 1)


-- sub_food 
CREATE TABLE sub_food(
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(255),
sub_price FLOAT,
food_id INT,
FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO sub_food(sub_name, sub_price, food_id) VALUES
('khoai tây chiên', 10000, 1),
('rau sống' , 10000.0, 2),
('mù tạc', 5000.0, 3 ),
('quẩy', 3000.00, 4)

-- food_type
CREATE TABLE food_type(
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(255)
)
INSERT INTO food_type (type_name) VALUES
('nóng'),
('lạnh')

-- like_res
CREATE TABLE like_res(
like_id INT PRIMARY KEY AUTO_INCREMENT,
users_id INT,
res_id INT,
date_like DATETIME,
FOREIGN KEY (users_id) REFERENCES users(users_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)
INSERT INTO like_res (users_id, res_id,date_like) VALUES
(3,3,'2024-01-01 00:00:00'),
(6,3,'2024-01-01 00:00:00'),
(6,3,'2024-01-01 00:00:00'),
(6,3,'2024-01-01 00:00:00'),
(6,3,'2024-01-01 00:00:00'),
(1,1,'2024-01-01 00:00:00'),
(2,1,'2024-01-01 00:00:00'),
(2,3,'2024-01-01 00:00:00'),
(4,5,'2024-01-01 00:00:00'),
(5,1,'2024-01-01 00:00:00'),
(3,7,'2024-01-01 00:00:00'),
(4,2,'2024-01-01 00:00:00')


-- 5 người đã like nhà hàng nhiều nhất
SELECT COUNT(like_res.users_id) AS 'người đã like nhà hàng nhiều nhất', like_res.users_id, users.users_id, users.full_name, users.email,users.passwords
FROM like_res
INNER JOIN users ON like_res.users_id = users.users_id 
GROUP BY like_res.users_id
ORDER BY  `người đã like nhà hàng nhiều nhất` DESC
LIMIT 5

-- 2 nhà hàng có lượt like nhiều nhất

SELECT COUNT(like_res.res_id) AS 'nhà hàng có lượt like nhiều nhất',like_res.res_id, restaurant.res_id,restaurant.res_name,restaurant.image,restaurant.descs
FROM like_res
INNER JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP BY like_res.res_id
ORDER BY `nhà hàng có lượt like nhiều nhất` DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất
SELECT  COUNT(orders.users_id) AS 'người đã đặt hàng nhiều nhất' ,orders.users_id, users.users_id, users.full_name,users.email,users.passwords
FROM orders
INNER JOIN users ON orders.users_id = users.users_id
GROUP BY orders.users_id
ORDER BY `người đã đặt hàng nhiều nhất` DESC 
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống
-- (không đặt hàng, không like, không đánh giá nhà hàng).
 





SELECT  users.full_name AS 'người dùng không hoạt động trong hệ thống'
FROM users
LEFT JOIN orders ON users.users_id = orders.users_id
LEFT JOIN like_res ON users.users_id = like_res.users_id
LEFT JOIN rate_res ON users.users_id = rate_res.users_id
WHERE orders.users_id IS NULL 
  AND like_res.users_id IS NULL 
  AND rate_res.users_id IS NULL;







