-- day09 : 

-- 2. ������ �Լ�(�׷��Լ�)

-- 1) COUNT(*) : FROM���� ������ Ư�� ���̺��� ���� ����(������ ����)�� �����ִ� �Լ�
--               NULL ���� ó���ϴ� "����"�� �׷��Լ�


-- COUNT(expr) : expr���� ������ ���� NULL�����ϰ� �����ִ� �Լ�
-- dept, salgrade ���̺��� ��ü ������ ���� ��ȸ
-- 1. dept ���̺� ��ȸ
SELECT d.*
  FROM dept d
;
/* ������ �Լ��� ���� ���� :
----------------------------
10	    ACCOUNTING	NEW YORK ====> SUBSTR(dname, 1, 5) ====> ACCOU
20	    RESEARCH	DALLAS   ====> SUBSTR(dname, 1, 5) ====> RESEA
30	    SALES	    CHICAGO  ====> SUBSTR(dname, 1, 5) ====> SALES
40	    OPERATIONS	BOSTON   ====> SUBSTR(dname, 1, 5) ====> OPERA
*/

/* �׷��Լ�(COUNT(*))�� ���� ���� :
-----------------------------------
10	    ACCOUNTING	NEW YORK ====>
20	    RESEARCH	DALLAS   ====> COUNT(*) ====> 4
30	    SALES	    CHICAGO  ====>
40	    OPERATIONS	BOSTON   ====>
*/

-- 2. dept ���̺��� ������ ���� ��ȸ : COUNT(*) ���
SELECT COUNT(*) "�μ� ����"
  FROM dept d
;
/*
�μ� ����
---------
        4
*/

-- salgrade(�޿����) ���̺��� �޿���� ������ ��ȸ
SELECT COUNT(*) "�޿� ��� ����"
  FROM salgrade
;
/*
�޿� ��� ����
--------------
            5
*/
SELECT s.*
  FROM salgrade s
;
/*
1	700	    1200 ====>
2	1201	1400 ====>
3	1401	2000 ====> COUNT(*) ====> 5
4	2001	3000 ====>
5	3001	9999 ====>
*/

-- COUNT(expr) �� NULL �����׸� ó������ ���ϴ� �� Ȯ���� ���� ������ �߰�
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME) VALUES ('7777', 'JJ')
COMMIT;

-- emp ���̺��� job�÷��� ������ ������ ī��Ʈ
SELECT COUNT(e.job) "������ ������ ������ ��"
  FROM emp e
;
/*
������ ������ ������ ��
-----------------------
                    14
9999	J_JAMES	CLERK       ====>
8888	J%JAMES	CLERK       ====>
7369	SMITH	CLERK       ====>
7499	ALLEN	SALESMAN    ====>
7521	WARD	SALESMAN    ====>
7566	JONES	MANAGER     ====>
7654	MARTIN	SALESMAN    ====>
7698	BLAKE	MANAGER     ====>
7782	CLARK	MANAGER     ====> ������ ���� ���� �÷��� job�� null�� ���� ó���� ���� �ʴ´�.
7839	KING	PRESIDENT   ====>
7844	TURNER	SALESMAN    ====> COUNT(e.job) ====> 14
7900	JAMES	CLERK       ====>
7902	FORD	ANALYST     ====>
7934	MILLER	CLERK       ====>
7777	JJ	    (NULL)      ====>
*/

-- ����) ȸ�翡 �Ŵ����� ������ ������ ����ΰ� / ��Ī : ��簡 �ִ� ������ ��
SELECT COUNT(e.mgr) "��簡 �ִ� ������ ��"
  FROM emp e
;
/*
��簡 �ִ� ������ ��
---------------------
                   11
*/

-- ����) �Ŵ������� �ð� �ִ� ������ ����ΰ�?
-- 1. emp ���̺��� mgr �÷��� ������ ���¸� �ľ� (������)
-- 2. mgr�÷��� �ߺ������͸� ����
SELECT DISTINCT e.mgr
  FROM emp e
