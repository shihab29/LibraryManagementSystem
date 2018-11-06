CREATE OR REPLACE PACKAGE addPackage as
	
	PROCEDURE addBook(
		title in BOOK.bookTitle%TYPE,
		author in BOOK.bookAuthor%TYPE,
		genre in BOOK.bookGenre%TYPE,
		price in BOOK.bookPrice%TYPE,
		quantity in BOOK.bookQuantity%TYPE,
		available in BOOK.bookAvailable%TYPE
		);

END addPackage;
/

CREATE OR REPLACE PACKAGE BODY addPackage as

	PROCEDURE addBook(
		title in BOOK.bookTitle%TYPE,
		author in BOOK.bookAuthor%TYPE,
		genre in BOOK.bookGenre%TYPE,
		price in BOOK.bookPrice%TYPE,
		quantity in BOOK.bookQuantity%TYPE,
		available in BOOK.bookAvailable%TYPE
		)
		IS
BEGIN
	if genre = 'Story' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookStory.nextval,title,author,genre,price,quantity,available);	
	elsif genre = 'Comics' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookComics.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Sports' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookSports.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Novel' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookNovel.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Drama' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookDrama.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'History' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookHistory.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'ScienceFiction' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookScienceFiction.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'NonFiction' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookNonFiction.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Adventure' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookAdventure.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Travel' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookTravel.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Mystery' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookMystery.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Photography' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookPhotography.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Poetry' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookPoetry.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Education' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookEducation.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Engineering' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookEngineering.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Medical' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookMedical.nextval,title,author,genre,price,quantity,available);
	elsif genre = 'Religious' then
		INSERT INTO BOOK (bookId,bookTitle,bookAuthor,bookGenre,bookPrice,bookQuantity,bookAvailable) VALUES (seqBookReligious.nextval,title,author,genre,price,quantity,available);
	else
		DBMS_OUTPUT.PUT_LINE('Book Genre Not Authentic !');
	end if;
	commit;	
END addBook;

END addPackage;
/