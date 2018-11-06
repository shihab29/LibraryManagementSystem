CREATE OR REPLACE FUNCTION search(name IN varchar2)
RETURN number
  IS

  id BOOK.bookId%TYPE;
  title BOOK.bookTitle%TYPE;
  author BOOK.bookAuthor%TYPE;
  genre BOOK.bookGenre%TYPE;
  price BOOK.bookPrice%TYPE;
  quantity BOOK.bookQuantity%TYPE;
  available BOOK.bookAvailable%TYPE;

  CURSOR title_cur is
  SELECT * FROM BOOK WHERE bookTitle=name;

  BEGIN

  
  OPEN title_cur;
  LOOP
    FETCH title_cur INTO id,title,author,genre,price,quantity,available;
    EXIT WHEN search_cur%notfound;
    DBMS_OUTPUT.PUT_LINE((id)||' '||(title)||' '||(author)||' '||(genre)||' '||(price)||' '||(quantity)||' '||(available));
  
  END LOOP;
  CLOSE title_cur;

end;
/