INSERT INTO DimExercise (excode, exname, exvalue)
SELECT excode, exname, exvalue 
FROM stExercise;

INSERT INTO DimFoodCategory (fccode, fcname)
SELECT fccode, fcname 
FROM stFoodCategory;

INSERT INTO DimIngredient (ingcode, ingname)
SELECT ingcode, ingname 
FROM stIngredient;

INSERT INTO DIMNUTRIENTTYPE  (NTTYPECODE,NTTYPENAME)
SELECT s.NTTYPECODE,s.NTTYPENAME
FROM STNUTRIENTTYPE s ;

INSERT INTO DimNutrient (ntcode, ntname, nttypecode)
SELECT ntcode, ntname, nttypecode 
FROM stNutrient;

INSERT INTO DimFood (fdcode, fdtname, fdename, imageurl, fooddesc)
SELECT s.fdcode, s.fdtname, s.fdename, s.imageurl, s.fooddesc
FROM stFood s;

INSERT INTO DimUser (usercode, firstname, lastname, email, gender, age, weight, height, excode)
SELECT usercode, firstname, lastname, email, gender, age, weight, height, excode 
FROM stAppUser;

INSERT INTO DIMCONDITION (CDCODE,CDNAME)
SELECT s.CDCODE,s.CDNAME
FROM STCONDITION s ;

INSERT INTO DIMUSERCONDITION  (USERCODE,CDCODE)
SELECT 
   s.USERCODE,s.CDCODE
FROM STUSERCONDITION s ;

INSERT INTO DimDate (date_id, date_value, year, month, day, weekday, quarter)
SELECT DISTINCT TO_CHAR(createdate, 'YYYYMMDD') AS date_id, createdate AS date_value,
       EXTRACT(YEAR FROM createdate) AS year, 
       EXTRACT(MONTH FROM createdate) AS month, 
       EXTRACT(DAY FROM createdate) AS day, 
       TO_CHAR(createdate, 'D') AS weekday, 
       TO_CHAR(createdate, 'Q') AS quarter
FROM stMeal;
