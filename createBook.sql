SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a PROMPT 'Enter New Book Title: ';
ACCEPT b PROMPT 'Enter New Book Author: ';
ACCEPT c PROMPT 'Enter New Book Genre: ';
ACCEPT d PROMPT 'Enter New Book Price: ';
ACCEPT e PROMPT 'Enter New Book Quantity: ';

DECLARE
	a varchar2(50) := '&a';
	b varchar2(30) := '&b';
	c varchar2(20) := '&c';
	d number := &d;
	e number := &e;
	f varchar2(10);

	x BOOK.bookID%TYPE;
	y BOOK.bookAvailable%TYPE;

	NULL_VALUE EXCEPTION;
	
	
BEGIN
	if e > 0 then
		f := 'YES';
	elsif e = 0 then
		f := 'NO';
	else
		f := 'UNKNOWN';
	end if;	

	if a is NULL or b is NULL or c is NULL or d = 0 then
		RAISE NULL_VALUE;
	end if;			

	--addBook(a,b,c,d,e,f);
	addPackage.addBook(a,b,c,d,e,f);
	DBMS_OUTPUT.PUT_LINE('New Book Added !');
	
EXCEPTION		
	when INVALID_NUMBER then
		DBMS_OUTPUT.PUT_LINE('Incorrect Assigned !');
	  
	when VALUE_ERROR then
		DBMS_OUTPUT.PUT_LINE('Unexpected Long Value Assigned !');	

	when NULL_VALUE then	
		DBMS_OUTPUT.PUT_LINE('Null Value Not Accepted !');	
END;
/