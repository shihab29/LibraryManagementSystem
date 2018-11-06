drop table borrowBook cascade constraints;

create table borrowBook(
	memberId number,
	bookId number,
	receiveDay date default (sysdate) NOT NULL,
	expiredDay date default (sysdate + 7) NOT NULL
);
