--------------------------------------------------------
--  파일이 생성됨 - 화요일-7월-28-2020   
--------------------------------------------------------
REM INSERTING into PORTAL.AUTHORITY
SET DEFINE OFF;
Insert into PORTAL.AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('ADMIN','관리자','manager',1,to_date('20/07/28','RR/MM/DD'));
Insert into PORTAL.AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('ASSISTANT','부관리자','assistant manager',2,to_date('20/07/28','RR/MM/DD'));
Insert into PORTAL.AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('STAFF','스태프','staff',3,to_date('20/07/28','RR/MM/DD'));
