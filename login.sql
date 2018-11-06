SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT x NUMBER PROMPT 'Enter 1 For Admin and 2 For Member: ';
ACCEPT id NUMBER PROMPT 'Enter Your ID: ';
ACCEPT password PROMPT 'Enter Your Password: ';

DECLARE
	x number := &x;
	y number := &id;
	z varchar2(10) := '&password';

	pass varchar2(10);

	incorrect exception;
	
BEGIN
	if x = 1 then
		SELECT adminPassword into pass FROM ADMIN WHERE adminId=y;
		if pass = z then
			DBMS_OUTPUT.PUT_LINE('Successfully LOGIN as ADMIN');
		else
			DBMS_OUTPUT.PUT_LINE('Incorrect PASSWORD');	
		end if;	
	elsif x = 2 then	
		SELECT memberPassword into pass FROM MEMBER WHERE memberId=y;
		if pass = z then
			DBMS_OUTPUT.PUT_LINE('Successfully LOGIN as MEMBER');
		else
			DBMS_OUTPUT.PUT_LINE('Incorrect PASSWORD');	
		end if;	
	else
		RAISE incorrect;
	end if;	
	
EXCEPTION		
	when no_data_found then
		DBMS_OUTPUT.PUT_LINE('Not Registered');
	  
	when incorrect then
		DBMS_OUTPUT.PUT_LINE('Please Insert 1 for ADMIN or 2 for MEMBER');	
END;
/