/*  다른 select 쿼리 문들이랑 같은 쿼리 X = > 새쿼리에 입력하여야 한다. */

-- 사용자 레벨 린턴 함수
create or alter function dbo.ufn_getLevel(@levels char(1))
returns nvarchar(3) -- levels 젤 긴 글자가 3글자 ( 브론즈, 아이언 등)
as
begin
	declare @result nvarchar(3); -- 골드 실버 등 변수

	set @result = case @levels
					when 'A' then '골드'
					when 'B' then '실버'
					when 'C' then '브론즈'
					when 'D' then '아이언'
					when 'S' then '관리자'
					else '비회원'
				end;
	return @result;
 end
go