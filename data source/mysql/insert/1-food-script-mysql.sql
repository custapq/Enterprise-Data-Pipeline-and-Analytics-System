-- Ensure the table uses UTF-8 for Thai language support
ALTER TABLE nutrienttype CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE nutrient CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE foodcategory CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Insert data into nutrienttype
INSERT INTO nutrienttype (nttypecode, nttypename) VALUES 
(1, 'พลังงานและสารอาหารหลัก'),
(2, 'แร่ธาตุ'),
(3, 'วิตามิน'),
(4, 'น้ำตาลและเส้นใยอาหาร');

-- Insert data into nutrient
INSERT INTO nutrient (ntcode, ntname, nttypecode) VALUES 
(1, 'Energy', 1),
(2, 'Water', 1),
(3, 'Protein', 1),
(4, 'Fat', 1),
(5, 'Carbohydrate', 1),

(6, 'Calcium', 2),
(7, 'Phosphorus', 2),
(8, 'Magnesium', 2),
(9, 'Sodium', 2),
(10, 'Potassium', 2),
(11, 'Iron', 2),
(12, 'Copper', 2),
(13, 'Zinc', 2),
(14, 'Iodine', 2),

(15, 'Beta-Carotene', 3),
(16, 'Retinol', 3),
(17, 'Vitamin A', 3),
(18, 'Thiamin (B1)', 3),
(19, 'Riboflavin (B2)', 3),
(20, 'Niacin (B3)', 3),
(21, 'Vitamin C', 3),
(22, 'Vitamin E', 3),

(23, 'Fiber', 4),
(24, 'Ash', 4),
(25, 'Sugar', 4);

-- Insert data into foodcategory
INSERT INTO foodcategory (fccode, fcname) VALUES 
(1, 'อาหารจานเดียว');

-- Ensure the table uses UTF-8 for Thai language support
ALTER TABLE exercise CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `condition` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Insert data into the exercise table
INSERT INTO exercise (excode, exname, exvalue) VALUES 
(1, 'ทำงานอยู่กับที่และไม่ออกกำลังกาย', 1.2),
(2, 'ออกกำลังกายน้อย สัปดาห์ละ 1-3 วัน', 1.375),
(3, 'ออกกำลังกายปานกลาง สัปดาห์ละ 3-5 วัน', 1.55),
(4, 'ออกกำลังกายหนัก สัปดาห์ละ 6-7 วัน', 1.725),
(5, 'ออกกำลังกายหนักมาก เช้า-เย็นทุกวัน', 1.9);

-- Insert data into the condition table
INSERT INTO chronicdisease (cdcode, cdname) VALUES 
(1, 'ไม่เป็นโรค'),
(2, 'โรคความดันโลหิตสูง'),
(3, 'โรคหลอดเลือดสมอง'),
(4, 'โรคหัวใจขาดเลือด'),
(5, 'โรคกระเพาะอาหาร'),
(6, 'โรคมะเร็งตับ'),
(7, 'โรคเบาหวาน'),
(8, 'โรคถุงลมโป่งพอง'),
(9, 'โรคกระดูกพรุน');

INSERT INTO ingredient (ingname) VALUES
('ทูน่า'),
('เนื้อวัว'),
('ไก่'),
('กะทิ'),
('พริกแกงเขียวหวาน'),
('พริกแกงเผ็ด'),
('พริกไทย'),
('กระเทียม'),
('ข่า'),
('ตะไคร้'),
('ใบมะกรูด'),
('หัวหอม'),
('น้ำปลา'),
('น้ำตาล'),
('เกลือ'),
('น้ำมันพืช'),
('เห็ด'),
('กุ้ง'),
('ผักรวม'),
('มะเขือเปราะ'),
('มะเขือพวง'),
('ฟักทอง'),
('ถั่วฝักยาว'),
('น้ำมะนาว'),
('น้ำต้มสุก');

INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES (1,'แกงเขียวหวานทูน่า','Curry green tuna','https://img-global.cpcdn.com/recipes/964d04391600e3e9/680x482cq70/%E0%B8%A3%E0%B8%9B-%E0%B8%AB%E0%B8%A5%E0%B8%81-%E0%B8%82%E0%B8%AD%E0%B8%87-%E0%B8%AA%E0%B8%95%E0%B8%A3-%E0%B9%81%E0%B8%81%E0%B8%87%E0%B9%80%E0%B8%82%E0%B8%A2%E0%B8%A7%E0%B8%AB%E0%B8%A7%E0%B8%B2%E0%B8%99%E0%B8%97%E0%B8%99%E0%B8%B2.jpg','');
INSERT INTO foodcategorydetail (fdcode, seq, fccode) VALUES (1,1,1);
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,1,1,169,'kcal');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,2,2,68.6,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,3,3,9.16,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,4,4,10.36,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,5,5,9.82,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (1,7,24,2.06,'g');
INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES (2,'แกงเผ็ดเนื้อ','Curry red beef','https://img.wongnai.com/p/400x0/2019/08/06/07ac51ff3efd4fd5b4c2337bb13717ea.jpg','');
INSERT INTO foodcategorydetail (fdcode, seq, fccode) VALUES (2,1,1);
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,1,1,136,'kcal');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,2,2,73,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,3,3,10.1,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,4,4,7.77,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,5,5,6.45,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (2,7,24,2.65,'g');
INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES (3,'แกงเลียง','Spicy vegetable and prawn soup','https://img-global.cpcdn.com/recipes/a72a52b89bd0c284/400x400cq70/photo.jpg','');
INSERT INTO foodcategorydetail (fdcode, seq, fccode) VALUES (3,1,1);
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,1,1,30,'kcal');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,2,2,91.6,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,3,3,1.44,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,4,4,0.35,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,5,5,5.36,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,7,24,1.29,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,8,6,24,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,9,7,40,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,10,8,17,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,11,9,3,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (3,12,10,170,'g');
INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES (4,'กระเทียมพริกไทยไก่','Fried chicken with garlic and pepper','https://s359.kapook.com/pagebuilder/683d4862-5951-4398-a53f-97af8490f14a.jpg','');
INSERT INTO foodcategorydetail (fdcode, seq, fccode) VALUES (4,1,1);
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,1,1,186,'kcal');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,2,2,63.2,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,3,3,18.38,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,4,4,10.02,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,5,5,5.68,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (4,7,24,2.74,'g');
INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES (5,'ต้มข่าทูน่า','Soup coconut milk with galangal tuna','https://media.oknation.net/uploads/201207/21/48866e3f3.jpg','');
INSERT INTO foodcategorydetail (fdcode, seq, fccode) VALUES (5,1,1);
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,1,1,104,'kcal');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,2,2,80.2,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,3,3,7.26,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,4,4,6.64,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,5,5,3.82,'g');
INSERT INTO nutrientdetail (fdcode, seq, ntcode, amount, unit) VALUES (5,7,24,2.11,'g');

-- แกงเขียวหวานทูน่า
INSERT INTO ingredientdetail (fdcode, seq, ingcode, amount, unit) VALUES
(1, 1, 1, 100, 'g'),
(1, 2, 5, 50, 'g'),
(1, 3, 4, 200, 'ml'),
(1, 4, 12, 10, 'g'),
(1, 5, 13, 10, 'ml'),
(1, 6, 14, 5, 'g'),
(1, 7, 15, 10, 'ml'),
(1, 8, 19, 50, 'g');

-- แกงเผ็ดเนื้อ
INSERT INTO ingredientdetail (fdcode, seq, ingcode, amount, unit) VALUES
(2, 1, 2, 120, 'g'),
(2, 2, 6, 50, 'g'),
(2, 3, 4, 200, 'ml'),
(2, 4, 12, 10, 'g'),
(2, 5, 13, 10, 'ml'),
(2, 6, 14, 5, 'g'),
(2, 7, 15, 10, 'ml'),
(2, 8, 20, 50, 'g');

