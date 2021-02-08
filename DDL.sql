drop database if exists webshopdb;
create database webshopdb;
use webshopdb;
set sql_safe_updates =0;

create table City
(ID int not null auto_increment,
name varchar(50) not null, primary key(ID),
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into City(name,ID) values('Göteborg',100);
insert into City(name) values('Uddevalla');
insert into City(name) values('Iggesund');
insert into City(name) values('Stockholm');


create table Customer
(ID int not null auto_increment,
primary key(ID),
firstName varchar(50) not null,
lastName varchar(50) not null,
address varchar(70) not null,
CityID int,
foreign key(CityID) references City(ID) on delete set null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Customer(firstName,lastName, address,CityID,ID)values ('Cassandra','Larsson','Industrivägen 18',100,200);
insert into Customer(firstName,lastName, address,CityID)values('Amanda','Aronsson','Kaptensgatan 56',101);
insert into Customer(firstName,lastName, address,CityID)values('Andreas','Marklund','Fabriksvägen 45',102);
insert into Customer(firstName,lastName, address,CityID)values('Mimi','Santana','Mariatorget 3',103);
insert into Customer(firstName,lastName, address,CityID)values('Emma','Wikefeldt','Långholmsgatan 4',103);




create table Orders
(ID int not null auto_increment,
primary key(ID),
ordersDate date not null,
CustomerID int,
foreign key(CustomerID) references Customer(ID)on delete set null, -- om kunden skulle raderas ur databasen så fångar vi upp det och FK's värde sätts till null.
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Orders(ordersDate,CustomerID,ID) values('2021-02-05',200,300);
insert into Orders(ordersDate,CustomerID) values('2020-12-05',201);
insert into Orders(ordersDate,CustomerID) values('2021-02-06',202);
insert into Orders(ordersDate,CustomerID) values('2019-04-07',203);
insert into Orders(ordersDate,CustomerID) values('2021-01-27',204);
insert into Orders(ordersDate,CustomerID) values('2021-02-06',202);
insert into Orders(ordersDate,CustomerID) values('2019-04-08',203); 
insert into Orders(ordersDate,CustomerID) values('2021-02-08',202);
insert into Orders(ordersDate,CustomerID) values('2021-02-08',201);
insert into Orders(ordersDate,CustomerID) values('2021-02-08',204);
insert into Orders(ordersDate,CustomerID) values('2021-02-09',203);
insert into Orders(ordersDate,CustomerID) values('2021-02-09',203);
insert into Orders(ordersDate,CustomerID) values('2021-01-09',201);
insert into Orders(ordersDate,CustomerID) values('2021-01-20',201);
insert into Orders(ordersDate,CustomerID) values('2021-01-20',201);
insert into Orders(ordersDate,CustomerID) values('2021-01-20',201);
insert into Orders(ordersDate,CustomerID) values('2021-01-20',204);
insert into Orders(ordersDate,CustomerID) values('2021-01-22',204);
insert into Orders(ordersDate,CustomerID) values('2021-01-23',202);




create table Price
(ID int not null auto_increment,
primary key(ID),
value double not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Price(value,ID) values(3500,400);
insert into Price(value) values(750);
insert into Price(value) values(2400);
insert into Price(value) values(4000);
insert into Price(value) values(700);
insert into Price(value) values(800);
insert into Price(value) values(5000);
insert into Price(value) values(3400);


create table Size
(ID int not null auto_increment,
primary key(ID),
format double not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Size(format,ID) values(42,500);
insert into Size(format) values(38);
insert into Size(format) values(40);
insert into Size(format) values(39);
insert into Size(format) values(38);
insert into Size(format) values(36);


create table Brand
(ID int not null auto_increment,
primary key(ID),
name varchar(50) not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Brand(name,ID) values ('Yeezy',600);
insert into Brand(name) values('Ecco');
insert into Brand(name) values('Balenciaga');
insert into Brand(name) values('Gucci');
insert into Brand(name) values('New Balance');
insert into Brand(name) values('Adidas');
insert into Brand(name) values('Louis Vuitton');
insert into Brand(name) values('Prada');


create table Color
(ID int not null auto_increment,
primary key(ID),
name varchar(50) not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Color(name,ID) values ('Black',700);
insert into Color(name) values('Red');
insert into Color(name) values('White');
insert into Color(name) values('Gray');
insert into Color(name) values('Brown');


create table Shoe
(ID int not null auto_increment,
primary key(ID),
BrandID int not null,
foreign key(BrandID) references Brand(ID)on delete cascade, --  delete cascade Motivation : Om Kanye West inte vill att hans skomärke Yeezy inte ska säljas mer till några återförsäljare tas alla hans Yeezy skor bort.
SizeID int not null,
foreign key(SizeID) references Size(ID),
PriceID int not null,
foreign key(PriceID) references Price(ID),
name varchar(50) not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Shoe(BrandID,SizeID,PriceID,name,ID) values(600,500,400,'Boozt 3000',900);
insert into Shoe(BrandID,SizeID,PriceID,name) values(601,501,401,'Ergonomics');
insert into Shoe(BrandID,SizeID,PriceID,name) values(602,502,402,'XTR');
insert into Shoe(BrandID,SizeID,PriceID,name) values(603,502,403,'Rhyton');
insert into Shoe(BrandID,SizeID,PriceID,name) values(604,500,404,'200X');
insert into Shoe(BrandID,SizeID,PriceID,name) values(605,503,405,'Boozt');
insert into Shoe(BrandID,SizeID,PriceID,name) values(606,503,406,'Alma');
insert into Shoe(BrandID,SizeID,PriceID,name) values(607,501,407,'Devils Claw');


create table Contains
(ID int not null auto_increment,
primary key(ID),
ShoeID int not null,
foreign key(ShoeID) references Shoe(ID),
OrdersID int not null,
foreign key(OrdersID) references Orders(ID),
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Contains(ShoeID,OrdersID,ID) values(901,300,1200);
insert into Contains(ShoeID,OrdersID) values(902,301);
insert into Contains(ShoeID,OrdersID) values(900,302);
insert into Contains(ShoeID,OrdersID) values(904,302);
insert into Contains(ShoeID,OrdersID) values(906,303);
insert into Contains(ShoeID,OrdersID) values(903,303);
insert into Contains(ShoeID,OrdersID) values(907,304);
insert into Contains(ShoeID,OrdersID) values(905,304);
insert into Contains(ShoeID,OrdersID) values(905,305);
insert into Contains(ShoeID,OrdersID) values(905,306);
insert into Contains(ShoeID,OrdersID) values(905,307);
insert into Contains(ShoeID,OrdersID) values(905,308);
insert into Contains(ShoeID,OrdersID) values(905,309);
insert into Contains(ShoeID,OrdersID) values(904,310);
insert into Contains(ShoeID,OrdersID) values(904,311);
insert into Contains(ShoeID,OrdersID) values(904,312);
insert into Contains(ShoeID,OrdersID) values(904,313);
insert into Contains(ShoeID,OrdersID) values(902,314);
insert into Contains(ShoeID,OrdersID) values(902,315);
insert into Contains(ShoeID,OrdersID) values(902,316);
insert into Contains(ShoeID,OrdersID) values(905,317);
insert into Contains(ShoeID,OrdersID) values(906,318);
insert into Contains(ShoeID,OrdersID) values(900,319);




create table Category
(ID int not null auto_increment,
primary key(ID),
name varchar(50) not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Category(name,ID) values('Sandals',800);
insert into Category(name) values('Sneakers');
insert into Category(name) values('Boots');
insert into Category(name) values('Women');
insert into Category(name) values('Children');
insert into Category(name) values('Men');


create table BelongsTo
(ID int not null auto_increment,
primary key(ID),
CategoryID int not null,
foreign key(CategoryID) references Category(ID),
ShoeID int not null,
foreign key(ShoeID) references Shoe(ID),
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into BelongsTo(CategoryID,ShoeID,ID) values(801,900,1100);
insert into BelongsTo(CategoryID,ShoeID) values(805,900);
insert into BelongsTo(CategoryID,ShoeID) values(800,901);
insert into BelongsTo(CategoryID,ShoeID) values(802,902);
insert into BelongsTo(CategoryID,ShoeID) values(803,902);
insert into BelongsTo(CategoryID,ShoeID) values(801,903);
insert into BelongsTo(CategoryID,ShoeID) values(803,903);
insert into BelongsTo(CategoryID,ShoeID) values(801,904);
insert into BelongsTo(CategoryID,ShoeID) values(805,904);
insert into BelongsTo(CategoryID,ShoeID) values(801,905);
insert into BelongsTo(CategoryID,ShoeID) values(804,905);
insert into BelongsTo(CategoryID,ShoeID) values(802,906);
insert into BelongsTo(CategoryID,ShoeID) values(803,906);
insert into BelongsTo(CategoryID,ShoeID) values(802,907);
insert into BelongsTo(CategoryID,ShoeID) values(803,907);


create table Has
(ID int not null auto_increment,
primary key(ID),
ShoeID int not null,
foreign key(ShoeID) references Shoe(ID),
ColorID int not null,
foreign key(ColorID) references Color(ID),
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Has(ShoeID,ColorID,ID) values(900,700,1000);
insert into Has(ShoeID,ColorID) values(900,701);
insert into Has(ShoeID,ColorID) values(901,700);
insert into Has(ShoeID,ColorID) values(902,700);
insert into Has(ShoeID,ColorID) values(902,702);
insert into Has(ShoeID,ColorID) values(903,702);
insert into Has(ShoeID,ColorID) values(903,701);
insert into Has(ShoeID,ColorID) values(904,703);
insert into Has(ShoeID,ColorID) values(905,700);
insert into Has(ShoeID,ColorID) values(906,704);
insert into Has(ShoeID,ColorID) values(907,701);


create table Rating
(ID int not null auto_increment,
primary key(ID),
ratingOption varchar(70) not null,
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);

insert into Rating(ratingOption,ID) values('Very satisfied',1300);
insert into Rating(ratingOption) values('Satisfied');
insert into Rating(ratingOption) values('OK');
insert into Rating(ratingOption) values('Bad experience');


create table Review
(ID int not null auto_increment,
primary key(ID),
customerOpinion varchar(100) not null,
reviewDate date not null,
ShoeID int not null,
foreign key(ShoeID) references Shoe(ID),
CustomerID int not null,
foreign key(CustomerID) references Customer(ID),
RatingID int not null,
foreign key(RatingID) references Rating(ID),
Created timestamp default current_timestamp,
lastUpdated timestamp default current_timestamp);
insert into Review(customerOpinion,reviewDate,ShoeID,CustomerID,RatingID,ID) 
values('Very happy with my shoes! they taste so good, YUM!','2021-02-07',900,202,1300,1400);
insert into Review(customerOpinion,reviewDate,ShoeID,CustomerID,RatingID)values('My shoes smells like onions.. will not order again','2021-02-07',906,203,1303);

create index index_CityName on City(name);
create index index_BrandName on Brand(name);