;
/*
7782
7698
7902
7566
(NULL)
7839
*/

-- 3. �ߺ��� �����Ͱ� ���ŵ� ����� ī��Ʈ
SELECT COUNT(DISTINCT e.mgr) "�Ŵ��� ��"
  FROM emp e
;
/*
�Ŵ��� ��
---------
        5
*/

-- ����) �μ��� ������ ������ ����̳� �ִ°�?
SELECT COUNT(e.deptno) "�μ� ���� �ο�"
  FROM emp e
;
/*
�μ� ���� �ο�
--------------
            12
*/

-- count(*) �� �ƴ� COUNT(expr)�� ����� ��쿡��
SELECT e.deptno
  FROM emp e
 WHERE e.deptno IS NOT NULL
;
--�� ������ ����� ī��Ʈ �� ������ ������ �� ����

-- ����) ��ü�ο�, �μ� ���� �ο�, �μ� �̹��� �ο��� ���Ͻÿ�
SELECT COUNT(*) "��ü�ο�"
     , COUNT(e.deptno) "�μ� ���� �ο�"
     , COUNT(*) - COUNT(e.deptno) "�μ� �̹��� �ο�"
  FROM emp e
;
/*
��ü�ο�, �μ� ���� �ο�, �μ� �̹��� �ο�
------------------------------------------
      15	           12	            3
*/

-- SUM(expr) : NULL �׸��� �����ϰ� �ջ� ������ ���� ��� ���� ����� ���
-- SALESMAN ���� ���������� ���غ���
SELECT SUM(e.comm) "���� ����"
  FROM emp e
;
/*
  COMM
------
(NULL) 
(NULL) 
(NULL) 
   300 ====>
   500 ====>
(NULL) 
  1400 ====>
(NULL)        SUM(e.comm) ====> 2200 : �ڵ����� NULL �÷�����
(NULL) 
(NULL) 
     0 ====>
(NULL) 
(NULL) 
(NULL) 
(NULL) 
*/

SELECT SUM(e.comm) "���� ����"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
  COMM
------
   300 ====>
   500 ====>
  1400 ====>     SUM(e.comm) ====> 2200 : �ڵ����� NULL �÷�����
     0 ====> 
*/

-- ���� ���� ����� ���� ��� ������ ���� : $, ���ڸ� �����б� ����
SELECT to_char(SUM(e.comm), '$9,999') "���� ����"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
���� ����
---------
 $2,200
*/

-- 3) AVG(expr) : NULL ���� �����ϰ� ���갡���� �׸��� ��� ����� ����

-- SALESMAN �� ���� ����� ���غ���
SELECT AVG(e.comm) "���� ���"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;

--  ���� ��� ����� ���� ��� ���� : $, ���ڱ� �����б�
SELECT to_char(AVG(e.comm), '$9,999') "���� ���"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;

-- MAX(expr) : expr �� ������ �� �� �ִ��� ���� 
-- expr�� ������ ���� ���ĺ��� ���ʿ� ��ġ�� ���ڸ� �ִ����� ���

-- �̸��� ���� ������ ����
SELECT MAX(e.ename) "�̸��� ���� ������ ����"
  FROM emp e
;
/*
�̸��� ���� ������ ����
------------------------
 WARD
*/

-- MIN(expr) : expr �� ������ �� �� �ּڰ��� ���� 
-- expr�� ������ ���� ���ĺ��� ���ʿ� ��ġ�� ���ڸ� �ּڰ����� ���

-- �̸��� ���� ���� ����
SELECT MIN(e.ename) "�̸��� ���� ���� ����"
  FROM emp e
;
/*
�̸��� ���� ���� ����
---------------------
ALLEN
*/


---- 3. GROUP BY ���� ���
-- ����) �� �μ����� �޿��� ����, ���, �ִ�, �ּ�

