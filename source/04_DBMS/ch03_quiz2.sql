--Part2
--1. 이름, 직속상사명
SELECT W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
--2. 이름, 급여, 업무, 직속상사명
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO;
--3. 이름, 급여, 업무, 직속상사명 . (상사가 없는 직원까지 전체 직원 다 출력. 상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME,'없음')
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);
--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME, W.SAL, DNAME, M.ENAME
    FROM EMP W, EMP M, DEPT D
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO;
--5. 상사가 없는 직원과 상사가 있는 직원 모두에 대해 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명을 출력하시오(단, 직속상사가 없을 경우 직속상사명에는 ‘없음’으로 대신 출력하시오)
SELECT W.ENAME, W.SAL, W.DEPTNO, DNAME, LOC, NVL(M.ENAME,'없음')
    FROM EMP W, EMP M, DEPT D
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO(+);
--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME
    FROM EMP W, EMP M, DEPT D, SALGRADE 
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL
        AND W.SAL>=2000;
--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME
    FROM EMP W, EMP M, DEPT D, SALGRADE 
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO(+) AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME;
--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(SAL+COMM)*12으로 계산
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+W.COMM)*12, M.ENAME
    FROM EMP W, EMP M, DEPT D, SALGRADE 
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL;
--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM,0))*12, M.ENAME
    FROM EMP W, EMP M, DEPT D, SALGRADE 
    WHERE W.DEPTNO = D.DEPTNO AND W.MGR=M.EMPNO AND W.SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, W.SAL;
--10. 사원명, 상사명, 상사의 상사명을 검색하시오(self join)
SELECT W.ENAME, M.ENAME, B.ENAME
    FROM EMP W, EMP M, EMP B
    WHERE W.MGR=M.EMPNO AND M.MGR=B.EMPNO;
--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오(outer join)
SELECT W.ENAME, M.ENAME, B.ENAME
    FROM EMP W, EMP M, EMP B
    WHERE W.MGR=M.EMPNO(+) AND M.MGR=B.EMPNO(+);