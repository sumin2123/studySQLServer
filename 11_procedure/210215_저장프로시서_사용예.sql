-- exec usp_users '���ȣ';
-- exec usp_users2 1980, 180;

declare @pout int;
exec usp_users4 '���ο� �ؽ�Ʈ', @pout output;

print concat('���� �Էµ� ���� ==> ', @pout);
select @pout as '���簪';


