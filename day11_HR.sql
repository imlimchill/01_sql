-- HR���� Ȱ��ȭ

ALTER SESSION 
  SET "_ORACLE_SCRIPT"=true
;

@C:\app\Administrator\product\18.0.0\dbhomeXE\demo\schema\human_resources\hr_main.sql;

-- 1���Է� : HR
-- 4���Է� : $ORACLE_HOME/demo/schema/loa/
-- 1~ 4 �Է� �� HR ���� ���̺� ������

-- HR �� ���� �� �۾�

-- ���ݱ��� �����ߴ� DQL �������� 3������ ������ ����� ���� �ۼ��Ͽ� ���� �ذ�
-- 2. DISTINCT

-- 1) employees ���̺��� job_id�� �ߺ����� �ʰ� ���
SELECT DISTINCT e.job_id
  FROM employees e
;

--2) employees ���̺��� manager_id�� �ߺ����� �ʰ� ���
SELECT DISTINCT e.manager_id
  FROM employees e
;

--3) employees ���̺��� DEPARTMENT_ID�� �ߺ����� �ʰ� ���
SELECT DISTINCT e.department_id
  FROM employees e
;

-- 3. ORDER BY

-- 1) ���̺��� ������ ���� �޴� ������ ���ID, Ǯ�̸�, ������ �����Ͻÿ�
SELECT e.employee_id "���ID"
     , e.last_name "��"
     , e.first_name "�̸�"
     , e.commission_pct * e.salary "����"
  FROM employees e
 ORDER BY e.commission_pct DESC
;
  
-- 2) JOB_ID�� �ߺ��� �����ϰ� ���ĺ� ������ �����Ͻÿ�
SELECT DISTINCT e.job_id "����ID"
  FROM employees e
 ORDER BY e.job_id
;

-- 3) DEPARTMENTS ���̺��� �̸��� ���ĺ� ������ �����Ͽ� ��� ������ ����϶�
--    (��, NULL�� ��� 0���� �����Ѵ�.)
SELECT d.department_id "���� �о�ID"
     , d.department_name "���� �о�"
     , NVL(d.manager_id, 0) "�Ŵ���ID"
     , d.location_id "����ID"
  FROM departments d
 ORDER BY d.department_name
;

-- 4. ALIAS 

-- 1) 

-- 5. WHERE

--1) �Ŵ���ID�� 122���� ����� �̸�, �ڵ�����ȣ, �̸����� ����ϰ� �̸��� ���ĺ� ������ �����϶�
SELECT e.first_name "�̸�"
     , e.phone_number "�ڵ��� ��ȣ"
     , e.email "�̸���"
  FROM employees e
 WHERE e.manager_id = 122
 ORDER BY e.first_name
;

-- 2) LOCATIONS ���̺��� US�� �÷��� ����, POSTAL_CODE , �ּ� ����ϱ�
SELECT l.city
     , l.postal_code
     , l.street_address
  FROM locations l
 WHERE l.country_id = 'US'
;

-- 3) ������ 1000�̻��� ���� �ȿ��� ������ �޴� ������ ����� ����� �̸�, �ڵ�����ȣ, �̸���, ����, ���縦 ����϶�
--    (������ ���� �޴� ������� �����϶�)
SELECT e.first_name "�̸�"
     , e.phone_number "�ڵ��� ��ȣ"
     , e.email "�̸���"
     , e.salary "����"
     , e.commission_pct * e.salary "����"
  FROM employees e
 WHERE e.salary >= 10000
   AND e.commission_pct > 0
 ORDER BY e.commission_pct DESC
;

-- 6. ������

-- 1) ������ ���� ���� ���� �� �̸��� r�� ���� ������ ���ID, �̸�, �޿�, �̸����� ����Ͻÿ�
--    (�޿��� ���� ������ �����Ͻÿ�)
SELECT e.employee_id "���ID"
     , e.first_name "�̸�"
     , e.salary "�޿�"
     , e.email "�̸���"
  FROM employees e
 WHERE e.commission_pct IS NULL
   AND e.first_name LIKE '%r%'
    OR e.first_name LIKE '%R%' 
 ORDER BY e.salary DESC
