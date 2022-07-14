begin
dbms_output.put_line('Line 1');
dbms_output.put_line('Line 2');
dbms_output.put_line('Line 3');
dbms_output.put_line(5/0);
dbms_output.put_line('Line 4');
dbms_output.put_line('Line 5');
EXCEPTION
when OTHERS then
dbms_output.put_line(SQLCODE);
dbms_output.put_line(SQLERRM);
End;
------------------------------------
-- code which is prone to exception should be kept in nested block
--begin
--                   begin
--                   --exception
--                   --exception handled
--                   end;
--global exception                                      
--end;

Declare
	x number;
Begin
	dbms_output.put_line('Line 1');
	dbms_output.put_line(100 / 0);
	dbms_output.put_line('Line 2');
	Exception
		When Others Then
		Begin
			Select Sal into x from emp;
		Exception
				When Others Then
					Null;
		End;							
End;


--cursor

Declare cursor cf is select * from emp;
M cf%RowType;
BEGIN
if cf%isOPen then
Fetch cf into M;
	dbms_output.put_line(M.ENAME);
else
open cf;
fetch cf into M;
	dbms_output.put_line(M.ENAME);
end if;
END;

Declare
	Cursor cf is select * from emp;
	M cf%RowType;
Begin

		Open cf;

		Loop
			Fetch cf into M; 
			Exit When Cf%Found=false;
			dbms_output.put_line('Cursor Row Count is : '|| cf%RowCount);
			dbms_output.put_line('Name is --- ' || M.Ename);
		
		End Loop;

		Close cf;

End;

Declare
 	 Cursor cf is
    		 select *
     		 from emp
     		 where sal >= 2000;
Begin
   For mrec in cf
        Loop
       
                  dbms_output.put_line(mrec.ename||'  '||mrec.sal||'  '||mrec.deptno);
                  close cf;
         End Loop;
         
End;

-- implicit cursor

Create table newemp
As
Select * from emp;

Begin

     Delete from newemp
     where ename = '&name';

   If SQL%Found Then
        dbms_output.put_line('Record found and it is deleted');
   End If;

  If SQL%NotFound Then
           dbms_output.put_line('No record is present of the given name.');
  End If;

End;

rollback;

set serveroutput on
select * from emp;
---------------------------------------
select deptno, count(*)
from newemp
group by deptno

Declare
c number := 0;
Begin
   	Update NewEmp
     	set sal =  sal +  500
     	where deptno = &deptno;

/*If no record is updated since the deptno supplied is wrong then giving 
     the customised error message.*/
      If SQL%Rowcount  = 0 then
         dbms_output.put_line('No records are updated since the department number entered is not in the table.');
     End if;

/*To prevent sal to be updated where deptno is > 3 */
       If SQL%RowCount > 3 then
         Rollback;
             dbms_output.put_line('Cannot update since there are more than 3 employees.');
        End If;

        If SQL%RowCount <= 3 then
              c := SQL%RowCount;
              dbms_output.put_line(c || '  records updated.');
	 Commit;
        End If;
End;
-------------------------------------------------------------------
-- FOR UPDATE WHERE CURRENT OF
DECLARE
CURSOR CF IS SELECT * FROM NEWEMP FOR UPDATE;
M CF%ROWTYPE;
BEGIN
OPEN CF;
LOOP
FETCH CF INTO M;
EXIT WHEN CF%NOTFOUND;
IF M.SAL BETWEEN 800 AND 1000 THEN
M.SAL:=M.SAL+7000;
ELSIF M.SAL BETWEEN 1001 AND 2000 THEN
M.SAL:=M.SAL+5500;
ELSIF M.SAL BETWEEN 2001 AND 3000 THEN
M.SAL:=M.SAL+2000;
ELSIF M.SAL > 3000 THEN
M.SAL:=M.SAL+1000;
END IF;

UPDATE NEWEMP
SET SAL=M.SAL
WHERE CURRENT OF CF;

END LOOP;
CLOSE CF;
COMMIT;
END;

select * from newemp;
------------------------------------------------------------------------
DECLARE
CURSOR CF IS SELECT * FROM NEWEMP FOR UPDATE OF SAL;
M CF%ROWTYPE;
BEGIN
OPEN CF;
LOOP
FETCH CF INTO M;
EXIT WHEN CF%NOTFOUND;
IF M.SAL BETWEEN 800 AND 1000 THEN
M.SAL:=M.SAL+7000;
ELSIF M.SAL BETWEEN 1001 AND 2000 THEN
M.SAL:=M.SAL+5500;
ELSIF M.SAL BETWEEN 2001 AND 3000 THEN
M.SAL:=M.SAL+2000;
ELSIF M.SAL > 3000 THEN
M.SAL:=M.SAL+1000;
END IF;

UPDATE NEWEMP
SET SAL=M.SAL
WHERE CURRENT OF CF;

END LOOP;
CLOSE CF;
COMMIT;
END;
---------------------------------------------------------------------
-- stored procedures

select * from newemp;

create procedure Del_NewEmp
as
-- Local variables to be declared
Begin
delete from newemp where deptno = 20;
End Del_NewEmp;

select text from User_source where name='DEL_NEWEMP'
desc user_source

desc user_objects

select status from user_objects
where object_name='DEL_NEWEMP';

exec del_newemp

select * from newemp where deptno = 20;

rollback;

begin

del_newemp;

End;

create or replace procedure Del_NewEmp
as
-- Local variables to be declared
Begin
delete from newemp where deptno = 20;
commit;
End Del_NewEmp;

create or replace procedure Del_July13
as
begin 
Delete from July13;
end;

select status from user_objects
where object_name='DEL_JULY13';

create table July13
as
select * from emp;

Alter procedure del_july13 compile;

exec del_july13;

rollback;
select * from july13

create or replace procedure del123
as
begin
delete from july13
end;





















