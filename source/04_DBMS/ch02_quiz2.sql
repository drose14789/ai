--<총 연습문제>
--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
    WHERE SAL > 3000;
--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME, DEPTNO FROM EMP
    WHERE EMPNO=7788;
--3.	연봉(SAL*12+COMM)이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
    WHERE (SAL*12+NVL(COMM,0)) >= 24000 ORDER BY SAL;
--4.	입사일이 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 사원명, 직책, 입사일을 출력 (단 hiredate 순으로 출력)
SELECT ENAME 사원명, JOB 직책, HIREDATE 입사일 FROM EMP
    WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '81/02/20' AND '81/05/1'
    ORDER BY HIREDATE;
--5.	deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * FROM EMP
    WHERE DEPTNO IN (10, 20) ORDER BY ENAME;
--6.	sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 출력되는 결과의 타이틀을 employee과 Monthly Salary로 출력)
SELECT ENAME employee, SAL MonthlySalary FROM EMP
    WHERE SAL >= 1500 AND DEPTNO IN (10,30);
--7.	hiredate가 1982년인 사원의 모든 정보를 출력
SELECT * FROM EMP
    WHERE TO_CHAR(HIREDATE,'RR')=82;
--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME 이름, SAL 급여 FROM EMP
    WHERE ENAME BETWEEN 'C' AND 'P' AND ENAME LIKE '_%'
    ORDER BY SAL DESC, ENAME;
--9.	comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME 이름, SAL 급여, COMM 상여금 FROM EMP
    WHERE COMM > SAL*1.1;
--10.	job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * FROM EMP
    WHERE JOB='CLERK' OR JOB='ANALYST' AND SAL NOT IN(1000,3000,5000);
--11.	ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP
    WHERE ENAME LIKE('%L%L%') AND DEPTNO=30 OR MGR=7782;
--12.	입사일이 81년도인 직원의 사번, 사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO 사번, ENAME 사원명, HIREDATE 입사일, JOB 업무, SAL 급여 FROM EMP
    WHERE TO_CHAR(HIREDATE,'RR')=81;
--13.	입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO 사번, ENAME 사원명, HIREDATE 입사일, JOB 업무, SAL 급여 FROM EMP
    WHERE TO_CHAR(HIREDATE,'RR')=81 AND JOB='SALESMAN';
--14.	사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO 사번, ENAME 사원명, HIREDATE 입사일, JOB 업무, SAL 급여 FROM EMP
    ORDER BY SAL DESC, HIREDATE;
--15.	사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO 사번, ENAME 사원명 FROM EMP
    WHERE ENAME LIKE ('__N%');
--16.	사원명에 'A'가 들어간 사원의 사번, 사원명을 출력
SELECT EMPNO 사번, ENAME 사원명 FROM EMP
    WHERE ENAME LIKE ('%A%');
--17.	연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO 사번, ENAME 사원명, (SAL*12) 연봉 FROM EMP
    WHERE (SAL*12) >= 3500;