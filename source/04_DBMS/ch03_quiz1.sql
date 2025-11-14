-- ★ <총 연습문제>
--Part1
--1. 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT ENAME 이름, E.DEPTNO 부서번호, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
--2. NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여 , 부서명을 출력
SELECT ENAME 이름, JOB 업무, SAL 급여, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC='NEW YORK';
--3. 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME 이름, DNAME 부서명, LOC 위치
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL AND COMM!=0;
--4. 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME 이름, JOB 업무, DNAME 부서명, LOC 위치
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE ('%L%');
--5. 사번, 사원명, 부서코드, 부서명을 검색하라(단, 사원명기준으로 오름차순 정렬)
SELECT EMPNO 사번, ENAME 사원명, E.DEPTNO 부서코드, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY ENAME;
--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정렬하시오
SELECT EMPNO 사번, ENAME 사원명, SAL 급여, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >=2000
    ORDER BY SAL DESC;
--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정렬하시오.
SELECT EMPNO 사번, ENAME 사원명, JOB 업무, SAL 급여, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB='MANAGER' AND SAL >=2500
    ORDER BY EMPNO;
--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오(단, 급여기준 내림차순으로 정렬)
SELECT EMPNO 사번, ENAME 사원명, JOB 업무, SAL 급여, GRADE 등급
    FROM EMP E, DEPT D, SALGRADE S
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;
    
