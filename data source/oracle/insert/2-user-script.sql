-- Insert data into the exercise table
INSERT INTO exercise (excode, exname, exvalue) VALUES (1, 'ทำงานอยู่กับที่และไม่ออกกำลังกาย', 1.2);
INSERT INTO exercise (excode, exname, exvalue) VALUES (2, 'ออกกำลังกายน้อย สัปดาห์ละ 1-3 วัน', 1.375);
INSERT INTO exercise (excode, exname, exvalue) VALUES (3, 'ออกกำลังกายปานกลาง สัปดาห์ละ 3-5 วัน', 1.55);
INSERT INTO exercise (excode, exname, exvalue) VALUES (4, 'ออกกำลังกายหนัก สัปดาห์ละ 6-7 วัน', 1.725);
INSERT INTO exercise (excode, exname, exvalue) VALUES (5, 'ออกกำลังกายหนักมาก เช้า-เย็นทุกวัน', 1.9);

-- Insert data into the condition table
INSERT INTO condition (cdcode, cdname) VALUES (0, 'ไม่เป็นโรค');
INSERT INTO condition (cdcode, cdname) VALUES (1, 'โรคความดันโลหิตสูง');
INSERT INTO condition (cdcode, cdname) VALUES (2, 'โรคหลอดเลือดสมอง');
INSERT INTO condition (cdcode, cdname) VALUES (3, 'โรคหัวใจขาดเลือด');
INSERT INTO condition (cdcode, cdname) VALUES (4, 'โรคกระเพาะอาหาร');
INSERT INTO condition (cdcode, cdname) VALUES (5, 'โรคมะเร็งตับ');
INSERT INTO condition (cdcode, cdname) VALUES (6, 'โรคเบาหวาน');
INSERT INTO condition (cdcode, cdname) VALUES (7, 'โรคถุงลมโป่งพอง');
INSERT INTO condition (cdcode, cdname) VALUES (8, 'โรคกระดูกพรุน');

-- Insert data into the appuser table
INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (1, 'user1@example.com', 'password123', 'John', 'Doe', 25, 70, 175, 'M', 3);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (2, 'user2@example.com', 'password456', 'Jane', 'Smith', 30, 60, 165, 'F', 2);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (3, 'user3@example.com', 'password789', 'Alice', 'Johnson', 40, 80, 180, 'F', 4);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (4, 'user4@example.com', 'passwordabc', 'Bob', 'Brown', 35, 75, 170, 'M', 1);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (5, 'user5@example.com', 'passworddef', 'Emily', 'Davis', 28, 55, 160, 'F', 2);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (6, 'user6@example.com', 'passwordghi', 'Michael', 'Wilson', 45, 90, 185, 'M', 5);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (7, 'user7@example.com', 'passwordjkl', 'Sophia', 'Miller', 32, 65, 170, 'F', 3);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (8, 'user8@example.com', 'passwordmno', 'David', 'Taylor', 50, 85, 180, 'M', 4);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (9, 'user9@example.com', 'passwordpqr', 'Olivia', 'Anderson', 27, 58, 162, 'F', 1);

INSERT INTO appuser (usercode, email, password, firstname, lastname, age, weight, height, gender, excode) 
VALUES (10, 'user10@example.com', 'passwordstu', 'James', 'Thomas', 33, 72, 178, 'M', 2);

-- Insert data into the usercondition table
INSERT INTO usercondition (usercode, cdcode) VALUES (1, 0);
INSERT INTO usercondition (usercode, cdcode) VALUES (2, 1);
INSERT INTO usercondition (usercode, cdcode) VALUES (2, 6);
INSERT INTO usercondition (usercode, cdcode) VALUES (3, 8);
INSERT INTO usercondition (usercode, cdcode) VALUES (4, 0);
INSERT INTO usercondition (usercode, cdcode) VALUES (5, 4);
INSERT INTO usercondition (usercode, cdcode) VALUES (6, 3);
INSERT INTO usercondition (usercode, cdcode) VALUES (6, 6);
INSERT INTO usercondition (usercode, cdcode) VALUES (7, 0);
INSERT INTO usercondition (usercode, cdcode) VALUES (8, 7);
INSERT INTO usercondition (usercode, cdcode) VALUES (9, 5);
INSERT INTO usercondition (usercode, cdcode) VALUES (10, 2);
INSERT INTO usercondition (usercode, cdcode) VALUES (10, 1);

-- Insert data into the favoritefood table
INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES (1, 0, 1);
INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES (1, 6, 2);
INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES (3, 2, 1);
INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES (5, 4, 1);
INSERT INTO favoritefood (usercode, fdcode, orderby) VALUES (7, 10, 1);

-- Insert data into the foodallergy table
INSERT INTO foodallergy (usercode, ingcode) VALUES (2, 1);
INSERT INTO foodallergy (usercode, ingcode) VALUES (4, 8);
INSERT INTO foodallergy (usercode, ingcode) VALUES (6, 7);
INSERT INTO foodallergy (usercode, ingcode) VALUES (8, 11);

-- Insert data into the meal table
INSERT INTO meal (mealcode, createdate, usercode) VALUES (1, SYSDATE, 1);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (2, SYSDATE, 2);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (3, SYSDATE, 3);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (4, SYSDATE, 4);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (5, SYSDATE, 5);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (6, SYSDATE, 6);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (7, SYSDATE, 7);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (8, SYSDATE, 8);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (9, SYSDATE, 9);
INSERT INTO meal (mealcode, createdate, usercode) VALUES (10, SYSDATE, 10);

-- Insert data into the mealdetail table
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (1, 1, 1, 0); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (2, 1, 2, 6);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (3, 2, 1, 1); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (4, 2, 2, 7);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (5, 3, 1, 2); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (6, 3, 2, 8);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (7, 4, 1, 3);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (8, 4, 2, 9);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (9, 5, 1, 4);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (10, 5, 2, 10); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (11, 6, 1, 5);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (12, 6, 2, 0); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (13, 7, 1, 6); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (14, 7, 2, 1);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (15, 8, 1, 7); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (16, 8, 2, 2); 
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (17, 9, 1, 8);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (18, 9, 2, 3);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (19, 10, 1, 9);
INSERT INTO mealdetail (mealdetailcode, mealcode, seq, fdcode) VALUES (20, 10, 2, 4); 


