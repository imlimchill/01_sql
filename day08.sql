-- SQL day08
-- 단일행 함수 계속

-- (3) 단일행 함수
--- 6) CASE
--- job별로 경조사비를 급여대비 일정비율로 지금
/*
    CLERK : 5%
    SALESMAN : 4%
    MANAGER : 3.7%
    ANALYST : 3%
    PRESIDENT : 1.5%
*/

-- 1. Simple CASE 구문으로 구현 : DECODE와 거릐 유사, 동일비교만 가능
--    DECODE 와 다른 점 : 괄호가 없음, 콤마 대신 when, then, else 등을 사용

SELECT e.empno
     , e.ename
     , e.job
     , CASE e.job WHEN 'CLERK'      THEN e.sal * 0.05
                  WHEN 'SALESMAN'   THEN e.sal * 0.04
                  WHEN 'MANAGER'    THEN e.sal * 0.037
                  WHEN 'ANALYST'    THEN e.sal * 0.03
                  WHEN 'PRESIDENT'  THEN e.sal * 0.015
        END AS "경조사 지원금"
  FROM emp e
;
/*
EMPNO,  ENAME,  JOB,      경조사 지원금
-------------------------------------
9999	J_JAMES	CLERK	
8888	J%JAMES	CLERK	
7369	SMITH	CLERK	    40
7499	ALLEN	SALESMAN	64
7521	WARD	SALESMAN	50
7566	JONES	MANAGER	    110.075
7654	MARTIN	SALESMAN	50
7698	BLAKE	MANAGER	    105.45
7782	CLARK	MANAGER	    90.65
7839	KING	PRESIDENT	75
7844	TURNER	SALESMAN	60
7900	JAMES	CLERK	    47.5
7902	FORD	ANALYST	    90
7934	MILLER	CLERK	    65
*/


-- 2. Searched CASE 구문으로 구현
SELECT e.empno
     , e.ename
     , e.job
     , CASE WHEN e.job = 'CLERK'     THEN e.sal * 0.05
            WHEN e.job = 'SALESMAN'  THEN e.sal * 0.04
            WHEN e.job = 'MANAGER'   THEN e.sal * 0.037
            WHEN e.job = 'ANALYST'   THEN e.sal * 0.03
            WHEN e.job = 'PRESIDENT' THEN e.sal * 0.015
            ELSE 10
        END AS "경조사 지원금"
  FROM emp e
;

-- CASE 결과에 숫자 통화 패턴 씌우기
-- : $기호, 숫자 세자리 끊어 읽기, 소수점 2자리 반올림
SELECT e.empno
     , e.ename
     , e.job
     , to_char(CASE WHEN e.job = 'CLERK'     THEN e.sal * 0.05
                    WHEN e.job = 'SALESMAN'  THEN e.sal * 0.04
                    WHEN e.job = 'MANAGER'   THEN e.sal * 0.037
                    WHEN e.job = 'ANALYST'   THEN e.sal * 0.03
                    WHEN e.job = 'PRESIDENT' THEN e.sal * 0.015
                    ELSE 10
                END , '$9,999.99') AS "경조사 지원금"
  FROM emp e
;
/*
EMPNO,  ENAME,  JOB,        경조사 지원금
-----------------------------------------
9999	J_JAMES	CLERK	
8888	J%JAMES	CLERK	
7369	SMITH	CLERK	        $40.00
7499	ALLEN	SALESMAN	    $64.00
7521	WARD	SALESMAN	    $50.00
7566	JONES	MANAGER	       $110.08
7654	MARTIN	SALESMAN	    $50.00
7698	BLAKE	MANAGER	       $105.45
7782	CLARK	MANAGER	        $90.65
7839	KING	PRESIDENT	    $75.00
7844	TURNER	SALESMAN	    $60.00
7900	JAMES	CLERK	        $47.50
7902	FORD	ANALYST	        $90.00
7934	MILLER	CLERK	        $65.00
*/

/*
SALGRADE (급여 등급) 테이블 내용
GRADE,  LOSAL,  HISAL
---------------------
1	    700	    1200  > 700 ~ 1200사이는 등급이 1
2	    1201	1400
3	    1401	2000
4   	2001	3000
5	    3001	9999
*/

