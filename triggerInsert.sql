create or replace trigger triggInsertAdmin
after insert
on admin
for each row

begin
	insert into tblLog values('Insert',:new:adminid, sysdate);
end;
/