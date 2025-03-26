create table dimuser (
   usercode  number(4) primary key,
   firstname varchar2(40) not null,
   lastname  varchar2(40) not null,
   email     varchar2(40) not null,
   gender    char(1) not null,
   age       number(4) not null,
   weight    number(4) not null,
   height    number(4) not null,
   excode    number(4) not null,
   condition varchar2(255),
   constraint fk_dimuser_exercise foreign key ( excode )
      references dimexercise ( excode )
);

create table dimfood_foodcategory (
   fdcode number(8) not null,
   fccode number(4) not null,
   primary key ( fdcode,
                 fccode ),
   constraint fk_fd_food foreign key ( fdcode )
      references dimfood ( fdcode ),
   constraint fk_fc_category foreign key ( fccode )
      references dimfoodcategory ( fccode )
);


create table dimfood (
   fdcode   number(4) primary key,
   fdtname  varchar2(40) not null,
   fdename  varchar2(40),
   imageurl varchar2(100),
   fooddesc varchar2(255),
   fccode   number(4) not null,
   constraint fk_dimfood_category foreign key ( fccode )
      references dimfoodcategory ( fccode )
);

create table dimnutrient (
   ntcode     number(4) primary key,
   ntname     varchar2(40) not null,
   nttypecode number(4),
   constraint fk_dimnutrient_type foreign key ( nttypecode )
      references dimnutrienttype ( nttypecode )
);

create table dimingredient (
   ingcode number(4) primary key,
   ingname varchar2(40) not null
);

create table dimfoodcategory (
   fccode number(4) primary key,
   fcname varchar2(40) not null
);

create table dimexercise (
   excode  number(4) primary key,
   exname  varchar2(40) not null,
   exvalue number(3,2) not null
);

create table dimdate (
   date_id    number(8) primary key,
   date_value date not null,
   year       number(4) not null,
   month      number(2) not null,
   day        number(2) not null,
   weekday    varchar2(10) not null,
   quarter    number(1) not null
);

create table dimnutrienttype (
   nttypecode number(4) primary key,
   nttypename varchar2(40) not null
);

create table dimcondition (
   cdcode number(4) primary key,
   cdname varchar2(40) not null
);

create table dimusercondition (
   usercode number(4) not null,
   cdcode   number(4) not null,
   primary key ( usercode,
                 cdcode ),
   constraint fk_uc_user foreign key ( usercode )
      references dimuser ( usercode ),
   constraint fk_uc_con foreign key ( cdcode )
      references dimcondition ( cdcode )
);