-- 문제 : 제공되는 급여 등급을 바탕으로 각 직원의 급여 등급을 CASE 문으로 구해보자
--        사번, 이름, 급여, 급여 등급을 조회 / 급여 등급이 높은 순으로 정렬하시오.
-- 1) 관계연산자를 사용하는 방법
SELECT e.empno
     , e.ename
     , to_char(e.sal, '$9,999') "급여"
     , CASE WHEN e.sal > 3000 THEN 5
            WHEN e.sal > 2000 THEN 4
            WHEN e.sal > 1400 THEN 3
            WHEN e.sal > 1200 THEN 2
            WHEN e.sal > 700  THEN 1
        END AS "급여 등급"
  FROM emp e
 ORDER BY e.sal DESC
;

SELECT e.empno
     , e.ename
     , to_char(e.sal, '$9,999') "급여"
     , CASE WHEN e.sal >= 700  AND e.sal <= 1200 THEN 1
            WHEN e.sal >= 1200 AND e.sal <= 1400 THEN 2
            WHEN e.sal >= 1400 AND e.sal <= 2000 THEN 3
            WHEN e.sal >= 2000 AND e.sal <= 3000 THEN 4
            WHEN e.sal >= 3000 AND e.sal <= 9999 THEN 5
        END AS "급여 등급"
  FROM emp e
 ORDER BY "급여 등급" DESC
;

-- 2) BETWEEN ~ AND 을 사용하는 방법 
SELECT e.empno
     , e.ename
     , to_char(e.sal, '$9,999') "급여"
     , CASE WHEN e.sal BETWEEN 700  AND 1200 THEN 1
            WHEN e.sal BETWEEN 1201 AND 1400 THEN 2
            WHEN e.sal BETWEEN 1401 AND 2000 THEN 3
            WHEN e.sal BETWEEN 2001 AND 3000 THEN 4
            WHEN e.sal BETWEEN 3001 AND 9999 THEN 5
        END AS "급여 등급"
  FROM emp e
 ORDER BY e.sal DESC
;
/*
EMPNO,  ENAME,   급여,   급여 등급
----------------------------------
9999	J_JAMES		
8888	J%JAMES		
7839	KING	 $5,000	    5
7902	FORD	 $3,000	    4
7566	JONES	 $2,975	    4
7698	BLAKE	 $2,850	    4
7782	CLARK	 $2,450	    4
7499	ALLEN	 $1,600	    3
7844	TURNER	 $1,500	    3
7934	MILLER	 $1,300	    2
7521	WARD	 $1,250	    2
7654	MARTIN	 $1,250	    2   
7900	JAMES	   $950	    1
7369	SMITH	   $800	    1
*/

-- 급여가 NULL일 때, 급여등급이 0이 나오도록 추가
SELECT e.empno
     , e.ename
     , to_char(e.sal, '$9,999') "급여"
     , CASE WHEN e.sal IS NULL               THEN 0
            WHEN e.sal BETWEEN 700  AND 1200 THEN 1
            WHEN e.sal BETWEEN 1201 AND 1400 THEN 2
            WHEN e.sal BETWEEN 1401 AND 2000 THEN 3
            WHEN e.sal BETWEEN 2001 AND 3000 THEN 4
            WHEN e.sal BETWEEN 3001 AND 9999 THEN 5
        END AS "급여 등급"
  FROM emp e
 ORDER BY e.sal DESC
;
/*
EMPNO,  ENAME,   급여,   급여 등급
----------------------------------
9999	J_JAMES		        0
8888	J%JAMES		        0
7839	KING	 $5,000	    5
7902	FORD	 $3,000	    4
7566	JONES	 $2,975	    4
7698	BLAKE	 $2,850	    4
7782	CLARK	 $2,450	    4
7499	ALLEN	 $1,600	    3
7844	TURNER	 $1,500	    3
7934	MILLER	 $1,300	    2
7521	WARD	 $1,250	    2
7654	MARTIN	 $1,250	    2
7900	JAMES	   $950	    1
7369	SMITH	   $800	    1
*/