-- Table: nutrienttype
create table nutrienttype (
   nttypecode int AUTO_INCREMENT primary key,
   nttypename varchar(40) not null
);

-- Table: nutrient
create table nutrient (
   ntcode     int AUTO_INCREMENT primary key,
   ntname     varchar(40) not null,
   nttypecode int,
   constraint fk_nutrient_nutrienttype foreign key ( nttypecode )
      references nutrienttype ( nttypecode ) ON DELETE SET NULL
);

-- Table: food
create table food (
   fdcode   int AUTO_INCREMENT primary key,
   fdtname  varchar(40) not null,
   fdename  varchar(40),
   imageurl varchar(500),
   fooddesc varchar(100)
);

-- Table: nutrientdetail
create table nutrientdetail (
   ntdetailcode int AUTO_INCREMENT primary key,
   fdcode       int not null,
   seq          int not null,
   ntcode       int not null,
   amount       decimal(10,3) not null,
   unit         varchar(20) not null,
   constraint uq_nutrientdetail unique ( fdcode, seq ),
   constraint fk_nutrientdetail_food foreign key ( fdcode )
      references food ( fdcode ) ON DELETE CASCADE,
   constraint fk_nutrientdetail_nutrient foreign key ( ntcode )
      references nutrient ( ntcode ) ON DELETE CASCADE
);

-- Table: ingredient
create table ingredient (
   ingcode int AUTO_INCREMENT primary key,
   ingname varchar(40) not null
);

-- Table: ingredientdetail
create table ingredientdetail (
   ingdetailcode int AUTO_INCREMENT primary key,
   fdcode        int not null,
   seq           int not null,
   ingcode       int not null,
   amount        decimal(10,3) not null,
   unit          varchar(20) not null,
   constraint uq_ingredientdetail unique ( fdcode, seq ),
   constraint fk_ingredientdetail_food foreign key ( fdcode )
      references food ( fdcode ) ON DELETE CASCADE,
   constraint fk_ingredientdetail_ingredient foreign key ( ingcode )
      references ingredient ( ingcode ) ON DELETE CASCADE
);

-- Table: foodcategory
create table foodcategory (
   fccode int AUTO_INCREMENT primary key,
   fcname varchar(40) not null
);

-- Table: foodcategorydetail
create table foodcategorydetail (
   fcdetailcode int AUTO_INCREMENT primary key,
   fdcode       int not null,
   seq          int not null,
   fccode       int not null,
   constraint uq_foodcategorydetail unique ( fdcode, seq ),
   constraint fk_foodcategorydetail_food foreign key ( fdcode )
      references food ( fdcode ) ON DELETE CASCADE,
   constraint fk_foodcategorydetail_fc foreign key ( fccode )
      references foodcategory ( fccode ) ON DELETE CASCADE
);

-- Table: chronicdisease (renamed from "condition")
create table chronicdisease (
   cdcode int AUTO_INCREMENT primary key,
   cdname varchar(40) not null
);

-- Table: exercise
create table exercise (
   excode  int AUTO_INCREMENT primary key,
   exname  varchar(40) not null,
   exvalue decimal(3,2) not null
);

-- Table: appuser
create table appuser (
   usercode  int AUTO_INCREMENT primary key,
   email     varchar(100) not null unique,
   password  varchar(255) not null,
   firstname varchar(40) not null,
   lastname  varchar(40) not null,
   age       int not null,
   weight    int not null,
   height    int not null,
   gender    char(1) not null,
   excode    int not null,
   constraint fk_appuser_exercise foreign key ( excode )
      references exercise ( excode ) ON DELETE CASCADE
);

-- Table: usercondition
create table usercondition (
   usercode int not null,
   cdcode   int not null,
   primary key ( usercode, cdcode ),
   constraint fk_usercondition_appuser foreign key ( usercode )
      references appuser ( usercode ) ON DELETE CASCADE,
   constraint fk_usercondition_chronicdisease foreign key ( cdcode )
      references chronicdisease ( cdcode ) ON DELETE CASCADE
);

-- Table: meal
create table meal (
   mealcode   int AUTO_INCREMENT primary key,
   createdate timestamp default current_timestamp,
   updatedate timestamp,
   usercode   int not null,
   constraint fk_meal_appuser foreign key ( usercode )
      references appuser ( usercode ) ON DELETE CASCADE
);

-- Table: mealdetail
create table mealdetail (
   mealdetailcode int AUTO_INCREMENT primary key,
   mealcode       int not null,
   seq            int not null,
   fdcode         int not null,
   constraint uq_mealdetail unique ( mealcode, seq ),
   constraint fk_mealdetail_meal foreign key ( mealcode )
      references meal ( mealcode ) ON DELETE CASCADE,
   constraint fk_mealdetail_food foreign key ( fdcode )
      references food ( fdcode ) ON DELETE CASCADE
);

-- Table: favoritefood
create table favoritefood (
   usercode int not null,
   fdcode   int not null,
   orderby  int not null,
   primary key ( usercode, fdcode ),
   constraint fk_favoritefood_appuser foreign key ( usercode )
      references appuser ( usercode ) ON DELETE CASCADE,
   constraint fk_favoritefood_food foreign key ( fdcode )
      references food ( fdcode ) ON DELETE CASCADE
);

-- Table: foodallergy
create table foodallergy (
   usercode int not null,
   ingcode  int not null,
   primary key ( usercode, ingcode ),
   constraint fk_foodallergy_appuser foreign key ( usercode )
      references appuser ( usercode ) ON DELETE CASCADE,
   constraint fk_foodallergy_ingredient foreign key ( ingcode )
      references ingredient ( ingcode ) ON DELETE CASCADE
);
