select * from users

drop table users

--客户表，存放注册用户的基本信息（用户ID，用户名，密码，电子邮件）
create table users(
usersId int identity(1000,1) primary key,
usersName varchar(40) not null,
usersPass varchar(40) not null,
usersE_mail varchar(40) not null,
)

insert into users values('b','b','b')

delete from users where usersId=0

--产品类别表，存放产品类别的信息（产品类别ID，商品类别名称）
create table sort(
sortId  int,
sortName  varchar(40) not null primary key,
)

--创建商品表，存放现有食物的基本信息(商品ID，商品名称，商品材料，包装，特点，价格，商品积分，配送范围，使用场合，商品状态，商品类别名称)
create table goods(
goodId int not null primary key,
goodsName varchar(40) not null,
goodsmaterial varchar(40) not null,
goodsPackage varchar(40) not null,
goodsLanguage varchar(40) not null,
goodsPrice float,
goodsCent varchar(40) not null,
goodsScope varchar(40) not null,
goodsPlace varchar(40) not null,
goodsHabitus varchar(40) not null,
sortName  varchar(40) not null,
foreign key(sortName) references sort(sortName)
)

--厂商表，存放提供产品的厂商的信息（供货厂商的ID，供货厂商的名称）
create table produce(
produceId int primary key not null,
produceName varchar(40) not null,
)

--厂商产品明细表，存放厂商提供的商品的详细信息（厂商ID，供货厂商的名称，产品类别ID，鲜花ID）
create table produceDetails(
produceId int not null,
produceName varchar(40) not null,
sortId int not null,
goodsId int not null,
foreign key(goodsId) references goods(goodId),
foreign key(produceId) references produce(produceId)
)

--drop table goods
--drop table produce
--drop table produceDetails
--drop table sort


--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(101,'红太阳')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(11,'湘菜、川菜')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，包装，特点，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(1001,'红烧排骨','猪排骨','红烧','咸香',49.0,'14（没分代表一元，可用于下次购物）','西安市各区，主要配送与西电','生日|party|主食','上架','湘菜、川菜')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(101,'红太阳',11,1001)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(102,'红太阳')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(12,'川菜')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(1002,'红烧鱼','鲤鱼、熟鸡肉、鲜蘑菇','红烧','咸香',59.0,'15（每分代表一元，可用于下次购物）','西安市各区，配送于全国各大中城市','早饭|中饭|晚饭','上架','川菜')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(102,'红太阳',12,1002)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(301,'海棠508')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(31,'特色菜')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(3001,'手抓肉','羊肉','烹饪','咸香，油而不腻',59.0,'15（每分代表一元，可用于下次购物）','北雷村','各种聚会','上架','特色菜')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(301,'海棠508',31,3001)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(302,'海棠508')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(32,'鲁菜')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(3002,'四喜丸子','五花肉','蒸炸','寓意人生福、禄、寿、喜',59.0,'15（每分代表一元，可用于下次购物）','南雷村','喜宴|寿宴|等各种宴席','上架','鲁菜')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(302,'海棠508',32,3002)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(303,'海棠508')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(33,'大众菜系')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(3003,'玉米排骨','玉米、排骨','清蒸','甜中带咸',39.0,'10（每分代表一元，可用于下次购物）','西电老校区','喜宴|寿宴|等各种宴席','上架','大众菜')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(303,'海棠508',33,3003)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(401,'海棠509')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(41,'热菜、各大菜系')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(4001,'红烧肉','带皮五花肉，白糖，生抽等','红烧','香甜、肥而不腻',39.0,'8（每分代表一元，可用于下次购物）','只配送与竹园区域','主食，吃了不胖','上架','热菜、各大菜系')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(401,'海棠509',41,4001)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(304,'海棠509')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(34,'川菜系')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(3004,'麻婆豆腐','豆腐、肉末','油炸','麻、辣、烫、咸',19.0,'6（每分代表一元，可用于下次购物）','只配送与海棠区域','任何时候','缺货','川菜系')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(304,'海棠509',34,3004)

--在厂商表中添加基本信息（厂商ID，供货厂商的名称）
insert into produce values(402,'海棠509')
--在产品类别表中添加基本信息（产品类别ID，商品类别名称）
insert into sort values(42,'老北京')
--在商品表中添加一些商品的基本信息(商品ID，商品名称，商品材料，口味，价格，商品积分，配送范围，使用场合，商品状态，商品类别)
insert into goods values(4002,'北京烤鸭','北京填鸭','烧烤','肉质细腻、味道醇厚',69.0,'16（每分代表一元，可用于下次购物）','全世界！','老少皆宜','上架','老北京')
--在厂商产品表中添加基本信息（厂商ID，供货厂商的名称，产品类别ID，商品ID）
insert into produceDetails values(402,'海棠509',42,4002)


select * from goods

--drop table orders
--drop table ordersDetails

--创建订单表，存放订单的信息（订单ID，用户名，总价值，订单日期）
create table orders(
ordersId int identity(1000,1) primary key,
usersName varchar(40) not null,
ordersPrice float not null,
ordersDatetime datetime not null)



--创建订单明细表，存放订单的详细明细信息（订单ID，商品ID，商品价格，订单中商品数量）
create table ordersDetails(
ordersId int not null,
goodsName varchar(40) not null,
goodsPrice float not null,
goodsCount int not null,
foreign key(ordersId) references orders(ordersId)
)


insert into orders values('asd',213.2,'2011-03-25')
select * from orders
insert into ordersDetails(ordersId,goodsName,goodsPrice,goodsCount) values (1000,'dasd',21.3,3)

--存储过程设计
--过程名Pro_orders(输入：usersName、ordersPrice、goodsCount))(输出：ordersId)(依赖表:Orders)(事务处理：Insert，select)
create proc Pro_orders(
@usersName varchar(40),
@ordersPrice float,
@ordersDatetime datetime,
@ordersId int output)
as 
begin 
insert into orders(usersName,ordersPrice,ordersDatetime) values (@usersName,@ordersPrice,@ordersDatetime)
select @ordersId=ordersId from orders
end;

drop proc Pro_orders

--as insert into orders values (@usersName,@ordersPrice,@ordersDatetime)
/*as select @ordersId = ordersId from orders where usersName = @usersName and ordersprice = @ordersPrice and ordersDatetime=@ordersDatetime;
go
declare @usersName varchar(40),
		@ordersPrice float,
		@ordersId int out;*/