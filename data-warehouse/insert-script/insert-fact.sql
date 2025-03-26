INSERT INTO factmealconsumption (mealdetailcode, mealcode, usercode, fdcode, date_id, total_calories, meal_type)
SELECT md.mealdetailcode, m.mealcode, m.usercode, md.fdcode,
       TO_CHAR(m.createdate, 'YYYYMMDD') AS date_id,
       (SELECT SUM(nd.amount) 
        FROM stNutrientDetail nd 
        WHERE nd.fdcode = md.fdcode 
          AND nd.ntcode = (SELECT ntcode FROM dimnutrient WHERE ntcode = 1 AND ROWNUM = 1)
       ) AS total_calories,
       CASE 
           WHEN TO_NUMBER(TO_CHAR(m.createdate, 'HH24')) BETWEEN 5 AND 10 THEN 'Breakfast'
           WHEN TO_NUMBER(TO_CHAR(m.createdate, 'HH24')) BETWEEN 11 AND 14 THEN 'Lunch'
           WHEN TO_NUMBER(TO_CHAR(m.createdate, 'HH24')) BETWEEN 17 AND 20 THEN 'Dinner'
           ELSE 'Snack'
       END AS meal_type
FROM stMealDetail md
JOIN stMeal m ON md.mealcode = m.mealcode;

INSERT INTO factnutrientconsumption (factnut_id, usercode, fdcode, date_id, ntcode, amount, unit)
SELECT ROWNUM AS factnut_id, m.usercode, md.fdcode, 
       TO_CHAR(m.createdate, 'YYYYMMDD') AS date_id,  -- แปลงวันที่ให้ตรงกับ DimDate
       nd.ntcode, nd.amount, nt.ntname AS unit
FROM stMealDetail md
JOIN stMeal m ON md.mealcode = m.mealcode
JOIN stNutrientDetail nd ON md.fdcode = nd.fdcode
JOIN dimnutrient nt ON nd.ntcode = nt.ntcode;

INSERT INTO factuserhealth (usercode, age, weight, height, bmi, excode, total_calories_needed, total_calories_consumed)
SELECT u.usercode, u.age, u.weight, u.height,
       ROUND(u.weight / POWER(u.height / 100, 2), 2) AS bmi,  -- คำนวณ BMI
       u.excode,
       (e.exvalue * u.weight) AS total_calories_needed,  -- คำนวณพลังงานที่ต้องการต่อวัน
       (SELECT SUM(fc.total_calories)
        FROM factmealconsumption fc
        WHERE fc.usercode = u.usercode
       ) AS total_calories_consumed  -- พลังงานที่บริโภคทั้งหมด
FROM stAppUser u
JOIN dimexercise e ON u.excode = e.excode;

INSERT INTO factfavoritefood (usercode, fdcode, order_rank)
SELECT m.usercode, md.fdcode, DENSE_RANK() OVER (PARTITION BY m.usercode ORDER BY COUNT(*) DESC) AS order_rank
FROM stMealDetail md
JOIN stMeal m ON md.mealcode = m.mealcode
GROUP BY m.usercode, md.fdcode
HAVING COUNT(*) > 1  -- อาหารที่ถูกเลือกหลายครั้ง (มากกว่า 1 ครั้ง)
ORDER BY m.usercode, order_rank;