;

--2) �������� ������ �Ǳ޿��� ����غ��� �� �޿��� 5000 ~ 10000 ������ �������� ���ID, �̸�, �Ǳ޿��� ����Ͻÿ�
--   (������ �̸��� ���ĺ� ������ �ϵ� �޿��� ���� ������)
SELECT e.employee_id
     , e.first_name
     , e.salary + (e.salary * NVL(e.commission_pct, 0)) "���� �Ǳ޿�"
  FROM employees e
 WHERE e.salary + (e.salary * NVL(e.commission_pct, 0)) BETWEEN 5000 AND 10000
 ORDER BY e.first_name , e.salary + (e.salary * NVL(e.commission_pct, 0))
;

-- 3) ������ �ִ� �������߿� ������ 2000�� ������ ������ 10000�� ���� �ʴ� ����� ���ID, �̸�, ����, ������ ����ؼ� ����϶�
SELECT e.employee_id "���ID"
     , e.first_name "�̸�"
     , e.commission_pct * e.salary "����"
     , e.salary "����"
  FROM employees e
 WHERE e.commission_pct * e.salary > 2000
   AND e.salary < 10000
;

-- 7. ������ �Լ�

-- 1) ����ID�� ST_CLERK�� �������� ��� �̸��� �� ���ڷ� ©�� �����ʿ� *�� �� ���� �߰��Ͻÿ�
SELECT RPAD(SUBSTR(e.first_name, 1, 3), 5, '*') "�̸�¥����"
  FROM employees e
 WHERE e.job_id = 'ST_CLERK'
;

-- 2) 2007�⿡ �Ի��� ���� �߿��� 15�� ���Ŀ� �Ի��� �������� ����� ����Ͻÿ� 
--      (��½� ��, ��, ���� ���� ����Ͻÿ� / ���ID, �̸�, ��, ��, ��)
SELECT e.employee_id "���ID"
     , e.first_name "�̸�"
     , TO_CHAR(e.hire_date, 'YYYY') "�Ի��"
     , TO_CHAR(e.hire_date, 'MM') "�Ի��"
     , TO_CHAR(e.hire_date, 'DD') "�Ի���"
  FROM employees e
 WHERE TO_CHAR(e.hire_date, 'YYYY') = 2007
   AND TO_CHAR(e.hire_date, 'DD') > 15
;

-- 3) JOBS���̺��� ���� Ÿ��Ʋ�� ��� �빮�ڷ� �ٲٰ� ������ 10000�� �Ǵ� ������ ����Ͻÿ�
--    (�׸��� �ִ� �ּ� ������ ����Ҷ� $99,999�� �����ϰ� ���� Ÿ��Ʋ�� ���ĺ� ������ �����ϱ�)
SELECT j.job_id "����ID"
     , UPPER(j.job_title) "���� Ÿ��Ʋ"
     , TO_CHAR(j.min_salary, '$99,999') "�ּҿ���"
     , TO_CHAR(j.max_salary, '$99,999') "�ִ뿬��"
  FROM jobs j
 WHERE j.max_salary >= 10000
   AND j.min_salary <= 10000
 ORDER BY j.job_title
;

-- 8. ������ DECODE

-- 2005���� �������� 2005�� �̻��� 500, �̸��� 200�� �� ���ʽ��� ���� �� �޴� ������ 7000�� �Ѵ� ������ ����� ����϶�
SELECT DECODE
  FROM employees e
;

-- 9. ������ CASE

-- 10. ������ �Լ�
-- 1) �� �μ����� ������ ����� ���� �� �� ��պ��� ���� ������ ���� ���Ͻÿ�
SELECT e.department_id "�μ�"
     , AVG() "�μ� ���"
       
  FROM employees e
;