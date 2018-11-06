SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a PROMPT 'Enter New Admin Name: ';
ACCEPT b PROMPT 'Enter New Admin Address: ';
ACCEPT c PROMPT 'Enter New Admin Phone: ';
ACCEPT d PROMPT 'Enter New Admin Password: ';

DECLARE
	a varchar2(20) := '&a';
	b varchar2(30) := '&b';
	c number(11) := &c;
	d varchar2(10) := '&d';

	x ADMIN.adminID%TYPE;
	y ADMIN.adminPassword%TYPE;
	
	
BEGIN
	addAdmin(a,b,c,d);
	DBMS_OUTPUT.PUT_LINE('New Admin Created !');
	SELECT adminId,adminPassword into x,y FROM ADMIN WHERE adminId = (SELECT MAX(adminId) FROM ADMIN);
	DBMS_OUTPUT.PUT_LINE('Your ID: '||(x)||' AND Your Password: '||(y) );

EXCEPTION		
	when INVALID_NUMBER then
		DBMS_OUTPUT.PUT_LINE('Incorrect Assigned !');
	  
	when VALUE_ERROR then
		DBMS_OUTPUT.PUT_LINE('Unexpected Long Value Assigned !');		
END;
/