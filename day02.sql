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
---------
CLERK
SALESMAN
ANALYST
MANAGER
PRESIDENT
*/

-- 3) emp ���̺��� �� ���� �÷� JOB�� DEPTNO�� �����Ͽ� ��ȸ
-- ,�� ������ �ϴ� ����: ���� �� ���̴ϱ� �Ǽ��� ���� �� ����
SELECT job
     , deptno
  FROM emp
;
/*
JOB,    DEPTNO
--------------
CLERK	    20
SALESMAN	30
SALESMAN	30
MANAGER	    20
SALESMAN	30
MANAGER 	30
MANAGER 	10
PRESIDENT	10
SALESMAN	30
CLERK   	30
ANALYST	    20
CLERK	    10
*/

-- 4) emp���̺��� �ߺ��� �����Ͽ� job�� deptno�� ��ȸ
SELECT DISTINCT job
     , deptno
  FROM emp
;
/*
JOB,    DEPTNO
--------------
CLERK	    20
MANAGER	    20
MANAGER 	30
MANAGER 	10
SALESMAN	30
PRESIDENT	10
CLERK   	30
ANALYST 	20
CLERK   	10
*/

-- 5) empü�̺��� �ߺ�����, job��ȸ ORDER BY�� �̿��� ������������ �������ֱ�
SELECT DISTINCT job
  FROM emp 
 ORDER BY job
;
-- 2)�� ������ �������� ���ļ����� �ٸ� ���� Ȯ������
/* 
JOB
---------
ANALYST
CLERK
MANAGER
PRESIDENT
SALESMAN
*/

-- 6) emp���̺��� �ߺ��� �����Ͽ� jop�� ��ȸ�ϰ� ������������ ���� /5)���� ��� ��
SELECT DISTINCT job
  FROM emp
 ORDER BY job DESC
;
/*
JOB
---------
SALESMAN
PRESIDENT
MANAGER
CLERK
ANALYST
*/

-- 7) cmp���̺��� empno(���), ename(�����̸�), job(������ ��ȸ�Ͻÿ�)
SELECT empno
     , ename
     , job
  FROM emp
;
/*
EMPNO,  ENAME,  JOB
-------------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
*/

-- 8) emp���̺��� empno, ename, job, hiredate(�Ի���)�� ��ȸ�Ͻÿ�
SELECT empno
     , ename
     , job
     , hiredate
  FROM emp
;
/*
EMPNO,  ENAME,  JOB,        HIREDATE
-------------------------------------
7369	SMITH	CLERK   	80/12/17
7499	ALLEN	SALESMAN   	81/02/20
7521	WARD	SALESMAN	81/02/22
7566	JONES	MANAGER 	81/04/02
7654	MARTIN	SALESMAN	81/09/28
7698	BLAKE	MANAGER 	81/05/01
7782	CLARK	MANAGER 	81/06/09
7839	KING	PRESIDENT	81/11/17
7844	TURNER	SALESMAN	81/09/08
7900	JAMES	CLERK   	81/12/03
7902	FORD	ANALYST 	81/12/03
7934	MILLER	CLERK   	82/01/23
*/

-- ORDER BY : ����
-- 9) EMP���̺��� COMM�� ���� ���� �޴� ������� ��ȸ (empno, ename, job, hiredate, comm)
SELECT empno
     , ename
     , job
     , hiredate
     , comm
  FROM emp
 ORDER BY comm DESC
;
-- => null�����ʹ� �׻� ū ������ ����Ѵ�. ���� DESC ���Ŀ����� �������� ���ĵȴ�.
/*
EMPNO,  ENAME,  JOB,        HIREDATE,  COMM
--------------------------------------------
7369	SMITH	CLERK   	80/12/17	
7698	BLAKE	MANAGER 	81/05/01	
7902	FORD	ANALYST 	81/12/03	
7900	JAMES	CLERK   	81/12/03	
7839	KING	PRESIDENT	81/11/17	
7566	JONES	MANAGER 	81/04/02	
7934	MILLER	CLERK   	82/01/23	
7782	CLARK	MANAGER 	81/06/09	
7654	MARTIN	SALESMAN	81/09/28	1400
7521	WARD	SALESMAN	81/02/22	500
7499	ALLEN	SALESMAN	81/02/20	300
7844	TURNER	SALESMAN	81/09/08	0
*/

-- 10) emp���̺��� comm�� ���� �������, job�� ���� ��������(����), ename ��������(����) ���� / ASC�� �������� (��������)
--     empno, ename, job, hiredate, comm
SELECT empno
     , ename
     , job
     , hiredate
     , comm
  FROM emp
 ORDER BY comm, job, ename ASC
;
-- comm, job, ename ������� ���ĵȴ�.
/*
EMPNO,  ENAME,  JOB,        HIREDATE,   COMM
--------------------------------------------
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST 	81/12/03	
7900	JAMES	CLERK   	81/12/03	
7934	MILLER	CLERK   	82/01/23	
7369	SMITH	CLERK   	80/12/17	
7698	BLAKE	MANAGER 	81/05/01	
7782	CLARK	MANAGER 	81/06/09	
7566	JONES	MANAGER 	81/04/02	
7839	KING	PRESIDENT	81/11/17	
*/

