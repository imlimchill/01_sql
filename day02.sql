-- DAY 02
-- SCOTT ���� EMP ���̺� ��ȸ(�˻�)
SELECT *
  FROM emp
;

-- SCOTT ���� DEPT ���̺� ��ȸ
SELECT *
  FROM dept
;

-- 1) SCOTT ���� emp ���̺��� job�÷�(��)�� ��ȸ
SELECT job
  FROM emp
;

-- 2) emp������ �ߺ��� �����Ͽ� JOB�÷��� ��ȸ
SELECT DISTINCT job
  FROM emp
;
-- => �� JOB�� �ѹ����� ��ȸ�� ����� ���� �� �ִ�.
--    �� ����� �ټ� ������ JOB�� �ִٴ� �� Ȯ���� �� �ִ�.

/* ���� �� �ּ�
JOB 
--------
CLERK
SALESMAN
ANALYST
MANAGER
PRESIDENT
*/

