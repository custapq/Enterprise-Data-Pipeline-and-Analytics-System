CREATE TABLE stNutrientType (
   nttypecode NUMBER(4) PRIMARY KEY,
   nttypename VARCHAR2(40) NOT NULL
);

CREATE TABLE stNutrient (
   ntcode NUMBER(4) PRIMARY KEY,
   ntname VARCHAR2(40) NOT NULL,
   nttypecode NUMBER(4),
   CONSTRAINT st_fk_Nut_Type FOREIGN KEY (nttypecode)
      REFERENCES stNutrientType (nttypecode)
);

CREATE TABLE stFood (
   fdcode NUMBER(4) PRIMARY KEY,
   fdtname VARCHAR2(40) NOT NULL,
   fdename VARCHAR2(40),
   imageurl VARCHAR2(100),
   fooddesc VARCHAR2(100)
);

CREATE TABLE stNutrientDetail (
   ntdetailcode NUMBER(8) PRIMARY KEY,
   fdcode NUMBER(4) NOT NULL,
   seq NUMBER(4) NOT NULL,
   ntcode NUMBER(4) NOT NULL,
   amount NUMBER(10,3) NOT NULL,
   unit VARCHAR2(20) NOT NULL,
   CONSTRAINT st_uq_Nut_Det UNIQUE (fdcode, seq),
   CONSTRAINT st_fk_NutDet_Food FOREIGN KEY (fdcode)
      REFERENCES stFood (fdcode) ON DELETE CASCADE,
   CONSTRAINT st_fk_NutDet_Nut FOREIGN KEY (ntcode)
      REFERENCES stNutrient (ntcode)
);

CREATE TABLE stIngredient (
   ingcode NUMBER(4) PRIMARY KEY,
   ingname VARCHAR2(40) NOT NULL
);

CREATE TABLE stIngredientDetail (
   ingdetailcode NUMBER(8) PRIMARY KEY,
   fdcode NUMBER(4) NOT NULL,
   seq NUMBER(4) NOT NULL,
   ingcode NUMBER(4) NOT NULL,
   amount NUMBER(10,3) NOT NULL,
   unit VARCHAR2(20) NOT NULL,
   CONSTRAINT st_uq_Ing_Det UNIQUE (fdcode, seq),
   CONSTRAINT st_fk_IngDet_Food FOREIGN KEY (fdcode)
      REFERENCES stFood (fdcode) ON DELETE CASCADE,
   CONSTRAINT st_fk_IngDet_Ing FOREIGN KEY (ingcode)
      REFERENCES stIngredient (ingcode)
);

CREATE TABLE stFoodCategory (
   fccode NUMBER(4) PRIMARY KEY,
   fcname VARCHAR2(40) NOT NULL
);

CREATE TABLE stFoodCategoryDetail (
   fcdetailcode NUMBER(8) PRIMARY KEY,
   fdcode NUMBER(4) NOT NULL,
   seq NUMBER(4) NOT NULL,
   fccode NUMBER(4) NOT NULL,
   CONSTRAINT st_uq_FoodCat_Det UNIQUE (fdcode, seq),
   CONSTRAINT st_fk_FoodCatDet_Food FOREIGN KEY (fdcode)
      REFERENCES stFood (fdcode) ON DELETE CASCADE,
   CONSTRAINT st_fk_FoodCatDet_Cat FOREIGN KEY (fccode)
      REFERENCES stFoodCategory (fccode)
);

CREATE TABLE stCondition (
   cdcode NUMBER(4) PRIMARY KEY,
   cdname VARCHAR2(40) NOT NULL
);

CREATE TABLE stExercise (
   excode NUMBER(4) PRIMARY KEY,
   exname VARCHAR2(40) NOT NULL,
   exvalue NUMBER(3,2) NOT NULL
);

CREATE TABLE stAppUser (
   usercode NUMBER(4) PRIMARY KEY,
   email VARCHAR2(40) NOT NULL,
   password VARCHAR2(255) NOT NULL,
   firstname VARCHAR2(40) NOT NULL,
   lastname VARCHAR2(40) NOT NULL,
   age NUMBER(4) NOT NULL,
   weight NUMBER(4) NOT NULL,
   height NUMBER(4) NOT NULL,
   gender CHAR(1) NOT NULL,
   excode NUMBER(4) NOT NULL,
   CONSTRAINT st_fk_User_Ex FOREIGN KEY (excode)
      REFERENCES stExercise (excode)
);

CREATE TABLE stUserCondition (
   usercode NUMBER(4) NOT NULL,
   cdcode NUMBER(4) NOT NULL,
   CONSTRAINT st_pk_UserCond PRIMARY KEY (usercode, cdcode),
   CONSTRAINT st_fk_UserCond_User FOREIGN KEY (usercode)
      REFERENCES stAppUser (usercode),
   CONSTRAINT st_fk_UserCond_Cond FOREIGN KEY (cdcode)
      REFERENCES stCondition (cdcode)
);

CREATE TABLE stMeal (
   mealcode NUMBER(4) PRIMARY KEY,
   createdate DATE DEFAULT SYSDATE,
   updatedate DATE,
   usercode NUMBER(4) NOT NULL,
   CONSTRAINT st_fk_Meal_User FOREIGN KEY (usercode)
      REFERENCES stAppUser (usercode)
);

CREATE TABLE stMealDetail (
   mealdetailcode NUMBER(8) PRIMARY KEY,
   mealcode NUMBER(4) NOT NULL,
   seq NUMBER(4) NOT NULL,
   fdcode NUMBER(4) NOT NULL,
   CONSTRAINT st_uq_Meal_Det UNIQUE (mealcode, seq),
   CONSTRAINT st_fk_MealDet_Meal FOREIGN KEY (mealcode)
      REFERENCES stMeal (mealcode),
   CONSTRAINT st_fk_MealDet_Food FOREIGN KEY (fdcode)
      REFERENCES stFood (fdcode)
);

CREATE TABLE stFavoriteFood (
   usercode NUMBER(4) NOT NULL,
   fdcode NUMBER(4) NOT NULL,
   orderby NUMBER(4) NOT NULL,
   CONSTRAINT st_pk_Fav_Food PRIMARY KEY (usercode, fdcode),
   CONSTRAINT st_fk_FavFood_User FOREIGN KEY (usercode)
      REFERENCES stAppUser (usercode),
   CONSTRAINT st_fk_FavFood_Food FOREIGN KEY (fdcode)
      REFERENCES stFood (fdcode)
);

CREATE TABLE stFoodAllergy (
   usercode NUMBER(4) NOT NULL,
   ingcode NUMBER(4) NOT NULL,
   CONSTRAINT st_pk_Food_Allergy PRIMARY KEY (usercode, ingcode),
   CONSTRAINT st_fk_FoodAllergy_User FOREIGN KEY (usercode)
      REFERENCES stAppUser (usercode),
   CONSTRAINT st_fk_FoodAllergy_Ing FOREIGN KEY (ingcode)
      REFERENCES stIngredient (ingcode)
);