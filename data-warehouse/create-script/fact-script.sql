-- DailyNutrientFact
create sequence daily_nutrient_fact_seq start with 1 increment by 1 nocache;

create table dailynutrient_fact (
   fact_id        number primary key,
   usercode       number(4) not null,
   date_code      number(4) not null,
   mealcode       number(4) not null,
   ntcode         number(4) not null,
   total_calories number(10,2) not null,
   total_protein  number(10,2) not null,
   total_carbs    number(10,2) not null,
   total_fats     number(10,2) not null,
   meal_count     number(4) not null,
   constraint fk_dncf_user foreign key ( usercode )
      references user_dim ( usercode ),
   constraint fk_dncf_date foreign key ( date_code )
      references date_dim ( date_code ),        
   constraint fk_dncf_meal foreign key ( mealcode )
      references meal_dim ( mealcode ),
   constraint fk_dncf_nutrient foreign key ( ntcode )
      references nutrient_dim ( ntcode )
);

create or replace trigger daily_nutrient_fact_bir before
   insert on dailynutrient_fact
   for each row
begin
   if :new.fact_id is null then
      select daily_nutrient_fact_seq.nextval
        into :new.fact_id
        from dual;
   end if;
end;
/

create sequence food_category_fact_seq start with 1 increment by 1 nocache;

create table foodcategory_fact (
   fact_id         number primary key,
   usercode        number(4) not null, -- FK to UserDim
   date_code       number(4) not null,      -- FK to DateDim
   fccode          number(4) not null, -- FK to FoodCategoryDim
   selection_count number(4) not null,
   constraint fk_fcsef_user foreign key ( usercode )
      references user_dim ( usercode ),
   constraint fk_fcsef_date foreign key ( date_code )
      references date_dim ( date_code ),
   constraint fk_fcsef_fc foreign key ( fccode )
      references foodcategory_dim ( fccode )
);

create or replace trigger food_category_fact_bir before
   insert on foodcategory_fact
   for each row
begin
   if :new.fact_id is null then
      select food_category_fact_seq.nextval
        into :new.fact_id
        from dual;
   end if;
end;
/

create sequence allergy_impact_fact_seq start with 1 increment by 1 nocache;

create table allergyimpact_fact (
   fact_id           number primary key,
   usercode          number(4) not null, -- FK to UserDim
   ingcode           number(4) not null, -- FK to IngredientDim
   cdcode            number(4) not null, -- FK to ConditionDim
   date_code         number(4) not null,      -- FK to DateDim
   consumption_count number(4) not null,
   constraint fk_aif_user foreign key ( usercode )
      references user_dim ( usercode ),
   constraint fk_aif_ing foreign key ( ingcode )
      references ingredient_dim ( ingcode ),
   constraint fk_aif_cd foreign key ( cdcode )
      references condition_dim ( cdcode ),
   constraint fk_aif_date foreign key ( date_code )
      references date_dim ( date_code )
);

create or replace trigger allergy_impact_fact_bir before
   insert on allergyimpact_fact
   for each row
begin
   if :new.fact_id is null then
      select allergy_impact_fact_seq.nextval
        into :new.fact_id
        from dual;
   end if;
end;
/