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
	temp2 number :=0;
	dat date;
	
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
		select bookId into temp2 from borrowBook where memberId=memId;
		dbms_output.put_line('memberid '|| mem ||' already posseses a book of ID : ' || temp2);
	elsif chk = 0 and chk2 = 1
	then	
		select bookQuantity into temp from book where bookId=bId;
		if temp>0
		then
			temp := temp-1;
			insert into borrowBook (memberId,bookId) values (memId ,bId);
			select expiredDay into dat from borrowBook where memberId=memId;
			update book set bookQuantity=temp where bookId=bId;
			update member set expiredDate=dat,receivedBook='YES' where memberId=memId;
			dbms_output.put_line('Successfully Updated!');
		else
			dbms_output.put_line('Book is not available!');
		end if;
		commit;
	end if;
end;
/