-- �� �μ����� �޿��� ���� ��ȸ�Ϸ���
--    ���� : SUM() �� ���
--    �׷�ȭ ������ �μ���ȣ(deptno) �� ���
--    GROUP BY ���� �����ؾ� ��

-- a) ���� emp ���̺��� �޿� ������ ���ϴ� ���� �ۼ�
SELECT SUM(e.sal)
  FROM emp e
;

-- b) �μ���ȣ�� �������� �׷�ȭ ����
-- SUM()�� �׷��Լ���.
-- GROUP BY ���� �����ϸ� �׷�ȭ �����ϴ�.
-- �׷�ȭ�� �Ϸ��� ����÷��� GROUP BY ���� �����ؾ� ��
SELECT e.deptno �μ���ȣ -- �׷�ȭ ���� �÷����� SELECT ���� ����
     , SUM(e.sal) "�μ� �޿� ����" -- �׷��Լ��� ���� �÷�
  FROM emp e
 GROUP BY e.deptno -- �׷�ȭ ���� �÷����� GROUP BY ���� ����
 ORDER BY e.deptno -- �μ���ȣ ����
;
/*
�μ���ȣ, �μ� �޿� ����
------------------------
10	        8750
20	        6775
30	        9400
	
*/

-- GROUP BY ���� �׷�ȭ ���� �÷��� �ƴ� ���� SELECT ���� �����ϸ� ����, ����Ұ�
SELECT e.deptno �μ���ȣ -- �׷�ȭ ���� �÷����� SELECT ���� ����
     , e.job -- �׷�ȭ �����÷��� �ƴѿ� SELECT ���� ���� -> ������ ����
     , SUM(e.sal) "�μ� �޿� ����" -- �׷��Լ��� ���� �÷�
  FROM emp e
 GROUP BY e.deptno -- �׷�ȭ ���� �÷����� GROUP BY ���� ����
 ORDER BY e.deptno -- �μ���ȣ ����
;
/*
ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
00979. 00000 -  "not a GROUP BY expression"
*/

-- ����) �μ��� �޿��� ����, ���, �ִ�, �ּ�
SELECT e.deptno �μ���ȣ 
     , SUM(e.sal) "�μ� �޿� ����" 
     , AVG(e.sal) "�μ� �޿� ���"
     , MAX(e.sal) "�μ� �޿� �ִ�"
     , MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;

--���� ���� ����
SELECT e.deptno �μ���ȣ 
     , to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;
/*
�μ���ȣ, �޿� ����, �޿� ���, �޿� �ִ�, �޿� �ּ�
----------------------------------------------------
10	     $8,750	     $2,916.67	 $5,000	    $1,300
20	     $6,775	     $2,258.33	 $3,000	      $800
30	     $9,400	     $1,566.67	 $2,850	      $950
				
*/
-- �μ���ȣ�� ������ ����
SELECT to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;

/*
���� ������ ��������� ��Ȯ�ϰ� ��� �μ��� ������� �� �� ���ٴ� ������ ����

�׷���, GROUP BY ���� �����ϴ� �����÷��� SELECT ���� �Ȱ��� �����ϴ� ���� ��� �ؼ��� ���ϴ�.

SELECT ���� ������ �÷��߿��� �׷��Լ��� ������ �ʴ� �÷��� ���� ������ ���� ������ ����Ǵ� ���̴�.
*/

-- ����) �μ���, ������ �޿��� ����, ���, �ִ�, �ּ�
SELECT e.deptno �μ���ȣ 
     , e.job
     , SUM(e.sal) "�μ� �޿� ����" 
     , AVG(e.sal) "�μ� �޿� ���"
     , MAX(e.sal) "�μ� �޿� �ִ�"
     , MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno, e.job
 ORDER BY e.deptno
