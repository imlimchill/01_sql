-- SQL day 06

----- 2) ���� �Լ�
-------- 1. INITCAP(str) : str �� ù ���ڸ� �빮��ȭ(����)
SELECT initcap('the watch') --The Watch
  FROM dual
;
SELECT initcap('�ȳ��ϼ���. ������') --�ȳ��ϼ���. ������
  FROM dual
;

-------- 2. LOWER(str) : str�� ��� ���ڸ� �ҹ���ȭ(����)
SELECT lower('MR. SCOTT MCMILLAN') "�ҹ��ڷ� ����"
  FROM dual
;
 --mr. scott mcmillan
 
 -------- 3. UPPER(str) : str�� ��� ���ڸ� �빮��ȭ(����)
 SELECT upper('lee') "���� �빮�ڷ� ����"
   FROM dual
;
--LEE

SELECT upper('sql is cooooooooooooooooooooooooooooool~!!!!') "��վ��!"
  FROM dual
;
--SQL IS COOOOOOOOOOOOOOOOOOOOOOOOOOOOOOL~!!!!

-- smith �� ã�µ� �Է��� �ҹ��ڷ� �� ��� SMITH�� �ٸ� ���ڷ� �νĵǹǷ� ã�� �� ����.
SELECT e.empno
     , e.ename 
  FROM emp e
 WHERE e.ename = 'smith'
;
--����Ǵ� ��:0
SELECT e.empno
     , e.ename 
  FROM emp e
 WHERE e.ename = 'SMITH'
;
-- ename�� ���ϴ� ���� �빮���̹Ƿ� ������ ��ȸ��
SELECT e.empno
     , e.ename 
  FROM emp e
 WHERE e.ename = upper('smith')
;
/*
EMPNO   ENAME
-------------
7369	SMITH
*/

-------- 4. LENGTH(arg) , LENGTHB(arg) : str�� ���� ����, ������byte�� ����Ͽ� ���ڷ� ���
SELECT length('hello, sql') as "���� ����"
  FROM dual
;
-- ��� 10 : Ư����ȣ, ���鵵 ���� ���̷� ���
SELECT 'hello, sql�� ���� ���̴� ' || length('hello, sql') 
                                   || '�Դϴ�.' "���� ����"
  FROM dual
;
/*
���� ����
----------------------------------
hello, sql�� ���� ���̴� 10�Դϴ�.
*/

---- oracle���� �ѱ��� 3byte�� ���
SELECT lengthb('hello, sql') "���� byte"
  FROM dual
;
-- ��� 10 => �����ڴ� 1byte�Ҵ�
SELECT lengthb('����Ŭ') "���� byte"
  FROM dual
;
-- ��� 9 => �ѱ��� 3byte�Ҵ�

-------- 5. CONCAT(str1, str2) : str1�� str2�� ���ڿ� ���� ( || �����ڿ� ������ ��� )
SELECT concat('�ȳ��ϼ���. ', 'SQL!!') "�λ�"
  FROM dual
;
/*
�λ�
-----------------
�ȳ��ϼ���. SQL!!
*/
-- concat('�ȳ��ϼ���. ', 'SQL!!')�� ���� ����� ���� || ���� ���
SELECT '�ȳ��ϼ���. ' || 'SQL!!' "�λ�"
  FROM dual
;
-------- 6. SUBSTR(str, i, n) : str���� i��° ��ġ���� n���� ���� ����
--                              sql���� ���ڿ��� �ε���(����)�� 1���� ����
SELECT substr('SQL is coooooooooooooool~~!!', 3, 4) "sql ��������"
  FROM dual
;
/*
L is
*/
-------- SUBSTR(str, i) : str���� i��° ��ġ ���� ������ ����
SELECT substr('SQL is coooooooooooooool~~!!', 3) "sql ��������"
  FROM dual
;
/*
L is coooooooooooooool~~!!
*/

-- ���� : SQL is coooooooooooooool~~!! ���� SQL ��
-- ���� : SQL is coooooooooooooool~~!! ���� is ��
-- ���� : SQL is coooooooooooooool~~!! ���� ~~!! ��
SELECT substr('SQL is coooooooooooooool~~!!', 1, 3)
  FROM dual
