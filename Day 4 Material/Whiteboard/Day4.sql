declare
x number;
begin
x:=1;
Loop
Exit When x=11;
dbms_output.put_line(x);
x:=x+1;
End Loop;
End;

declare
x number;
begin
x:=1;
Loop
if x=11 then exit;
end if;
dbms_output.put_line(x);
--x:=x+1;
End Loop;
End;

create table five(no number);

declare x number;
Begin
x:=5;
Loop
Insert into five values(x);
x:=x+5;
exit when x>50;
End Loop;
End;

select * from five;

declare x number;
Begin
x:=100;
Loop
dbms_output.put_line(x);
Exit when x=100;
x:=x+1;
End Loop;
End;



declare x number;
Begin
x:=1;
while x<=10
Loop
dbms_output.put_line(x);
x:=x+1;
--Exit when x=6; --optional
End Loop;
End;

-- For loop
Begin
For x in 1 .. 10
loop
dbms_output.put_line(x);
end loop;
end;

Begin
For x in 1 .. 10 by 2
loop
dbms_output.put_line(x);
x:=x+1;
end loop;
end;

Begin
For x in  1 .. 1
loop
dbms_output.put_line(x);

--x:=x+1;
end loop;
--dbms_output.put_line(x);
end;


Begin
For x in (select * from emp)
loop
dbms_output.put_line(x.ename);
--x:=x+1;
end loop;
end;


-- GOTO


-- Exception Handling


declare v_sal emp.sal%type;
begin
select sal into v_sal
from emp;
dbms_output.put_line('Line1');
dbms_output.put_line('Line2');
dbms_output.put_line('Line3');
exception 
when too_many_rows then
dbms_output.put_line('Variables cannot have multiple values');
End;

declare v_sal emp.sal%type;
begin
select sal into v_sal
from emp
where ename = 'QUEEN';
dbms_output.put_line('Line1');
dbms_output.put_line('Line2');
dbms_output.put_line('Line3');
exception 
when too_many_rows then
dbms_output.put_line('Variables cannot have multiple values');
End;

declare v_sal emp.sal%type;
begin
select sal into v_sal
from emp
where ename = '&ename';
dbms_output.put_line(5/0);
dbms_output.put_line('Line1');
dbms_output.put_line('Line2');
dbms_output.put_line('Line3');
exception 
when no_data_found then
dbms_output.put_line('No Such Record Available');
when too_many_rows then
dbms_output.put_line('Variables cannot have multiple values');
when OTHERS then
dbms_output.put_line('contact DBA');
End;

declare v_sal emp.sal%type;
begin
select sal into v_sal
from emp
where ename = '&ename';
dbms_output.put_line(5/0);
dbms_output.put_line('Line1');
dbms_output.put_line('Line2');
dbms_output.put_line('Line3');
exception 
when OTHERS then
dbms_output.put_line('contact DBA');/*
when no_data_found then
dbms_output.put_line('No Such Record Available');
when too_many_rows then
dbms_output.put_line('Variables cannot have multiple values');*/
End;