-- แกงเลียง
INSERT INTO ingredientdetail (fdcode, seq, ingcode, amount, unit) VALUES
(3, 1, 18, 100, 'g'),
(3, 2, 9, 10, 'g'),
(3, 3, 10, 5, 'g'),
(3, 4, 11, 2, 'ใบ'),
(3, 5, 13, 5, 'ml'),
(3, 6, 14, 3, 'g'),
(3, 7, 24, 500, 'ml'),
(3, 8, 19, 100, 'g'),
(3, 9, 21, 50, 'g'),
(3, 10, 22, 50, 'g'),
(3, 11, 23, 50, 'g');

-- กระเทียมพริกไทยไก่
INSERT INTO ingredientdetail (fdcode, seq, ingcode, amount, unit) VALUES
(4, 1, 3, 150, 'g'),
(4, 2, 7, 10, 'g'),
(4, 3, 8, 10, 'g'),
(4, 4, 13, 10, 'ml'),
(4, 5, 14, 5, 'g'),
(4, 6, 15, 10, 'ml'),
(4, 7, 16, 10, 'ml');

-- ต้มข่าทูน่า
INSERT INTO ingredientdetail (fdcode, seq, ingcode, amount, unit) VALUES
(5, 1, 1, 100, 'g'),
(5, 2, 4, 200, 'ml'),
(5, 3, 9, 10, 'g'),
(5, 4, 10, 5, 'g'),
(5, 5, 11, 2, 'ใบ'),
(5, 6, 12, 10, 'g'),
(5, 7, 13, 10, 'ml'),
(5, 8, 14, 5, 'g'),
(5, 9, 17, 50, 'g'),
(5, 10, 24, 500, 'ml');

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) VALUES
(1, 'user1@example.com', 'password001', 'ก้องภพ', 'ศิริวัฒน์', 46, 69, 184, 'ช', 4),
(2, 'user2@example.com', 'password002', 'วรากร', 'จันทร์ดี', 28, 64, 185, 'ช', 5),
(3, 'user3@example.com', 'password003', 'ปริญญา', 'บุญมี', 46, 87, 176, 'ช', 2),
(4, 'user4@example.com', 'password004', 'นราวิชญ์', 'ทองสุข', 46, 69, 174, 'ช', 4),
(5, 'user5@example.com', 'password005', 'สิริวรรณ', 'แซ่ลิ้ม', 29, 85, 185, 'ญ', 2),
(6, 'user6@example.com', 'password006', 'จิราภรณ์', 'วงศ์สวัสดิ์', 42, 62, 169, 'ญ', 5),
(7, 'user7@example.com', 'password007', 'สุพัตรา', 'เกษมสุข', 45, 85, 161, 'ญ', 1),
(8, 'user8@example.com', 'password008', 'ณัฐวดี', 'พงษ์ศรี', 50, 84, 188, 'ญ', 5),
(9, 'user9@example.com', 'password009', 'ธนกร', 'เลิศชัย', 45, 62, 179, 'ช', 5),
(10, 'user10@example.com', 'password010', 'อารยา', 'รุ่งเรือง', 39, 68, 176, 'ญ', 5);

INSERT INTO usercondition (usercode, cdcode) VALUES 
(1, 1),
(2, 1),
(2, 6),
(3, 8),
(4, 1),
(5, 4),
(6, 3),
(6, 6),
(7, 1),
(8, 7),
(9, 5),
(10, 2);

INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES 
(1, 1, 1),
(1, 5, 2),
(3, 2, 1),
(5, 4, 1),
(7, 3, 1);

INSERT INTO foodallergy (usercode, ingcode) VALUES 
(2, 1),
(4, 8),
(6, 7),
(8, 11);
