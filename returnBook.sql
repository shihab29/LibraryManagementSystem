set serveroutput on;
set verify off;

accept x number prompt 'Enter Member ID: '
accept y number prompt 'Enter Book ID: '
declare
	memId number :=&x;
	bId number :=&y;
	mem number;
	chk number :=0;
	chk2 number :=0;
	temp number :=0;
	
	cursor mycur is
	select memberId from borrowBook;
	
	cursor mymember is
	select memberId from member;
	
begin 
	open mymember;
		loop
			fetch mymember into mem;
			exit when mymember%notfound;
			if memId = mem
			then
				chk2 := 1;
				exit;
			end if;
		end loop;
	close mymember;
	
	if chk2=1
	then
		open mycur;
			loop
				fetch mycur into mem;
				exit when mycur%notfound;
				if mem=memId
				then
					chk := 1;
					exit;
				end if;
				--dbms_output.put_line(mem);
			end loop;
		close mycur;
	else
		dbms_output.put_line('Member does not exist!');
	end if;
	
	if chk = 1 and chk2 = 1
	then
		select bookQuantity into temp from book where bookId=bId;
		temp := temp+1;
		delete from borrowBook where memberId=memId and bookId=bId;
		update book set bookQuantity=temp where bookId=bId;
		update member set expiredDate=NULL,receivedBook='NO' where memberId=memId;
		commit;			
	elsif chk = 0 and chk2 = 1
	then	
		dbms_output.put_line('Member does bot possess any book');
	end if;
	
	exception
	
	when no_data_found then
		dbms_output.put_line('Wrong Book Id');
end;
/