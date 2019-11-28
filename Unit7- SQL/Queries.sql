					 
--  [1] List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE TABLE EMP_SAL_DATA AS
SELECT EMP.EMP_NO
	  ,EMP.FIRST_NAME
	  ,EMP.LAST_NAME
	  ,EMP.GENDER
	  ,SAL.SALARY
FROM EMPLOYEES EMP
LEFT JOIN SALARIES SAL
	ON SAL.EMP_NO=EMP.EMP_NO;
	
SELECT * 
FROM EMP_SAL_DATA;


-- [2] List employees who were hired in 1986.					 
					 
SELECT * 
FROM EMPLOYEES
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 1986;

--COUNT OF HIRED EMPLOYEES EACH YEAR 
SELECT EXTRACT(YEAR FROM HIRE_DATE),COUNT(*) 
FROM EMPLOYEES
GROUP BY  EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY EXTRACT(YEAR FROM HIRE_DATE) ;


-- [3] List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
CREATE TABLE MANAGER_DATA AS
SELECT DM.DEPT_NO,
	   DT.DEPT_NAME,
	   DM.EMP_NO,
	   EMP.LAST_NAME,
	   EMP.FIRST_NAME,
	   DM.FROM_DATE AS START_DATE,
	   DM.TO_DATE AS END_DATE
FROM DEPT_MANAGER DM
INNER JOIN DEPARTMENTS DT
	ON DM.DEPT_NO = DT.DEPT_NO
		INNER JOIN EMPLOYEES EMP
			ON EMP.EMP_NO =DM.EMP_NO
ORDER BY DM.DEPT_NO, DM.FROM_DATE;

SELECT * FROM MANAGER_DATA;
				

-- [4] List the departmentof each employee with the following information: employee number, last name, first name, and department name.
CREATE TABLE EMP_DEP_DATA AS
SELECT DE.EMP_NO,
	   EMP.LAST_NAME,
	   EMP.FIRST_NAME,
	   DT.DEPT_NAME
FROM DEPT_EMP DE
	INNER JOIN DEPARTMENTS DT
		ON DE.DEPT_NO = DT.DEPT_NO
			INNER JOIN EMPLOYEES EMP
				ON EMP.EMP_NO =DE.EMP_NO;
			
			
SELECT * FROM EMP_DEP_DATA;			



-- [5] List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM EMPLOYEES
WHERE 
	UPPER(FIRST_NAME)='HERCULES' 
	AND 
	UPPER(LAST_NAME) LIKE 'B%'


-- [6] List all employees in the Sales department, including their employee number, last name, first name, and department name.


SELECT DE.EMP_NO,
	   EMP.LAST_NAME,
	   EMP.FIRST_NAME,
	   DT.DEPT_NAME
FROM DEPT_EMP DE
	INNER JOIN DEPARTMENTS DT
		ON DE.DEPT_NO = DT.DEPT_NO
			INNER JOIN EMPLOYEES EMP
				ON EMP.EMP_NO =DE.EMP_NO
WHERE UPPER(DT.DEPT_NAME) ='SALES';
				

-- [7] List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT DE.EMP_NO,
	   EMP.LAST_NAME,
	   EMP.FIRST_NAME,
	   DT.DEPT_NAME
FROM DEPT_EMP DE
	INNER JOIN DEPARTMENTS DT
		ON DE.DEPT_NO = DT.DEPT_NO
			INNER JOIN EMPLOYEES EMP
				ON EMP.EMP_NO =DE.EMP_NO
WHERE UPPER(DT.DEPT_NAME)  IN ('SALES' , 'DEVELOPMENT');

-- [8] In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT LAST_NAME , COUNT(*) 
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY COUNT(*) DESC;
