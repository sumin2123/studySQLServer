declare @year int; -- �⵵ ����
set @year = 1976; -- �� 1980�� ����

if @year >= 1980
begin
	select * from userTBL where birthYear >= @year;
end
else
begin
	print '�˻��� �� �� �����ϴ�';
end