-- emp���̺��� comm�� ���� ������� job�� ��������, ename�� ������������ ����
-- empno, ename, job, hiredate, comm
SELECT empno
     , ename
     , job
     , hiredate
     , comm
  FROM emp
 ORDER BY comm, job, ename DESC
;
/*
EMPNO,  ENAME,  JOB,        HIREDATE,   COMM
--------------------------------------------
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST 	81/12/03	
7369	SMITH	CLERK   	80/12/17	
7934	MILLER	CLERK   	82/01/23	
7900	JAMES	CLERK   	81/12/03	
7566	JONES	MANAGER 	81/04/02	
7782	CLARK	MANAGER 	81/06/09	
7698	BLAKE	MANAGER 	81/05/01	
7839	KING	PRESIDENT	81/11/17	
*/

-- ALIAS : ��Ī
-- 11) emp���̺��� empmo => Employee No. / ename => Employee Name / job => Job Name �� �ٲپ� ��ȸ
SELECT empno AS "Employee No."
     , ename "Employee Name" --AS Ű����� ��������
     , job "Job Name"        --AS Ű����� ��������
  FROM emp
;
/*
Employee No., Employee Name, Job Name
-------------------------------------
7369    	  SMITH     	CLERK
7499       	  ALLEN     	SALESMAN
7521    	  WARD      	SALESMAN
7566    	  JONES     	MANAGER
7654    	  MARTIN    	SALESMAN
7698    	  BLAKE     	MANAGER
7782    	  CLARK	        MANAGER
7839    	  KING      	PRESIDENT
7844    	  TURNER    	SALESMAN
7900    	  JAMES	        CLERK
7902    	  FORD      	ANALYST
7934    	  MILLER    	CLERK
*/

-- 12) EMP���̺��� �� �÷��� �ѱ� ��Ī�� ��� / ���, �� ��, ����
SELECT empno "���"
     , ename "�� ��"
     , job ����
  FROM emp
;

-- 13) ���̺� ��Ī ����
-- 1. ��Ī���� ���� �ۼ�
SELECT empno
     , ename
  FROM emp
;

--2. SELECT���� �÷� ������ ��, �տ� ���̺� �̸��� ���� �� ����. ���̺� �̸��� �ٿ��� �÷��� ��ȸ
SELECT emp.empno
     , emp,ename
  FROM emp
;

--3. FROM���� emp���̺� e��� ��Ī�� �ְ� SELECT���� �÷� �տ� ���̺� ��Ī e�� �ٿ��� ��ȸ
SELECT e.empno --���̺� ��Ī�� ���Ǵ� ��ġ : �÷� �̸� ��
     , e.ename
  FROM emp e --���̺� ��Ī �����ġ
;
-- ���߿� ���������� �� �����ϰ� ��ȸ����

-- 14) ���� ��Ī ����� ��, �ֵ���ǥ�� ������� ������ => �����½� ��Ī�� ��� �빮��ȭ �Ǿ� ��ȸ��
--     emp���̺��� /empno => EmployeeNo / ename => Employee Name / job => Job Name 
SELECT e.empno AS EmployeeNo
     , e.ename "Employee Name"
     , e.job "Job Name"
  FROM emp e
;
/*
EMPLOYEENO, Employee Name,  Job Name
-----------------------------------
7369    	SMITH       	CLERK
7499    	ALLEN   	    SALESMAN
7521    	WARD          	SALESMAN
7566    	JONES        	MANAGER
7654    	MARTIN    	    SALESMAN
7698    	BLAKE   	    MANAGER
7782    	CLARK   	    MANAGER
7839    	KING    	    PRESIDENT
7844    	TURNER  	    SALESMAN
7900    	JAMES   	    CLERK
7902    	FORD    	    ANALYST
7934    	MILLER  	    CLERK
*/

-- 15) ��Ī�� ������ ���� : �÷��� ��Ī�� �� ��� ORDER BY���� ��Ī ��밡��
--     emp���̺� /empno > ��� /ename > �̸� /job > ���� /hiredate > �Ի��� /comm > ����
--     ����, ����, ename ��� ��������
SELECT e.empno ���
     , e.ename �̸�
     , e.job ����
     , e.hiredate �Ի���
     , comm ����
  FROM emp e
 ORDER BY ����, ����, e.ename
;
-- 10)�� �����ϳ� ��Ī�� ���
-- ��� : ORDER BY ������ ��Ī�� ���� �÷����� ���� �� �� �ִ�.
/*
���,    �̸�,   ����,        �Ի���,     ����
---------------------------------------------
7844	TURNER	SALESMAN	81/09/08	0
7499	ALLEN	SALESMAN	81/02/20	300
7521	WARD	SALESMAN	81/02/22	500
7654	MARTIN	SALESMAN	81/09/28	1400
7902	FORD	ANALYST 	81/12/03	
7900	JAMES	CLERK   	81/12/03	
7934	MILLER	CLERK   	82/01/23	
7369	SMITH	CLERK   	80/12/17	
7698	BLAKE	MANAGER 	81/05/01	
7782	CLARK	MANAGER 	81/06/09	
7566	JONES	MANAGER 	81/04/02	
7839	KING	PRESIDENT	81/11/17	
*/