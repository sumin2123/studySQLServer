begin try
	insert into userTBL values ('LSG', '�̻�', 1988, '���', null, null, 170, getdate());
	print '���强��';
end try

begin catch
	print '�������, �����ڿ��� ���� ���';
end catch