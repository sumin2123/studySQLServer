use tableDB;
go

create table #tempTbl (id int, txt nvarchar(10));
create table ##tempTbl (id int, txt nvarchar(10));
go
insert into #tempTBl values (1, '�����ӽ����̺�');
insert into ##tempTBl values (2, '�����ӽ����̺�');
go

select * from #tempTbl;
select * from ##tempTbl;