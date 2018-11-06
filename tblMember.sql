DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER (
	memberId number, 
	memberName varchar2(20) NOT NULL, 
	memberAddress varchar2(30), 
	memberPhone number(11), 
	memberRegDate date default (sysdate) NOT NULL,
	memberPassword varchar2(10),
	receivedBook varchar2(10),
	expiredDate date,
        PRIMARY KEY(memberId)
); 