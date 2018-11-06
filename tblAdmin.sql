DROP TABLE ADMIN CASCADE CONSTRAINTS;

CREATE TABLE ADMIN (
	adminId number, 
	adminName varchar2(20) NOT NULL, 
	adminAddress varchar2(30), 
	adminPhone number(11), 
	adminRegDate date default (sysdate) NOT NULL,
	adminPassword varchar2(10),
        PRIMARY KEY(adminId)
); 