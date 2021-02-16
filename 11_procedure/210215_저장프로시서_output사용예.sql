use sqlDB;
go

create or alter procedure plusNew
	@p1 int,  -- �Է� �Ķ����
	@p2 int,  -- �Է� �Ķ����
	@pout int output -- ���(����) �Ķ����
as
	select @pout = @p1 + @p2;
go

declare @newResult int;
set @newResult = 0;
exec plusNew 3, 4, @newResult output;
print concat('PlusNew(3, 4) = ', @newResult);


/*
C#������ �Ʒ��� ����
static void Main(string[] args)
{
    int newResult;
    plusNew(3, 4, out newResult);
    Console.WriteLine($"plusNew(3, 4) = {newResult}");
}

private static void plusNew(int p1, int p2, out int pout)
{
    pout = p1 + p2;
}
*/