;

SELECT substr('SQL is coooooooooooooool~~!!', 5, 2)
  FROM dual
;

SELECT substr('SQL is coooooooooooooool~~!!', 25)
  FROM dual
;

-- ���� : emp ���̺��� ������ �̸��� �� �α��� ������ ����� �Բ� ����
SELECT e.empno
     , substr(e.ename, 1, 2) "���� �α���"
  FROM emp e
;
/*
EMPNO, ���� �α���
------------------
9999	J_
8888	J%
7369	SM
7499	AL
7521	WA
7566	JO
7654	MA
7698	BL
7782	CL
7839	KI
7844	TU
7900	JA
7902	FO
7934	MI
*/

-------- 7. INSTR(str1, str2) : �ι�° ���ڿ��� str2�� ù��° ���ڿ��� str1�� ��� ��ġ�ϴ��� ������ġ ��� �� ���� ���
SELECT instr('SQL is coooooooooooooool~~!!', 'is') "is�� ��ġ��"
  FROM dual
;
/*
is�� ��ġ��
-----------
        5
*/

SELECT instr('SQL is coooooooooooooool~~!!', 'io') "io�� ��ġ��"
  FROM dual
;
/* �ι�° ���ڿ��� ù��° ���ڿ��� ������ 0�� ����Ѵ�.
io�� ��ġ��
-----------
        0
*/

-------- 8. LPAD, RPAD(str, n, c) : �Էµ� str�� ���ؼ� ��ü ���ڰ� ������ �ڸ����� n���� ��� 
--                                  ��ü ���ڼ� ��� ���� / �����ʿ� ���� �ڸ����� c ���ڸ� ä���ִ´�.
SELECT lpad('SQL is cool!', 20, '*')
  FROM dual
;
/*
********SQL is cool!
*/

SELECT rpad('SQL is cool!', 20, '*')
  FROM dual
;
/*
SQL is cool!********
*/

-------- 9. LTRIM, RTRIM, TRIM : �Էµ� ���ڿ��� ���� ���� , ������ , ������ ������ �����Ѵ�.
SELECT '>' || '     sql is cool     ' || '<' 
  FROM dual
;
-- >     sql is cool     <

SELECT '>' || ltrim('     sql is cool     ') || '<' 
  FROM dual
;
-- >sql is cool     <

SELECT '>' || rtrim('     sql is cool     ') || '<' 
  FROM dual
;
-- >     sql is cool<

SELECT '>' || trim('     sql is cool     ') || '<' 
  FROM dual
;
-- >sql is cool<

SELECT e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = '   SMITH '
;
-- ����� ��� ��: 0 => ������ ���Ͱ� ���� �������� �ٸ��Ƿ� ��ȸ���� ����

SELECT e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = trim('   SMITH ')
;
-- trim�Լ��� �����ϸ� ��ȸ ����

-- ���� : �Է°��� '   simth  ' �ϋ� SMITH�� ������ ��ȸ
SELECT e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = upper(trim('    smith  '))
;
/*
EMPNO,  ENAME
-------------
7369	SMITH
*/


-------- 10. NVL(expr1, expr2) , NVL2(expr1, expr2, expr3), NULLIF(expr1, expr2)

--  NVL(expr1, expr2) : ù��° ���� ���� null�̸� �ι�° ������ ��ü�Ͽ� ���
-- �Ŵ���(mgr)�� �������� ���� ������ ��� �Ŵ����� ����� 0���� ��ü
SELECT e.empno
     , e.ename
     , nvl(e.mgr, 0) "�Ŵ��� ���"
  FROM emp e
;
/*
EMPNO,  ENAME,  �Ŵ��� ���
----------------------------
9999	J_JAMES	0
8888	J%JAMES	0
7369	SMITH	7902
7499	ALLEN	7698
7521	WARD	7698
7566	JONES	7839
7654	MARTIN	7698
7698	BLAKE	7839
7782	CLARK	7839
7839	KING	0
7844	TURNER	7698
7900	JAMES	7698
7902	FORD	7566
7934	MILLER	7782
*/


