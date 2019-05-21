
-- day05
-- (6) 연산자 7.연산자 우선수위

/*
  주어진 조건 3개
  1. mgr = 7698
  2. job = 'CLERK'
  3. sal > 1300

  이 조건의 조합 순서에 따라 결과가 어떻게 달리지는지 확인해보자
*/
  
  
-- 1) 매니저의 사번이 7698 이며, 직무는 'CLERK' 이거나 급여가 1300이 넘는 조건을 만족하는 지원의 정보를 조회
--    사번, 이름, 직무, 급여, 매니저 사번

SELECT e.empno
     , e.ename
     , e.job
     , e.sal
     , e.mgr
  FROM emp e
 WHERE e.mgr = 7698
   AND e.job = 'CLERK'
    OR e.sal > 1300
;
/*
EMPNO,  ENAME,  JOB,        SAL,    `MGR
----------------------------------------
7499	ALLEN	SALESMAN	1600	7698
7566	JONES	MANAGER 	2975	7839
7698	BLAKE	MANAGER 	2850	7839
7782	CLARK	MANAGER 	2450	7839
7839	KING	PRESIDENT	5000	
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK   	950	    7698
7902	FORD	ANALYST 	3000	7566
*/

-- 2) 매니저가 7698인 직원 중에서 직무가 'CLERK' 이거나 급여가 1300이 넘는 조건을 만족하는 지원의 정보를 조회
--    사번, 이름, 직무, 급여, 매니저 사번
SELECT e.empno
     , e.ename
     , e.job
     , e.sal
     , e.mgr
  FROM emp e
 WHERE e.mgr = 7698
   AND (e.job = 'CLERK' OR e.sal > 1300)
;
/*
EMPNO,  ENAME,  JOB,        SAL,    MGR
----------------------------------------
7499	ALLEN	SALESMAN	1600	7698
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
*/

-- 3) 직무가 CLERK 이거나 급여가 1300이 넘으면서, 매니저가 7698 인 직원의 정보 조회
--    사번, 이름, 직무, 급여, 매니저 사번
SELECT e.empno
     , e.ename
     , e.job
     , e.sal
     , e.mgr
  FROM emp e
 WHERE e.job = 'CLERK'
    OR e.sal > 1300
   AND e.mgr = 7698
;
/*
EMPNO,  ENAME,   JOB,       SAL,     MGR
-----------------------------------------
9999	J_JAMES	CLERK		
8888	J%JAMES	CLERK		
7369	SMITH	CLERK   	800	    7902
7499	ALLEN	SALESMAN	1600	7698
7844	TURNER	SALESMAN	1500	7698
7900	JAMES	CLERK	    950	    7698
7934	MILLER	CLERK	    1300	7782
*/


----------------------------------------- 6. 함수
-- (3) 단일행 함수
------ 숫자 함수 :
-------- 1. MOD(m,n) : m을 n으로 나눈 나머지 계산 함수
SELECT MOD(10,3)
  FROM emp
;
-- 결과 : 1이 emp테이블의 행 수 만큼 출력

SELECT MOD(10,3)
  FROM dept
;
-- 결과 : 1이 dept테이블의 행 수 만큼 출력

SELECT MOD(10,3)
  FROM daul
;
-- 결과 : 1이 daul테이블의 행 수 만큼 출력


-- 문제 : 각 사원의 급여를 3으로 나눈 나머지를 조회
SELECT MOD(e.sal,3)
  FROM emp e
;

-- 문제 : 각 사원의 급여를 3으로 나눈 나머지를 사번과 함꼐 조회
SELECT e.empno
     , MOD(e.sal,3)
  FROM emp e
;

-------- 2. ROUND(m,n) : 실수 m을 소수전 n + 1자리에서 반올림한 결과 계산

SELECT ROUND(1234.56, 1) -- 1234.6
  FROM dual
;

SELECT ROUND(1234.56, 0) -- 1234.6
  FROM dual
;

SELECT ROUND(1234.46, 0) -- 1234
  FROM dual
;

--        ROUND(m) : n값을 생략하면 n = 0인 것으로 연산한 결과를 돌려줌
SELECT ROUND(1234.56) -- 1234.6
  FROM dual
;

SELECT ROUND(1234.46) -- 1234
  FROM dual
;

-------- 3. TRUNC(m,n) : 실수 m릏 n레서 지정한 자리 아래 소수점 버림
SELECT TRUNC(1234.56, 1)  --1234.5
  FROM dual
;

SELECT TRUNC(1234.56, 0) -- 1234
  FROM dual
;
--------   TRUNC(m) : n이 생략된 경우는 n = 0으로 수행된다. 즉, 

SELECT TRUNC(1234.56) -- 1234
  FROM dual
;

-------- 4. CEIL(n) : 입력된 실수 n에서 같거나 가장 가까운 큰 정수
SELECT CEIL(1234.56) -- 1235
  FROM dual
;
SELECT CEIL(1234) -- 1234
  FROM dual
;
SELECT CEIL(1234.001) -- 1235
  FROM dual
;

-------- 5. FLOOR(n) : 일력된 실수 n에서 같거나 가장 가까운 작은 정수
SELECT FLOOR(1234.56) -- 1234
  FROM dual
;
SELECT FLOOR(1234) -- 1234
  FROM dual
;
SELECT FLOOR(1235.56) -- 1235
  FROM dual
;

-------- 6. WIDTH_BUCKET(expr, min, max, buckets)
-- min ~ max 값 사이를 buckets 개수만큼 나누고
-- expr이 출력하는 값이 어느 buckets에 위치하는지 숫자로 알려줌

-- 급여를 범위를 0 ~ 5000으로 잡고, 한 buckets을 1000단위로 나누면 총 5개의 buckets이 있음을 알 수 있음
-- 각 직원의 급여가 어느 buckets에 위치하는지 구해보자 / 그리고 급여 구간 오름차순
SELECT e.empno
     , e.ename
     , e.sal
     , WIDTH_BUCKET(e.sal, 0, 5000, 5) as "급여 구간"
  FROM emp e
 ORDER BY "급여 구간"
;