;
/*
�μ���ȣ, JOB,     �޿� ����, �޿� ���, �޿� �ִ�, �޿� �ּ�
-----------------------------------------------------------------------------
    10	  CLERK	    1300	    1300	 1300	    1300
    10	  MANAGER	2450	    2450	 2450	    2450
    10	  PRESIDENT	5000	    5000	 5000	    5000
    20	  ANALYST	3000	    3000	 3000	    3000
    20	  CLERK	    800	        800	     800	    800
    20	  MANAGER	2975	    2975	 2975	    2975
    30	  CLERK	    950	        950	     950	    950
    30	  MANAGER	2850	    2850	 2850	    2850
    30	  SALESMAN	5600	    1400	 1600	    1250
*/


-- ������Ȳ
-- a) GROUP BY ������ ������ ���
SELECT e.deptno �μ���ȣ 
     , e.job                        -- SELECT ���� ����
     , SUM(e.sal) "�μ� �޿� ����" 
     , AVG(e.sal) "�μ� �޿� ���"
     , MAX(e.sal) "�μ� �޿� �ִ�"
     , MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno                  -- GROUP BY ������ ������ e.job
 ORDER BY e.deptno
;
/*
ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
00979. 00000 -  "not a GROUP BY expression"
*/

-- b) SELECT ���� �׷��Լ��� �Ϲ� �÷��� ���� ���� > GROUP BY �� ��ü�� ������ ���
SELECT e.deptno �μ���ȣ 
     , e.job
     , SUM(e.sal) "�μ� �޿� ����" 
     , AVG(e.sal) "�μ� �޿� ���"
     , MAX(e.sal) "�μ� �޿� �ִ�"
     , MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e
 --GROUP BY e.deptno, e.job
 ORDER BY e.deptno
;
/*
ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
00937. 00000 -  "not a single-group group function"
*/

-- ����) ����(job) �� �޿��� ����, ���, �ִ�, �ּ� / ��Ī : ����, �޿�����, �޿����, �ִ�޿�, �ּұ޿�
SELECT e.job "����"
     , to_char(SUM(e.sal), '$9,999') "�޿�����"
     , to_char(AVG(e.sal), '$9,999.99') "�޿����"
     , to_char(MAX(e.sal), '$9,999') "�ִ�޿�"
     , to_char(MIN(e.sal), '$9,999') "�ּұ޿�"
  FROM emp e
 GROUP BY e.job
 ORDER BY e.job
;

-- ������ �̹����� ������� ������ ��� '���� �̹���' ���� ���
SELECT NVL(e.job, '���� �̹���') "����"
     , to_char(SUM(e.sal), '$9,999') "�޿�����"
     , to_char(AVG(e.sal), '$9,999.99') "�޿����"
     , to_char(MAX(e.sal), '$9,999') "�ִ�޿�"
     , to_char(MIN(e.sal), '$9,999') "�ּұ޿�"
  FROM emp e
 GROUP BY e.job
 ORDER BY e.job
;
/*
����,     �޿�����,  �޿����,  �ִ�޿�, �ּұ޿�
--------------------------------------------------
ANALYST	  $3,000	 $3,000.00	 $3,000	  $3,000
CLERK	  $3,050	 $1,016.67	 $1,300	    $800
MANAGER	  $8,275	 $2,758.33	 $2,975	  $2,450
PRESIDENT $5,000	 $5,000.00	 $5,000	  $5,000
SALESMAN  $5,600	 $1,400.00	 $1,600	  $1,250
���� �̹���
*/

-- �μ���, ~~~ / �μ���ȣ�� NULL�� ��� '�μ��̹���' ���� ���
SELECT NVL(e.deptno, '�μ� �̹���') �μ���ȣ 
     , to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;
/* deptno�� ����, '�μ� �̹���'�� ���� �������̹Ƿ� Ÿ�� ����ġ
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"
*/

-- �ذ��� : deptno�� ���� ����ȭ
SELECT NVL(to_char(e.deptno), '�μ� �̹���') �μ���ȣ 
     , to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;