-- �Ŵ��� (mgr)�� �������� ���� ������ '�Ŵ��� ����'��� ���
SELECT e.empno
     , e.ename
     , nvl(e.mgr, '�Ŵ��� ����') "�Ŵ��� ���"
  FROM emp e
;
/*
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"

=> nvl ó�� ��� �÷��� e.mgr�� ����Ÿ���� �������ε� null ���� ��ü�ϴ� '�Ŵ��� ����'�� ����Ÿ���� ������
-- �ش� �÷��� Ÿ�԰� ����ġ�ϱ� ������ ����� ���� ���� �߻�
*/

-- ==> �ذ��� e.mgr�� ����Ÿ������ ����
SELECT e.empno
     , e.ename
     , nvl(e.mgr || '', '�Ŵ��� ����') "�Ŵ��� ���"
  FROM emp e
;
-- || ���տ����ڷ� mgr�� ���ڸ� �ٿ��� ����Ÿ������ ����
/*
EMPNO,  ENAME,  �Ŵ��� ���
---------------------------
9999	J_JAMES	�Ŵ��� ����
8888	J%JAMES	�Ŵ��� ����
7369	SMITH	7902
7499	ALLEN	7698
7521	WARD	7698
7566	JONES	7839
7654	MARTIN	7698
7698	BLAKE	7839
7782	CLARK	7839
7839	KING	�Ŵ��� ����
7844	TURNER	7698
7900	JAMES	7698
7902	FORD	7566
7934	MILLER	7782
*/

-- ���� : || ������ ��� concat() �Լ��� ����Ͽ� ���� ����� ���ÿ�
SELECT e.empno
     , e.ename
     , nvl(concat(e.mgr, ''), '�Ŵ��� ����') "�Ŵ��� ���"
  FROM emp e
;
-- ����Ŭ������ �� ���ڿ�('')�� NULL�� ���

-- NVL2(expr1, expr2, expr3) : ù��° ���� ���� NOT NULL�̸� �ι�° �� ������ ���, NULL�̸� ����° �� ������ ���
-- �Ŵ��� mgr�� ������ ��쿡�� '�Ŵ��� ����' / �������� ���� ��� '�Ŵ��� ����' ���
SELECT e.empno
     , e.ename
     , nvl2(e.mgr, '�Ŵ��� ����', '�Ŵ��� ����') "�Ŵ��� ��/��"
  FROM emp e
;
-- expr2, expr3�� Ÿ���� �����ؾ��Ѵ�.
/*
EMPNO,  ENAME,  �Ŵ��� ��/��
----------------------------
9999	J_JAMES	�Ŵ��� ����
8888	J%JAMES	�Ŵ��� ����
7369	SMITH	�Ŵ��� ����
7499	ALLEN	�Ŵ��� ����
7521	WARD	�Ŵ��� ����
7566	JONES	�Ŵ��� ����
7654	MARTIN	�Ŵ��� ����
7698	BLAKE	�Ŵ��� ����
7782	CLARK	�Ŵ��� ����
7839	KING	�Ŵ��� ����
7844	TURNER	�Ŵ��� ����
7900	JAMES	�Ŵ��� ����
7902	FORD	�Ŵ��� ����
7934	MILLER	�Ŵ��� ����
*/

-- ����Ŭ���� ���ڿ�('')�� null�� ����ϴ� ���� Ȯ���ϱ� ���� ����
-- �Է��� �� ���ڿ�
SELECT nvl2('', 'IS NOT NULL', 'IS NULL') "NULL �� Ȯ��"
  FROM dual
;
/*
NULL �� Ȯ��
------------
IS NULL
*/
-- �Է��� 1ĭ ¥�� ����
SELECT nvl2(' ', 'IS NOT NULL', 'IS NULL') "NULL �� Ȯ��"
  FROM dual
;
/*
NULL �� Ȯ��
------------
IS NOT NULL
*/

-- NULLIF(expr1, expr2) : ù��° ��, �ι�° ���� ���� ���Ͻ� NULL�� ��� / �ٸ��� ù��° ���� �� ���
SELECT nullif('AAA', 'BBB') "NULLIF���" -- AAA
  FROM dual
;
/*
NULLIF���
----------
AAA
*/

SELECT nullif('AAA', 'AAA') "NULLIF���" -- NULL
  FROM dual
