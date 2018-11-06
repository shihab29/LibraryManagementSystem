DROP TABLE BOOK CASCADE CONSTRAINTS;

CREATE TABLE BOOK (
	bookId number, 
	bookTitle varchar2(50) NOT NULL, 
	bookAuthor varchar2(30) NOT NULL, 
	bookGenre varchar2(20) NOT NULL,
	bookPrice number NOT NULL, 
	bookQuantity number NOT NULL,
	bookAvailable varchar2(10) NOT NULL,
        PRIMARY KEY(bookId)
); 