/* 실제 회원정보 불러오기 레벨 거꾸로, 이름순 */
select memberID, memberName, levels, mobile, email
	from memberTBL
 where levels <> 's' --levels 's'로 설정한 회원 제외하기 ( ex, 직원제외)
order by levels asc, memberName asc;




/* 책 정보 */
select cateIdx, bookName, author,
	   interpreter, company, price
	from booksTBL
  order by price desc;




/* 시스템 함수 사용 쿼리 */
select memberID,
	   concat(right(memberName,2), ',', left (memberName, 1)) as '미국식 이름',
	   dbo.ufn_getLevel(levels) as '회원레벨',
	   mobile,
	   UPPER(email) AS '이메일' -- 이메일을 전부 대문자로 변경 / 단, 열이름이 없어짐
	from memberTBL
  where levels <> 's'
order by levels, memberName;




/* 책 정보, 시스템 함수, 포맷 함수 쿼리 */

SELECT bookIdx
      ,cateIdx
      ,concat(N'책 제목>', bookName) as bookName
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가'
      ,company
      ,format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      ,ISBM
      ,format(price, '#,#.원') as 가격
      ,descriptions
      ,format(regDate, 'yyyy년 MM월 dd일') as '업데이트'
  FROM dbo.booksTBL



  /* 책 정보 조인 */

  SELECT b.bookIdx
	--	,b.cateIdx
		,c.cateName
		,b.bookName
		,b.author
		,b.interpreter
		,b.company
  FROM dbo.booksTBL as b
  inner join cateTBL as c
	on b.cateIdx = c.cateIdx;



	/* 대여된 책의 정보 쿼리 조인 */

	-- 대여상태 등록 및 대여일, 반납입과 상태 변경
	
	select r.rentalIdx
		  ,r.memberIdx
		  ,r.bookIdx
		  ,format(r.rentalDt,'yyyy-MM-dd') as '대여일'
		  ,format(r.returDt, 'yyyy-MM-dd') as '반납일'
		  ,dbo.ufn_getState(r.rentalState) as '대여상태'
	from dbo.rentalTBL as r;




	-- booksTBL의 책 이름과 저자 정보 불러오기
	/* inner join */
	select r.rentalIdx
		  ,r.memberIdx
		  ,r.bookIdx
		  ,b.bookName
		  ,b.author
		  ,format(r.rentalDt,'yyyy-MM-dd') as '대여일'
		  ,format(r.returDt, 'yyyy-MM-dd') as '반납일'
		  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
 inner join booksTBL as b
    on r.bookIdx = b.bookIdx
 inner join memberTBL as m
    on r.memberIdx = m.memberIdx;



-- 책을 안빌린 회원 조회
	/* outer join */
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      ,dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
 left outer join booksTBL as b
    on r.bookIdx = b.bookIdx
 right outer join memberTBL as m
    on r.memberIdx = m.memberIdx
 where r.rentalIdx is null;


 -- 우리 책대여점에 없은 소설장르
select c.cateIdx
     , c.cateName
	 , b.bookName
  from cateTBL as c
  left outer join booksTBL as b
    on c.cateIdx = b.cateIdx