;
/*
NULLIF���
----------
(NULL)
*/
-- ��ȸ�� ��� ���� 1���� �����ϰ� �� ���� NULL�� ���� 
-- 1���̶� ��ȸ�� �� ���� "����� ��� ��: 0"�� �ٸ���.


------ 3) ��¥ �Լ� : ��¥�� ���õ� ��� / ��¥�� ���ϱ� ���� ���� ������ �� �� �ִ� ����� ����

-- ������ �ý����� �ð��� ��� SYSDATE�Լ�
SELECT sysdate
  FROM dual
;
/*
SYSDATE
--------
19/05/24  => ����Ŭ�� ��¥ �⺻ ���� YY/MM//DD
*/

-- TO_CHAR(arg) : arg�� ���ڳ� ��¥ Ÿ���� ������ / �Էµ� arg�� ����Ÿ������ �������ִ� �Լ�
SELECT to_char(sysdate, 'YYYY') "�⵵" -- 2019
  FROM dual
;
SELECT to_char(sysdate, 'YY') "�⵵" -- 19
  FROM dual
;
SELECT to_char(sysdate, 'MM') "��" -- 05
  FROM dual
;
SELECT to_char(sysdate, 'MONTH') "��" -- 5��
  FROM dual
;
SELECT to_char(sysdate, 'DD') "��" -- 24
  FROM dual
;
SELECT to_char(sysdate, 'D') "����" -- 6 : �ݿ����� ���ڴ� 6
  FROM dual
;
SELECT to_char(sysdate, 'DAY') "����" -- �ݿ���
  FROM dual
;
SELECT to_char(sysdate, 'DY') "����" -- ��
  FROM dual
;

-- ������ ����
SELECT to_char(sysdate, 'YYYY-MM-DD') "���� ��¥" -- 2019-05-24
  FROM dual
;
SELECT to_char(sysdate, 'FMYYYY-MM-DD') "���� ��¥" -- 2019-5-24
  FROM dual
;
SELECT to_char(sysdate, 'YY-MON-DD') "���� ��¥" -- 19-5��-24
  FROM dual
;
SELECT to_char(sysdate, 'YY-MON-DD DAY') "���� ��¥" -- 19-5��-24 �ݿ���
  FROM dual
;
SELECT to_char(sysdate, 'YY-MON-DD DY') "���� ��¥" -- 19-5��-24 ��
  FROM dual
;
/* �ð� ����: 
     HH : �ð��� ���ڸ��� ǥ��
     MI : ���� ���ڸ��� ǥ��
     SS : �ʸ� ���ڸ��� ǥ��
     HH24 : �ð��� 24�ð� ü��� ǥ��
     AM : �������� �������� ǥ��
*/
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') "���� ��¥ �ú���" 
  FROM dual
;
-- 2019-05-24 15:29:49
SELECT to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') "���� ��¥ �ú���" 
  FROM dual
;
-- 2019-05-24 03:41:56 <= �������� �������� �Ǻ��Ұ�
SELECT to_char(sysdate, 'YYYY-MM-DD AM HH:MI:SS') "���� ��¥ �ú���" 
  FROM dual
;
-- 2019-05-24 ���� 03:42:41 <= AM ���� ���ڸ� �����ϸ� ����/���� ������

-- ��¥ ���� ������ ���� : +,- �����ڸ� ���
-- �������κ��� 10�� ��
SELECT sysdate + 10
  FROM dual
;
-- 19/06/03 (���糯¥ : 10/05/24 �� ��)

-- 10�� ��
SELECT sysdate - 10
  FROM dual
;
-- 19/05/14

-- 10�ð� ��
SELECT sysdate + 10/24
  FROM dual
;
-- 19/05/25

-- 10�ð� �ĸ� ��/��/�ʱ��� ���
SELECT to_char(sysdate + 10/24, 'YYYY-MM-DD HH24:MI:SS') "10�ð� ��"
  FROM dual
;
-- 2019-05-25 01:47:29

-------- 1. MONTHS_BETWEEN(��¥1, ��¥2) : �� ��¥ ������ ���� ����

