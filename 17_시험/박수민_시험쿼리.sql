-- 1-1번 문항
select Email, Mobile, Names, Addr 
		from membertbl;


-- 1-2번 문항
select Names, Author, ReleaseDate, Price 
		from bookstbl;


-- 2-1번 문항
select	concat(right(Names,2), ',',LEFT (Names, 1)) as '변경이름',
		levels,
		concat(right(addr,0),left(Addr, 2)) as '도시',
		Lower(email) as '이메일'
	from membertbl;


-- 2-2번 문항
select	Idx,
		concat(N'제목 : ', Names) as Names,
		concat(N'저자 > ',Author) as Author,
		format(ReleaseDate,'yyyy년 MM월 dd일') as '출판일',
		ISBN,
		format(Price, '#,#.원') as '가격'
		from bookstbl
order by Idx desc;


-- 3-1번 문항

SELECT b.Idx as '번호'
	  ,b.Division as '장르번호'
	  ,d.Names as '장르'
	  ,b.Names  as '책제목'
	  ,b.Author as '저자'
	  
  FROM dbo.bookstbl as b
  inner join divtbl as d
	on b.Division = d.Division
  where b.Division = 'B002'


-- 3-2번 문항
SELECT	 m.Names
		,m.Levels
		,m.Addr
		,r.rentalDate

  FROM dbo.membertbl as m
left outer join rentaltbl as r
		on m.Idx = r.memberIdx
		where r.rentalDate is null;


-- 	4-1번 문항
begin tran
insert into divtbl values
			('I002','자기개발서') ;
rollback;
commit;

select * from divtbl;


-- 4-2번 문항
begin tran;
select Addr, Mobile
		from membertbl;
update membertbl
	set Addr = '부산시 해운대구'
	 ,Mobile = '010-6683-7732'
	 where Idx = '26'

rollback;
commit;

select * from membertbl


-- 5번 문항
SELECT d.names as 'names'
	  ,sum(b.price) as '총합계금액'
 from dbo.divtbl as d
  inner join bookstbl as b
 on d.Division = b.Division
 group by rollup(d.Names);


		






