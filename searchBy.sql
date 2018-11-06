SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a PROMPT 'Enter 1 for Book Name, 2 for Author Name or 3 for Genre: ';
ACCEPT b PROMPT 'Enter Search Name: ';

DECLARE
	a number := &a;
	b varchar2(30) := '&b';
	c number;
BEGIN
	c :=search(a,b);
	DBMS_OUTPUT.PUT_LINE('Done !');

	
END;
/