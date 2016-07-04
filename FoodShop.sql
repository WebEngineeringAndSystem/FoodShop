select * from users

drop table users

--�ͻ������ע���û��Ļ�����Ϣ���û�ID���û��������룬�����ʼ���
create table users(
usersId int identity(1000,1) primary key,
usersName varchar(40) not null,
usersPass varchar(40) not null,
usersE_mail varchar(40) not null,
)

insert into users values('b','b','b')

delete from users where usersId=0

--��Ʒ������Ų�Ʒ������Ϣ����Ʒ���ID����Ʒ������ƣ�
create table sort(
sortId  int,
sortName  varchar(40) not null primary key,
)

--������Ʒ���������ʳ��Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���װ���ص㣬�۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ�������)
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

--���̱�����ṩ��Ʒ�ĳ��̵���Ϣ���������̵�ID���������̵����ƣ�
create table produce(
produceId int primary key not null,
produceName varchar(40) not null,
)

--���̲�Ʒ��ϸ����ų����ṩ����Ʒ����ϸ��Ϣ������ID���������̵����ƣ���Ʒ���ID���ʻ�ID��
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


--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(101,'��̫��')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(11,'��ˡ�����')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���װ���ص㣬�۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(1001,'�����Ź�','���Ź�','����','����',49.0,'14��û�ִ���һԪ���������´ι��','�����и�������Ҫ����������','����|party|��ʳ','�ϼ�','��ˡ�����')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(101,'��̫��',11,1001)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(102,'��̫��')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(12,'����')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(1002,'������','���㡢�켦�⡢��Ģ��','����','����',59.0,'15��ÿ�ִ���һԪ���������´ι��','�����и�����������ȫ�������г���','�緹|�з�|��','�ϼ�','����')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(102,'��̫��',12,1002)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(301,'����508')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(31,'��ɫ��')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(3001,'��ץ��','����','���','���㣬�Ͷ�����',59.0,'15��ÿ�ִ���һԪ���������´ι��','���״�','���־ۻ�','�ϼ�','��ɫ��')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(301,'����508',31,3001)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(302,'����508')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(32,'³��')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(3002,'��ϲ����','�廨��','��ը','Ԣ����������»���١�ϲ',59.0,'15��ÿ�ִ���һԪ���������´ι��','���״�','ϲ��|����|�ȸ�����ϯ','�ϼ�','³��')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(302,'����508',32,3002)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(303,'����508')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(33,'���ڲ�ϵ')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(3003,'�����Ź�','���ס��Ź�','����','���д���',39.0,'10��ÿ�ִ���һԪ���������´ι��','������У��','ϲ��|����|�ȸ�����ϯ','�ϼ�','���ڲ�')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(303,'����508',33,3003)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(401,'����509')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(41,'�Ȳˡ������ϵ')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(4001,'������','��Ƥ�廨�⣬���ǣ������','����','���𡢷ʶ�����',39.0,'8��ÿ�ִ���һԪ���������´ι��','ֻ��������԰����','��ʳ�����˲���','�ϼ�','�Ȳˡ������ϵ')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(401,'����509',41,4001)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(304,'����509')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(34,'����ϵ')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(3004,'���Ŷ���','��������ĩ','��ը','�顢�����̡���',19.0,'6��ÿ�ִ���һԪ���������´ι��','ֻ�����뺣������','�κ�ʱ��','ȱ��','����ϵ')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(304,'����509',34,3004)

--�ڳ��̱�����ӻ�����Ϣ������ID���������̵����ƣ�
insert into produce values(402,'����509')
--�ڲ�Ʒ��������ӻ�����Ϣ����Ʒ���ID����Ʒ������ƣ�
insert into sort values(42,'�ϱ���')
--����Ʒ�������һЩ��Ʒ�Ļ�����Ϣ(��ƷID����Ʒ���ƣ���Ʒ���ϣ���ζ���۸���Ʒ���֣����ͷ�Χ��ʹ�ó��ϣ���Ʒ״̬����Ʒ���)
insert into goods values(4002,'������Ѽ','������Ѽ','�տ�','����ϸ�塢ζ������',69.0,'16��ÿ�ִ���һԪ���������´ι��','ȫ���磡','���ٽ���','�ϼ�','�ϱ���')
--�ڳ��̲�Ʒ������ӻ�����Ϣ������ID���������̵����ƣ���Ʒ���ID����ƷID��
insert into produceDetails values(402,'����509',42,4002)


select * from goods

--drop table orders
--drop table ordersDetails

--������������Ŷ�������Ϣ������ID���û������ܼ�ֵ���������ڣ�
create table orders(
ordersId int identity(1000,1) primary key,
usersName varchar(40) not null,
ordersPrice float not null,
ordersDatetime datetime not null)



--����������ϸ����Ŷ�������ϸ��ϸ��Ϣ������ID����ƷID����Ʒ�۸񣬶�������Ʒ������
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

--�洢�������
--������Pro_orders(���룺usersName��ordersPrice��goodsCount))(�����ordersId)(������:Orders)(������Insert��select)
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