-- ���ڸ� ���ڷ� ���� : ���տ�����(||) �� ���
SELECT NVL(e.deptno || '', '�μ� �̹���') �μ���ȣ 
     , to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;

-- NVL, DECODE, TO_CHAR�������� �ذ�
SELECT DECODE(NVL(e.deptno, 0), e.deptno, TO_CHAR(e.deptno)
                              , 0       , '�μ� �̹���'  ) "�μ���ȣ"
     , to_char(SUM(e.sal), '$9,999') "�޿� ����" 
     , to_char(AVG(e.sal), '$9,999.99') "�޿� ���"
     , to_char(MAX(e.sal), '$9,999') "�޿� �ִ�"
     , to_char(MIN(e.sal), '$9,999') "�޿� �ּ�"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY e.deptno
;


------ 4. HAVING ���� ���

-- GROUP BY ����� ������ �ɾ �� ����� ������ ������ ���Ǵ� ��
-- SELECT ������ ���� ���� ������ GROUP BY ������ ���� ����Ǵ� WHERE ���δ� GROUP BY ����� ������ �� ����.
-- ���� GROUP BY ���� ��������� ������ HAVING���� �����Ѵ�.

-- ����) �μ��� �޿� ����� 2000�̻��� �μ��� ��ȸ�϶�

-- a) �μ��� �޿� ����� ���Ѵ�.
SELECT e.deptno "�μ���ȣ"
     , AVG(e.sal) "�޿����"
  FROM emp e
 GROUP BY e.deptno
;

-- b) a�� ������� �޿� ����� 2000�̻��� ���� �����. >> HAVING ���� ��� ����
SELECT e.deptno "�μ���ȣ"
     , AVG(e.sal) "�޿����"
  FROM emp e
 GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000
;

-- ����� ���� ����
SELECT e.deptno "�μ���ȣ"
     , TO_CHAR(AVG(e.sal), '$9,999.99') "�޿����"
  FROM emp e
 GROUP BY e.deptno
HAVING AVG(e.sal) >= 2000
;

-- ���� : HAVING ���� ��Ī�� ����� �� ����
SELECT e.deptno "�μ���ȣ"
     , TO_CHAR(AVG(e.sal), '$9,999.99') "�޿����"
  FROM emp e
 GROUP BY e.deptno
HAVING "�޿����" >= 2000 -- ��Ī ��� �Ұ�
;
/*
ORA-00904: "�޿����": �������� �ĺ���
00904. 00000 -  "%s: invalid identifier"
*/

-- HAVING ���� �����ϴ� ��� SELECT ������ ���� ���� ����
/*
 1. FROM        ���� ���̺� �� �� ��θ� �������
 2. WHERE       ���� ���ǿ� �´� �ุ �����ϰ�
 3. GROUP BY    ���� ���� �÷�, ��(�Լ� ��) ���� �׷�ȭ ����
 4. HAVING      ���� ������ ������Ű�� �׷��ุ ����
 5.             4���� ���õ� �׷� ������ ���� �࿡ ���ؼ�
 6. SELECT      ���� ��õ� �÷�, ��(�Լ� ��) �� Ǯ��
 7. ORDER BY    �� �ִٸ� ���� ���ǿ� ���߾� ���� �����Ͽ� ��� ���
*/

----------------------------------------------------------------------
-- ������ �ǽ�

-- 1. �Ŵ�����, ���������� ���� ���ϰ�, ���� ������ ����
--   : mgr �÷��� �׷�ȭ ���� �÷�
SELECT e.mgr "�Ŵ��� ��ȣ"
     , COUNT(e.mgr) "���������� ��"
  FROM emp e
 GROUP BY e.mgr
 ORDER BY COUNT(e.mgr) DESC
;
/*

�Ŵ��� ��ȣ, ���������� ��
--------------------------
7698	        5
7839	        3
7566	        1
7782	        1
7902	        1
                0
*/

