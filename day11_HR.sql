-- HR계정 활성화

ALTER SESSION 
  SET "_ORACLE_SCRIPT"=true
;

@C:\app\Administrator\product\18.0.0\dbhomeXE\demo\schema\human_resources\hr_main.sql;

-- 1번입력 : HR
-- 4번입력 : $ORACLE_HOME/demo/schema/loa/
-- 1~ 4 입력 후 HR 계정 테이블 생성된

-- HR 로 접속 후 작업

-- 지금까지 진행했던 DQL 주제별로 3문제씩 스스로 만들고 쿼리 작성하여 문제 해결
-- 2. DISTINCT

-- 1) employees 테이블에서 job_id를 중복하지 않고 출력
SELECT DISTINCT e.job_id
  FROM employees e
;

--2) employees 테이블에서 manager_id를 중복하지 않고 출력
SELECT DISTINCT e.manager_id
  FROM employees e
;

--3) employees 테이블에서 DEPARTMENT_ID를 중복하지 않고 출력
SELECT DISTINCT e.department_id
  FROM employees e
;

-- 3. ORDER BY

-- 1) 테이블에서 수당을 많이 받는 순으로 사번ID, 풀이름, 수당을 정렬하시오
SELECT e.employee_id "사번ID"
     , e.last_name "성"
     , e.first_name "이름"
     , e.commission_pct * e.salary "수당"
  FROM employees e
 ORDER BY e.commission_pct DESC
;
  
-- 2) JOB_ID의 중복을 제거하고 알파벳 순으로 정렬하시오
SELECT DISTINCT e.job_id "직무ID"
  FROM employees e
 ORDER BY e.job_id
;

-- 3) DEPARTMENTS 테이블에서 이름을 알파벳 순으로 정렬하여 모든 정보를 출력하라
--    (단, NULL일 경우 0으로 변경한다.)
SELECT d.department_id "직업 분야ID"
     , d.department_name "직업 분야"
     , NVL(d.manager_id, 0) "매니저ID"
     , d.location_id "지역ID"
  FROM departments d
 ORDER BY d.department_name
;

-- 4. ALIAS 

-- 1) 

-- 5. WHERE

--1) 매니저ID가 122번인 사원의 이름, 핸드폰번호, 이메일을 출력하고 이름을 알파벳 순으로 정렬하라
SELECT e.first_name "이름"
     , e.phone_number "핸드폰 번호"
     , e.email "이메일"
  FROM employees e
 WHERE e.manager_id = 122
 ORDER BY e.first_name
;

-- 2) LOCATIONS 테이블에서 US인 컬럼의 도시, POSTAL_CODE , 주소 출력하기
SELECT l.city
     , l.postal_code
     , l.street_address
  FROM locations l
 WHERE l.country_id = 'US'
;

-- 3) 연봉가 1000이상인 직원 안에서 수당을 받는 직원의 명단의 사원의 이름, 핸드폰번호, 이메일, 연봉, 수당를 출력하라
--    (수당을 많이 받는 순서대로 정렬하라)
SELECT e.first_name "이름"
     , e.phone_number "핸드폰 번호"
     , e.email "이메일"
     , e.salary "연봉"
     , e.commission_pct * e.salary "수당"
  FROM employees e
 WHERE e.salary >= 10000
   AND e.commission_pct > 0
 ORDER BY e.commission_pct DESC
;

-- 6. 연산자

-- 1) 수당을 받지 않은 직원 중 이름에 r이 들어가는 직원의 사번ID, 이름, 급여, 이메일을 출력하시오
--    (급여가 많은 순으로 정렬하시오)
SELECT e.employee_id "사번ID"
     , e.first_name "이름"
     , e.salary "급여"
     , e.email "이메일"
  FROM employees e
 WHERE e.commission_pct IS NULL
   AND e.first_name LIKE '%r%'
    OR e.first_name LIKE '%R%' 
 ORDER BY e.salary DESC
;

--2) 직원들의 연봉의 실급여를 계산해보고 그 급여가 5000 ~ 10000 사이인 직원들의 사번ID, 이름, 실급여를 출력하시오
--   (정렬은 이름의 알파벳 순으로 하되 급여는 적은 순으로)
SELECT e.employee_id
     , e.first_name
     , e.salary + (e.salary * NVL(e.commission_pct, 0)) "연봉 실급여"
  FROM employees e
 WHERE e.salary + (e.salary * NVL(e.commission_pct, 0)) BETWEEN 5000 AND 10000
 ORDER BY e.first_name , e.salary + (e.salary * NVL(e.commission_pct, 0))
;

-- 3) 수당이 있는 직원들중에 수당이 2000이 넘지만 연봉은 10000을 넘지 않는 경우의 사번ID, 이름, 수당, 연봉을 계산해서 출력하라
SELECT e.employee_id "사번ID"
     , e.first_name "이름"
     , e.commission_pct * e.salary "수당"
     , e.salary "연봉"
  FROM employees e
 WHERE e.commission_pct * e.salary > 2000
   AND e.salary < 10000
;

-- 7. 단일행 함수

-- 1) 직무ID가 ST_CLERK인 직원들의 모든 이름을 세 글자로 짤라 오른쪽에 *를 두 개씩 추가하시오
SELECT RPAD(SUBSTR(e.first_name, 1, 3), 5, '*') "이름짜르기"
  FROM employees e
 WHERE e.job_id = 'ST_CLERK'
;

-- 2) 2007년에 입사한 직원 중에서 15일 이후에 입사한 직원들의 명단을 출력하시오 
--      (출력시 년, 월, 일은 각각 출력하시오 / 사번ID, 이름, 년, 월, 일)
SELECT e.employee_id "사번ID"
     , e.first_name "이름"
     , TO_CHAR(e.hire_date, 'YYYY') "입사년"
     , TO_CHAR(e.hire_date, 'MM') "입사월"
     , TO_CHAR(e.hire_date, 'DD') "입사일"
  FROM employees e
 WHERE TO_CHAR(e.hire_date, 'YYYY') = 2007
   AND TO_CHAR(e.hire_date, 'DD') > 15
;

-- 3) JOBS테이블에서 직무 타이틀을 모두 대문자로 바꾸고 연봉이 10000이 되는 직무만 출력하시오
--    (그리고 최대 최소 연봉을 출력할때 $99,999로 정렬하고 직무 타이틀을 알파벳 순으로 정렬하기)
SELECT j.job_id "직무ID"
     , UPPER(j.job_title) "직무 타이틀"
     , TO_CHAR(j.min_salary, '$99,999') "최소연봉"
     , TO_CHAR(j.max_salary, '$99,999') "최대연봉"
  FROM jobs j
 WHERE j.max_salary >= 10000
   AND j.min_salary <= 10000
 ORDER BY j.job_title
;

-- 8. 단일행 DECODE

-- 2005년을 기준으로 2005년 이상은 500, 미만은 200의 월 보너스를 받을 때 받는 연봉이 7000이 넘는 직원의 명단을 출력하라
SELECT DECODE
  FROM employees e
;

-- 9. 단일행 CASE

-- 10. 복수행 함수
-- 1) 각 부서별로 연봉의 평균을 구한 후 그 평균보다 높은 직원의 수를 구하시오
SELECT e.department_id "부서"
     , AVG() "부서 평균"
       
  FROM employees e
;