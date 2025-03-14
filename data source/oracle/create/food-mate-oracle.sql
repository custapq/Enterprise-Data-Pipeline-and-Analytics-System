create table nutrienttype (
   nttypecode number(4) primary key,
   nttypename varchar2(40) not null
);

create table nutrient (
   ntcode     number(4) primary key,
   ntname     varchar2(40) not null,
   nttypecode number(4),
   constraint fk_nutrient_nutrienttype foreign key ( nttypecode )
      references nutrienttype ( nttypecode )
);

create table food (
   fdcode   number(4) primary key,
   fdtname  varchar2(40) not null,
   fdename  varchar2(40),
   imageurl varchar2(100),
   fooddesc varchar2(100)
);

create table nutrientdetail (
   ntdetailcode number(8) primary key,
   fdcode       number(4) not null,
   seq          number(4) not null,
   ntcode       number(4) not null,
   amount       number(10,3) not null,
   unit         varchar2(20) not null,
   constraint uq_nutrientdetail unique ( fdcode,
                                         seq ),
   constraint fk_nutrientdetail_food foreign key ( fdcode )
      references food ( fdcode )
         on delete cascade,
   constraint fk_nutrientdetail_nutrient foreign key ( ntcode )
      references nutrient ( ntcode )
);

create table ingredient (
   ingcode number(4) primary key,
   ingname varchar2(40) not null
);

create table ingredientdetail (
   ingdetailcode number(8) primary key,
   fdcode        number(4) not null,
   seq           number(4) not null,
   ingcode       number(4) not null,
   amount        number(10,3) not null,
   unit          varchar2(20) not null,
   constraint uq_ingredientdetail unique ( fdcode,
                                           seq ),
   constraint fk_ingredientdetail_food foreign key ( fdcode )
      references food ( fdcode )
         on delete cascade,
   constraint fk_ingredientdetail_ingredient foreign key ( ingcode )
      references ingredient ( ingcode )
);

create table foodcategory (
   fccode number(4) primary key,
   fcname varchar2(40) not null
);

create table foodcategorydetail (
   fcdetailcode number(8),
   fdcode       number(4) not null,
   seq          number(4) not null,
   fccode       number(4) not null,
   constraint pk_foodcategorydetail primary key ( fcdetailcode ), -- แยก Primary Key ออกมา
   constraint uq_foodcategorydetail unique ( fdcode,
                                             seq ),
   constraint fk_foodcategorydetail_food foreign key ( fdcode )
      references food ( fdcode )
         on delete cascade,
   constraint fk_foodcategorydetail_fc foreign key ( fccode )
      references foodcategory ( fccode )
);


create table condition (
   cdcode number(4) primary key,
   cdname varchar2(40) not null
);

create table exercise (
   excode  number(4) primary key,
   exname  varchar2(40) not null,
   exvalue number(3,2) not null
);

create table appuser (
   usercode  number(4) primary key,
   email     varchar2(40) not null,
   password  varchar2(255) not null,
   firstname varchar2(40) not null,
   lastname  varchar2(40) not null,
   age       number(4) not null,
   weight    number(4) not null,
   height    number(4) not null,
   gender    char(1) not null,
   excode    number(4) not null,
   constraint fk_appuser_exercise foreign key ( excode )
      references exercise ( excode )
);

create table usercondition (
   usercode number(4) not null,
   cdcode   number(4) not null,
   constraint pk_usercondition primary key ( usercode,
                                             cdcode ),
   constraint fk_usercondition_appuser foreign key ( usercode )
      references appuser ( usercode ),
   constraint fk_usercondition_condition foreign key ( cdcode )
      references condition ( cdcode )
);

create table meal (
   mealcode   number(4) primary key,
   createdate date default sysdate,
   updatedate date,
   usercode   number(4) not null,
    constraint fk_meal_appuser foreign key ( usercode )references appuser ( usercode )
);

create table mealdetail (
   mealdetailcode number(8) primary key,
   mealcode       number(4) not null,
   seq            number(4) not null,
   fdcode         number(4) not null,
   constraint uq_mealdetail unique ( mealcode,
                                     seq ),
   constraint fk_mealdetail_meal foreign key ( mealcode )
      references meal ( mealcode ),
   constraint fk_mealdetail_food foreign key ( fdcode )
      references food ( fdcode )
);

create table favoritefood (
   usercode number(4) not null,
   fdcode   number(4) not null,
   orderby  number(4) not null,
   constraint pk_favoritefood primary key ( usercode,
                                            fdcode ),
   constraint fk_favoritefood_appuser foreign key ( usercode )
      references appuser ( usercode ),
   constraint fk_favoritefood_food foreign key ( fdcode )
      references food ( fdcode )
);

create table foodallergy (
   usercode number(4) not null,
   ingcode  number(4) not null,
   constraint pk_foodallergy primary key ( usercode,
                                           ingcode ),
   constraint fk_foodallergy_appuser foreign key ( usercode )
      references appuser ( usercode ),
   constraint fk_foodallergy_ingredient foreign key ( ingcode )
      references ingredient ( ingcode )
);