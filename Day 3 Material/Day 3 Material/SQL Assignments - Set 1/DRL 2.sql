SELECT DEPTNO, ROUND(AVG(SAL),2) "AVERAGE", MIN(SAL) "LOWEST", MAX(SAL) "HIGHEST", MAX(SAL) - MIN(SAL) "DIFFERENCE OF HIGHEST AND LOWEST"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--

SELECT JOB, COUNT(JOB) "NUMBER OF EMPLOYEES"
FROM EMP
GROUP BY JOB
ORDER BY JOB;

--

SELECT JOB 
FROM EMP 
GROUP BY JOB
HAVING MIN(SAL)>=3000;

--

SELECT ROUND(AVG(SAL),2) "AVERAGE SALARY" FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%'

--

SELECT 'The total of job type ' || JOB || ' is ' || SUM(SAL) "JOB WISE TOTAL SALARIES"
FROM EMP
GROUP BY JOB
ORDER BY JOB;

--

SELECT DEPTNO, SUM(SAL) "TOTAL SALARY", ROUND(0.1*SUM(SAL),2) "TAX : 10% OF TOTAL", ROUND(SUM(SAL) - 0.1*SUM(SAL), 2) "NET TOTAL : DEDUCTING TAX"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;