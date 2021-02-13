use sqlDB;
go

select RANK() over(partition by addr order by height desc) as 'Űū����',
	   userName, addr, height 
  from userTBL;

-- PIVOT
/*
create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTBL values ('�����', '�ܿ�', 10),
							('������', '����', 15),
							('�����', '����', 25),
							('�����', '��', 3),
							('�����', '��', 37),
							('������', '�ܿ�', 40),
							('�����', '����', 14),
							('�����', '�ܿ�', 22),
							('������', '����', 64);
go
*/

insert into pivotTBL values ('���ð�', '����', 30);
select * from pivotTBL;

select * from pivotTBL
  pivot (sum(amount) 
         for season
		 in ([��], [����], [����], [�ܿ�])) as resultPivot;

-- json
select userID, userName, addr, height
  from userTBL
 where height >= 180
   for json auto;