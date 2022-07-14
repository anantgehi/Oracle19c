-- Why PL/SQL?
-- Procedural language extension to Structured Query Language
-- Programmability in database, can do complex validations.
-- Handle runtime errors
-- Create user defined functions(UDF)
-- Gives mechanism of fetching and processing one row at a time (cursor)
-- Stored Procedure
-- Triggers
-- Packages
-- User Defined Data Types which can be composite and also have collections
-- Programmatically do Export/Import, send emails, schedule jobs,etc
----------------------------------------------------------------------------------------
-- PLSQL Block Type
-- (Block is a piece of code)
-- 1. Anonymous
-- 2. Named

--Anonymous

-- client session specific
-- always get compiled and then executed
-- cannot accept parameters
-- not getting stored in database
-- cannot achieve reusability

-- Named Block

-- stored in database
-- stored in compiled format
-- can accept parameters
-- Highly resuable
--Eg. Stored Procedures, Functions, Triggers, Packages

/* Parts and structure of Anonymous block
Declare 
                                vairables, Cursors, Exceptions & Type Declaration
Begin
                                Actual Code
                                 -------
                                 -------
                                Exception
                                                    code for handling runtime errors
                                                    --------------
                                                    --------------
End;
*/

/*
Output statement in PLSQL
There is oracle supplied package known as 
*/
/*
SQL> begin
  2  dbms_output.put_line('Welcome to PL/SQL!!!');
  3  end;
  4  /

PL/SQL procedure successfully completed.

SQL> set serveroutput on
SQL> /
Welcome to PL/SQL!!!

PL/SQL procedure successfully completed.
*/

set serveroutput on

begin
drop table try555;
end;

-- error


