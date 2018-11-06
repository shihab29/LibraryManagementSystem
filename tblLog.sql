DROP TABLE LOG CASCADE CONSTRAINTS;

CREATE TABLE LOG (
	action varchar2(10),
	id number, 
	actionDate date
); 