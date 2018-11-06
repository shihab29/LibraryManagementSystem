SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT a PROMPT 'Enter New Member Name: ';
ACCEPT b PROMPT 'Enter New Member Address: ';
ACCEPT c PROMPT 'Enter New Member Phone: ';
ACCEPT d PROMPT 'Enter New Member Password: ';

DECLARE
	a varchar2(20) := '&a';
	b varchar2(30) := '&b';
	c number(11) := &c;
	d varchar2(10) := '&d';

	x Member.memberID%TYPE;
	y Member.memberPassword%TYPE;
	
	
BEGIN
	addMember(a,b,c,d);
	DBMS_OUTPUT.PUT_LINE('New Member Created !');
	SELECT memberId,memberPassword into x,y FROM MEMBER WHERE memberId = (SELECT MAX(memberId) FROM MEMBER);
	DBMS_OUTPUT.PUT_LINE('Your ID: '||(x)||' AND Your Password: '||(y) );

EXCEPTION		
	when INVALID_NUMBER then
		DBMS_OUTPUT.PUT_LINE('Incorrect Assigned !');
	  
	when VALUE_ERROR then
		DBMS_OUTPUT.PUT_LINE('Unexpected Long Value Assigned !');		
END;
/