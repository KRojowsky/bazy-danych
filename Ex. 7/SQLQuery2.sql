  CREATE TRIGGER TR_Nazwisko
  ON Person.Person
  AFTER INSERT
  AS
  BEGIN
      UPDATE Person.Person SET LastName = UPPER(LastName)
  END;