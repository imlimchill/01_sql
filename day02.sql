-- DAY 02
-- SCOTT 계정 EMP 테이블 조회(검색)
SELECT *
  FROM emp
;

-- SCOTT 계정 DEPT 테이블 조회
SELECT *
  FROM dept
;

-- 1) SCOTT 계정 emp 테이블에서 job컬럼(열)을 조회
SELECT job
  FROM emp
;

-- 2) emp계정에 중복을 제거하여 JOB컬럼을 조회
SELECT DISTINCT job
  FROM emp
;
-- => 각 JOB이 한번씩만 조회된 결과를 얻을 수 있다.
--    이 결과로 다섯 종류의 JOB가 있다는 걸 확인할 수 있다.

/* 다중 행 주석
JOB 
--------
CLERK
SALESMAN
ANALYST
MANAGER
PRESIDENT
*/

