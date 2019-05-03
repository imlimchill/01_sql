-- SQL day 01 강의노트

-- 1)세션 설정 변경 : 명령어 ctrl + Enter로 실행
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 2) SCOTT 계정 생성 : F5로 실핼 (스크립트 실행)
@C:\app\13\product\18.0.0\dbhomeXE\rdbms\admin\scott.sql

-- 3) SCOTT 접속을 생성
-- 아이디 : SCOTT
-- 비밀번호 : TIGER

-- 4) SCOTT 계정 접속 후 실행명령
-- scott 계정의 모든 테이블 이름 조회
-- 주의할 점 : 줄을 잘 맞추자 T에 맞추고 있음 
SELECT *
  FROM tab
;