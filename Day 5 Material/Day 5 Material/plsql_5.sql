/* Day 5 Assignments
1) Write a plsql block to accept the empno from the user. Raise the salary of that employee by 20% and display the raised salary. 
(Note - Do not update the salary, just display the changed salary)
*/
DECLARE
X EMP.EMPNO%TYPE;
Y EMP.SAL%TYPE;
BEGIN
X:=&EMPNO; 
SELECT SAL INTO Y FROM EMP WHERE EMPNO=X;
Y:=Y+0.2*Y;
DBMS_OUTPUT.PUT_LINE('RAISED SALARY IS '|| Y);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
--------------------------------------------------------------------------------------------------------------
/*
2) Accept job type from the user. Display the message depending upon whether  
     no rows or one row or several rows are selected.
      The message should be any one from the below 3 as per the situation.
     	JOB TYPE FOUND ONCE
            JOB TYPE FOUND MORE THAN ONCE
            JOB TYPE NOT FOUND 
*/
DECLARE
X EMP.JOB%TYPE;
Y INT;
BEGIN
X:='&JOB'; 
SELECT COUNT(*) INTO Y FROM EMP WHERE JOB=X;
IF Y=1 THEN
DBMS_OUTPUT.PUT_LINE('JOB TYPE FOUND ONCE');
ELSIF Y>1 THEN
DBMS_OUTPUT.PUT_LINE('JOB TYPE FOUND MORE THAN ONCE');
ELSE
DBMS_OUTPUT.PUT_LINE('JOB TYPE FOUND NOT FOUND');
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
----------------------------------------------------------------------------------------------------------
/*
3)  Using basic loop technique display all the multiples of 7 between 31 and 48.
*/
DECLARE
X INT:=7;
Y INT;
BEGIN
LOOP
EXIT WHEN X>48;
Y:=REMAINDER(X,7);
IF Y=0 AND X>31 AND X<48 THEN 
DBMS_OUTPUT.PUT_LINE(X);
END IF;
X:=X+7;
END LOOP;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
-------------------------------------------------------------------------------------------------------------
/*
4) Write a block to accept the Empno from the user and change the salary according to the following condition. If salary is in the range of 
	RANGE 		INCREMNENT
	1000 – 2000		500
	2001 –3000		1000
	3001 – 4000		1500
	>4000 			 2000	
(Note - Do not update the salary, just display the changed salary)
*/
DECLARE
X EMP.EMPNO%TYPE;
Y EMP.SAL%TYPE;
BEGIN
X:=&EMPNO;
SELECT SAL INTO Y FROM EMP WHERE EMPNO=X;
IF Y>=1000 AND Y<=2000 THEN
Y:=Y+500;
ELSIF Y>=2001 AND Y<=3000 THEN
Y:=Y+1000;
ELSIF Y>=3001 AND Y<=4000 THEN
Y:=Y+1500;
ELSIF Y>4000 THEN
Y:=Y+2000;
ELSE
Y:=Y+0;
END IF;
DBMS_OUTPUT.PUT_LINE('REVISED SALARY IS ' || Y);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
------------------------------------------------------------------------------------------------------------------------
/*
5)  Create a table Inspection_Details_EmployeeID that has one column Readings of numeric type. 
Using pl/sql block add numbers, which has the difference of 0.1. The numbers should be between 0.1 and 6.8.
*/
DROP TABLE INSPECTION_DETAILS_EMPLOYEEID IF EXISTS;
CREATE TABLE INSPECTION_DETAILS_EMPLOYEEID(READING NUMBER);
DECLARE
X NUMBER;
BEGIN
X:=0.1;
LOOP
EXIT WHEN X>6.8;
INSERT INTO INSPECTION_DETAILS_EMPLOYEEID VALUES(X);
X:=X+0.1;
END LOOP;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;

--RUN SEPARATELY
SELECT * FROM INSPECTION_DETAILS_EMPLOYEEID;
------------------------------------------------------------------------------------------------------------
/*
6) Through while loop display the multiples of 7 till 70 in the descending order.
*/
DECLARE
X INT:=70;
BEGIN
WHILE X>0
LOOP
DBMS_OUTPUT.PUT_LINE(X);
X:=X-7;
END LOOP;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
------------------------------------------------------------------------------------------------------------
/*
7) Display the difference of salary between the oldest and the latest employee.
*/
DECLARE
OLDSAL EMP.SAL%TYPE;
NEWSAL EMP.SAL%TYPE;
DIFF EMP.SAL%TYPE;
BEGIN
SELECT SAL INTO OLDSAL FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
SELECT SAL INTO NEWSAL FROM EMP WHERE HIREDATE=(SELECT MAX(HIREDATE) FROM EMP);
DIFF:=ABS(OLDSAL-NEWSAL);
DBMS_OUTPUT.PUT_LINE('DIFFERENCE OF SALARY BETWEEN THE OLDEST AND THE LATEST EMPLOYEE IS ' || DIFF);
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
-------------------------------------------------------------------------------------------------------------
/*
8) Create the table tx1 with the following script. 
	Create table Oracle_Batch(student_name varchar (20));
	Create a program that will accept the student_name form the user and if the user has entered all the characters as alphabets only then enter that name into the Oracle_Batch table.
*/
DECLARE
Y ORACLE_BATCH.STUDENT_NAME%TYPE:='&STUDENT_NAME';
Z INT:=0;
S CHAR;
BEGIN
FOR X IN 1 .. LENGTH(Y)
LOOP
SELECT SUBSTR(Y , X , 1 ) INTO S FROM DUAL;
IF ((S >= 'a' AND S <= 'z') OR (S >= 'A' AND S <= 'Z')) THEN
Z:=Z;
ELSE
Z:=1;
END IF;
END LOOP;
IF Z=1 THEN
DBMS_OUTPUT.PUT_LINE('ALL THE CHARACTERS ARE NOT ALPHABETS');
ELSE
DBMS_OUTPUT.PUT_LINE('ALL THE CHARACTERS ARE ALPHABETS');
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
-------------------------------------------------------------------------------------------------------------
/*
9) Write a PL/SQL code to accept an employee number from the user and display whether it is exists or not .
*/
DECLARE
X EMP.EMPNO%TYPE;
Y INT;
BEGIN
X:='&EMPNO'; 
SELECT COUNT(*) INTO Y FROM EMP WHERE EMPNO=X;
IF Y=1 THEN
DBMS_OUTPUT.PUT_LINE('EMPLOYEE EXISTS');
ELSE
DBMS_OUTPUT.PUT_LINE('EMPLOYEE DOES NOT EXISTS');
END IF;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('ERROR OCCURED CONTACT DBA');
END;
-------------------------------------------------------------------------------------------------------------