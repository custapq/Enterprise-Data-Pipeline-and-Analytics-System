CREATE TABLE factmealconsumption (
   mealdetailcode  NUMBER(8) PRIMARY KEY,
   mealcode        NUMBER(4) NOT NULL,
   usercode        NUMBER(4) NOT NULL,
   fdcode          NUMBER(4) NOT NULL,
   date_id         NUMBER(8) NOT NULL,
   total_calories  NUMBER(10,2),
   total_nutrients NUMBER(10,2),
   meal_type       VARCHAR2(20) NOT NULL,
   CONSTRAINT fk_factmeal_user FOREIGN KEY ( usercode )
      REFERENCES dimuser ( usercode ),
   CONSTRAINT fk_factmeal_food FOREIGN KEY ( fdcode )
      REFERENCES dimfood ( fdcode ),
   CONSTRAINT fk_factmeal_date FOREIGN KEY ( date_id )
      REFERENCES dimdate ( date_id )
);


CREATE TABLE factnutrientconsumption (
   factnut_id     NUMBER(8) PRIMARY KEY, 
   usercode       NUMBER(4) NOT NULL,
   fdcode         NUMBER(4) NOT NULL,
   date_id        NUMBER(8) NOT NULL,
   ntcode         NUMBER(4) NOT NULL,
   amount         NUMBER(10,3) NOT NULL,
   unit           VARCHAR2(20) NOT NULL,
   CONSTRAINT fk_factnut_user FOREIGN KEY (usercode)
      REFERENCES dimuser (usercode),
   CONSTRAINT fk_factnut_food FOREIGN KEY (fdcode)
      REFERENCES dimfood (fdcode),
   CONSTRAINT fk_factnut_date FOREIGN KEY (date_id)
      REFERENCES dimdate (date_id),
   CONSTRAINT fk_factnut_nutrient FOREIGN KEY (ntcode)
      REFERENCES dimnutrient (ntcode)
);


create table factuserhealth (
   usercode                number(4) primary key,
   age                     number(4) not null,
   weight                  number(4) not null,
   height                  number(4) not null,
   bmi                     number(5,2) not null,
   excode                  number(4) not null,
   total_calories_needed   number(10,2) not null,
   total_calories_consumed number(10,2) not null,
   constraint fk_facthealth_user foreign key ( usercode )
      references dimuser ( usercode ),
   constraint fk_facthealth_exercise foreign key ( excode )
      references dimexercise ( excode )
);

create table factfavoritefood (
   usercode   number(4) not null,
   fdcode     number(4) not null,
   order_rank number(4) not null,
   primary key ( usercode,
                 fdcode ),
   constraint fk_factfav_user foreign key ( usercode )
      references dimuser ( usercode ),
   constraint fk_factfav_food foreign key ( fdcode )
      references dimfood ( fdcode )
);