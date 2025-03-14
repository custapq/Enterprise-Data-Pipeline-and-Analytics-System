-- UserDim
create table user_dim (
   usercode  number(4) primary key,
   email     varchar2(40) not null,
   firstname varchar2(40) not null,
   lastname  varchar2(40) not null,
   age       number(4) not null,
   gender    char(1) not null,
   weight    number(4) not null,
   height    number(4) not null,
   excode    number(4) not null
);

-- DateDim
create table date_dim (
   date_code number(4) primary key,
   date_time date not null
);

-- MealDim
create table meal_dim (
   mealcode  number(4) primary key,
   meal_type varchar2(20) not null
);

-- NutrientDim
create table nutrient_dim (
   ntcode     number(4) primary key,
   ntname     varchar2(40) not null,
   nttypecode number(4) not null
);
-- FoodCategoryDim
create table foodcategory_dim (
   fccode number(4) primary key,
   fcname varchar2(40) not null
);
-- IngredientDim
create table ingredient_dim (
   ingcode number(4) primary key,
   ingname varchar2(40) not null
);

-- ConditionDim
create table condition_dim (
   cdcode number(4) primary key,
   cdname varchar2(40) not null
);