-- 2.1 �μ��� �ο��� ���ϰ�, �ο��� ���� ������ ����
--    : deptno �÷��� �׷�ȭ ���� �÷�
SELECT e.deptno "�μ�"
     , COUNT(e.deptno) "�μ��� �ο���"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY COUNT(e.deptno) DESC
;
/*
�μ�, �μ��� �ο���
-------------------
 30	    6
 20	    3
 10	    3
        0
*/


-- 2.2 �μ� ��ġ �̹��� �ο� ó��
SELECT NVL(e.deptno || '', '�μ� �̹���') "�μ�"
     , COUNT(e.deptno) "�μ��� �ο���"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY COUNT(e.deptno) DESC
;
/*
�μ�, �μ��� �ο���
-------------------
 30	        6
 20	        3
 10	        3
�μ� �̹���	0
*/

-- 3.1 ������ �޿� ��� ���ϰ�, �޿���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT e.job "����"
     , to_char(AVG(e.sal), '$9,999.99') "�޿����"
  FROM emp e
 GROUP BY e.job
 ORDER BY AVG(e.sal) DESC
;
/*
����,       �޿����
-----------------------
PRESIDENT	$5,000.00
ANALYST	    $3,000.00
MANAGER	    $2,758.33
SALESMAN	$1,400.00
CLERK	    $1,016.67
*/


-- 3.2 job �� null �� ������ ó��
SELECT NVL(e.job || '', '���� �̹���') "����"
     , to_char(AVG(e.sal), '$9,999.99') "�޿����"
  FROM emp e
 GROUP BY e.job
 ORDER BY AVG(e.sal) DESC
;
/*
����,         �޿����
----------------------
���� �̹���	
PRESIDENT	 $5,000.00
ANALYST	     $3,000.00
MANAGER	     $2,758.33
SALESMAN	 $1,400.00
CLERK	     $1,016.67
*/

-- 4. ������ �޿� ���� ���ϰ�, ���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT e.job "����"
     , SUM(e.sal) " �޿�����"
  FROM emp e
 GROUP BY e.job
 ORDER BY SUM(e.sal) DESC
;
/*
����,     �޿�����
------------------
MANAGER	    8275
SALESMAN	5600
PRESIDENT	5000
CLERK	    3050
ANALYST	    3000
*/


-- 5. �޿��� �մ����� 1000�̸�, 1000, 2000, 3000, 5000 ���� �ο����� ���Ͻÿ�
--    �޿� ���� ������������ ����
SELECT TRUNC(e.sal, -3) "�޿�"
     , COUNT(e.sal) "�ο���"
  FROM emp e
 WHERE e.sal IS NOT NULL
 GROUP BY TRUNC(e.sal, -3)
 ORDER BY TRUNC(e.sal, -3) DESC
;

-- 6. ������ �޿� ���� ������ ���ϰ�, �޿� ���� ������ ū ������ ����
SELECT e.job "����"
     ,TRUNC(SUM(e.sal), -3) "���� ����"
  FROM emp e
 GROUP BY e.job
 ORDER BY SUM(e.sal) DESC
;
/*
����,     ���� ����
-------------------
MANAGER	    8000
SALESMAN	5000
PRESIDENT	5000
CLERK	    3000
ANALYST	    3000
*/

-- 7. ������ �޿� ����� 2000������ ��츦 ���ϰ� ����� ���� ������ ����
SELECT e.job "����"
     , TO_CHAR(AVG(e.sal), '$9,999.99') "�޿����"
  FROM emp e
 GROUP BY e.job
HAVING AVG(e.sal) <= 2000
 ORDER BY AVG(e.sal) DESC
;
/*
����,        �޿����
----------------------
SALESMAN	 $1,400.00
CLERK	     $1,016.67
*/

-- 8. �⵵�� �Ի� �ο��� ���Ͻÿ�
SELECT e.hiredate "�Ի�⵵"
     , COUNT(e.hiredate)
  FROM emp e
 GROUP BY e.hiredate
;