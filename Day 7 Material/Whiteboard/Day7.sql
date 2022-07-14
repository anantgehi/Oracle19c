create or replace procedure show_sal
as
v_sal Emp.sal%Type;
BEGIN
select sal into v_sal
from emp;
--
END;

desc pr2  -- describe procedure

set serveroutput on

create or replace procedure pr4
(p_deptno in number, 
p_dname in dept.dname%type default 'Accounts',
 p_loc dept.loc%type)
is
begin
Insert into dept 
 values(p_deptno, p_dname, p_loc);
dbms_output.put_line('Done');
end;


exec pr4(50,default,'Mumbai')
exec pr4(p_deptno=>50,p_loc=>'Mumbai')
select * from dept
rollback

exec pr4(p_loc=>'Pune', p_deptno=> 60, p_dname=> 'Training') --any sequence

--interview,project ready,certification

create or replace procedure p1(p_salary number)
as begin
p_salary :=p_salary+4000;
end;

show errors

create or replace procedure pr5(Name IN varchar2, Salary OUT number)
Is
Begin
   	Select sal into Salary
   	from emp
  	where ename = Name;
End;

desc pr5

declare
x number;
begin
pr5('SMITH',x);
dbms_output.put_line(x);
end;

variable s number

print s

exec pr5('SMITH', :s)

exec pr5('KING', :s)

exec :s :=1000;

----------------------------------------------------------------------------------





create or replace procedure pr6(x IN OUT number)  
Is 
Begin
     
     x := (x * x);
    
  End;

desc pr6

var bv number

exec :bv:=3

print bv

exec pr6(:bv)

--refer : IN OUT example from with respect to database
-- VIMP


--function

create or replace function get_raise(p_salary Number)
return number
as
v number;
Begin
v:=p_salary8000;
--return (p_salary+8000);
EXCEPTION
WHEN OTHERS THEN RETURN 1000;
end;

select Get_raise(7000) from dual;

select ename,sal,get_raise(sal) as "Revised" from emp;

rollback;

show err;

select get_raise(7000) from dual;

-- IDEALLY A FUNCTION BODY SHOULD NOT HAVE DML STATEMENT
-- IT WILL RESTRICT THE USAGE ON THAT FUNCTION

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set serveroutput on

begin
Execute immediate 'create table dsql(a int)';
end;

select * from dsql;

create table emp102
as
select * from emp

Declare v_sql 
varchar(1000);
begin
v_sql:='Drop table emp102';
execute immediate v_sql;
end;

select * from emp102

Create table emp_trial
As
Select * from emp;

create or replace procedure drop_table(p_tablename varchar)
is
begin
If p_tablename not in ('EMP','DEPT') Then
Execute immediate 'Drop Table ' || p_tablename;
end if;
end;

exec drop_table('EMP');

select * from emp


exec drop_table('EMP_TRIAL');

select * from emp_trial

----------------------------------------------------------------------------
-- packages
/*

*/


create or replace package pack1
as procedure p1;
procedure p2(a number);
End;

create or replace package body pack1
as
                   procedure p1
                    as
                     begin
                   dbms_output.put_line('abc');
                   end p1;
                   
                 procedure p2(a number)
                as
                begin
                dbms_output.put_line('A is '|| a);
              end p2;
end pack1;


exec pack1.p1;
exec pack1.p2(5);