-- �� ������ �Ի��� ���κ��� ������� �� ������ �ٹ��ߴ��� ��ȸ�Ͻÿ�
SELECT e.empno
     , e.ename
     , months_between(sysdate, e.hiredate) "�ټ� ���� ��"
  FROM emp e
;
/*
EMPNO,  ENAME,      �ټ� ���� ��
-----------------------------------------------------------
9999	J_JAMES	
8888	J%JAMES	
7369	SMITH	461.247171818996415770609318996415770609
7499	ALLEN	459.150397625448028673835125448028673835
7521	WARD	459.085881496415770609318996415770609319
7566	JONES	457.73104278673835125448028673835125448
7654	MARTIN	451.892333109318996415770609318996415771
7698	BLAKE	456.763300851254480286738351254480286738
7782	CLARK	455.505236335125448028673835125448028674
7839	KING	450.247171818996415770609318996415770609
7844	TURNER	452.537494399641577060931899641577060932
7900	JAMES	449.698784722222222222222222222222222222
7902	FORD	449.698784722222222222222222222222222222
7934	MILLER	448.053623431899641577060931899641577061
*/

-- ���� : �� ������ �ټ� ���� ���� ���ϵ� �Ҽ��� 1�� �ڸ������� ���϶� / �Ҽ��� 2�� �ڸ����� �ݿø�
SELECT e.empno
     , e.ename
     , round(months_between(sysdate, e.hiredate), 1) "�ټ� ���� ��"
  FROM emp e
;
/*
EMPNO,  ENAME,  �ټ� ���� ��
--------------------------
9999	J_JAMES	
8888	J%JAMES	
7369	SMITH	461.2
7499	ALLEN	459.2
7521	WARD	459.1
7566	JONES	457.7
7654	MARTIN	451.9
7698	BLAKE	456.8
7782	CLARK	455.5
7839	KING	450.2
7844	TURNER	452.5
7900	JAMES	449.7
7902	FORD	449.7
7934	MILLER	448.1
*/

-------- 2. ADD_MONTHS(��¥, ����) : ��¥�� ���ڸ� ���� ���� ���� ��¥�� ����
SELECT add_months(sysdate, 3)
  FROM dual
;
-- 19/08/24 => 3���� ���� ��¥

-- ��¥ + ���� : ���ڸ�ŭ�� �� ���� ���Ͽ� ��¥�� ����
-- ��¥ + ����/24 : ���ڸ�ŭ�� �ð��� ���Ͽ� ��¥�� ����
-- ADD_MONTHS(��¥, ����) : ���ڸ�ŭ�� ���� ���Ͽ� ��¥�� ����

-------- 3. NEXT_DAY, LAST_DAY : ���� ���Ͽ� �ش��ϴ� ��¥�� ���ϰų� / �̴��� ������ ��¥�� ����

-- ���糯¥���� ���ƿ��� ��(4)������ ��¥�� ����
SELECT next_day(sysdate, 4) "���ƿ��� ������"
  FROM dual
;
SELECT next_day(sysdate, '������') "���ƿ��� ������"
  FROM dual
;
-- 19/05/29

SELECT last_day(sysdate) "�� ���� ������ ��"
  FROM dual
;
-- 19/05/31

-------- 4. ROUNDM TRUNC : ��¥�� ���� �ݿø�, ���� ����
SELECT round(sysdate) "���� �ð�"
  FROM dual
;
-- 19/05/25 => 12�ð� ������ �ݿø� �Ǿ� 25���� ��

-- ���� : ���� �ðǿ��� �ݿø� �� ��¥�� ��/��/�� ���� ���
-- ��Ʈ : to_char() �ú��ʱ��� ����� �� �ִ� ��¥/�ð� ������ ����
SELECT to_char(round(sysdate), 'YYYY-MM-DD HH24:MI:SS') "���� �ð�"
  FROM dual
;
-- 2019-05-25 00:00:00

-- TRUNC
SELECT trunc(sysdate) "���� �ð����� �ú��� ����"
  FROM dual
;
-- 19/05/24

SELECT to_char(trunc(sysdate), 'YYYY-MM-DD HH24:MI:SS') "���� �ð����� �ú��� ����"
  FROM dual
;
-- 2019-05-24 00:00:00
