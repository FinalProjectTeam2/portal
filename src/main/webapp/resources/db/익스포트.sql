--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-19-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AWARD_SEQ
--------------------------------------------------------
--테이블 시퀀스 클리어
--SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
--SELECT 'drop sequence ' || sequence_name ||';' FROM user_sequences;
---------------------------------------------------------------------

      CREATE SEQUENCE  "BANK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 17 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence BOOKMARK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOOKMARK_SEQ"  MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1 START WITH 15 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence CERT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CERT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence CHATMESSAGE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHATMESSAGE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 225 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence DIST_ASSIGN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DIST_ASSIGN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EMPLOYEE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence FILES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FILES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 67 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence INBOX_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "INBOX_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 62 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence OUTBOX_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OUTBOX_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence POSTS_SEQ
--------------------------------------------------------
   CREATE SEQUENCE  "POSTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 96 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence PROFESSOR_SEQ
--------------------------------------------------------


   CREATE SEQUENCE  "PROFESSOR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 38 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence PROF_POSITION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PROF_POSITION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 18 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence REREPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REREPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence SCHOLARSHIP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCHOLARSHIP_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence STUDENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STUDENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 40 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence SUBJECT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUBJECT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence SUBJ_TIME_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUBJ_TIME_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 86 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Sequence TUITION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TUITION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;
--------------------------------------------------------
--  DDL for Table ACCOUNT_INFO
--------------------------------------------------------

  CREATE TABLE "ACCOUNT_INFO" 
   (	"OFFICIAL_NO" VARCHAR2(100), 
	"BANK_CODE" VARCHAR2(20), 
	"ACCOUNT_NO" VARCHAR2(30), 
	"ACCOUNT_NAME" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table ASSIGNMENT
--------------------------------------------------------

  CREATE TABLE "ASSIGNMENT" 
   (	"ASSIGN_NO" NUMBER, 
	"STU_NO" VARCHAR2(100), 
	"FILE_NAME" VARCHAR2(100), 
	"FILE_SIZE" NUMBER, 
	"ORIGINAL_FILE_NAME" VARCHAR2(100), 
	"APPLY_DATE" DATE DEFAULT sysdate /* 제출일 */
   );
--------------------------------------------------------
--  DDL for Table AUTHORITY
--------------------------------------------------------

  CREATE TABLE "AUTHORITY" 
   (	"AUTH_CODE" VARCHAR2(50), 
	"AUTH_NAME" VARCHAR2(30), 
	"AUTH_DESC" VARCHAR2(30), 
	"AUTH_LEVEL" NUMBER, 
	"REG_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table AWARD
--------------------------------------------------------

  CREATE TABLE "AWARD" 
   (	"NO" NUMBER, 
	"STU_NO" VARCHAR2(100), 
	"SCHOLARSHIP_NO" NUMBER, 
	"AWARDING_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table BANK
--------------------------------------------------------

  CREATE TABLE "BANK" 
   (	"BANK_CODE" VARCHAR2(20), 
	"BANK_NAME" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BD_CODE" VARCHAR2(10), 
	"OFFICIAL_NO" VARCHAR2(100), 
	"BD_NAME" VARCHAR2(150), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"EDIT_DATE" DATE DEFAULT sysdate, 
	"BD_ORDER" NUMBER, 
	"USAGE" CHAR(1) DEFAULT 'Y', 
	"IS_REPLY" CHAR(1) DEFAULT 'N', 
	"IS_COMMENT" CHAR(1) DEFAULT 'N', 
	"IS_PRIVATE" CHAR(1) DEFAULT 'N', 
	"IS_UPLOAD" CHAR(1) DEFAULT 'N', 
	"MAX_UPFILE" NUMBER DEFAULT 1, 
	"MAX_FILESIZE" NUMBER DEFAULT 1024*1024, 
	"CATEGORY_CODE" VARCHAR2(10), 
	"AUTH_CODE" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table BOOKMARK
--------------------------------------------------------

  CREATE TABLE "BOOKMARK" 
   (	"NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(100), 
	"NAME" VARCHAR2(50), 
	"URL" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table BUILDING
--------------------------------------------------------

  CREATE TABLE "BUILDING" 
   (	"BUILDING_CODE" VARCHAR2(30), 
	"BUILDING_NAME" VARCHAR2(100), 
	"DETAIL" VARCHAR2(150), 
	"TEL" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CATEGORY" 
   (	"CATEGORY_CODE" VARCHAR2(10), 
	"CATEGORY_NAME" VARCHAR2(100), 
	"USAGE" CHAR(1) DEFAULT 'N', 
	"REG_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table CERTIFICATION
--------------------------------------------------------

  CREATE TABLE "CERTIFICATION" 
   (	"NO" VARCHAR2(20), 
	"CERT_CODE" VARCHAR2(20), 
	"QTY" NUMBER, 
	"STU_NO" VARCHAR2(100), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"IS_PRINT" CHAR(1) DEFAULT 'N', 
	"CERT_NAME" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table CHATMESSAGE
--------------------------------------------------------

  CREATE TABLE "CHATMESSAGE" 
   (	"NO" NUMBER, 
	"ROOM_ID" VARCHAR2(100), 
	"WRITER_ID" VARCHAR2(100), 
	"WRITER_NAME" VARCHAR2(30), 
	"MESSAGE" VARCHAR2(2000), 
	"TYPE" VARCHAR2(20), 
	"REG_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table CHATROOM
--------------------------------------------------------

  CREATE TABLE "CHATROOM" 
   (	"ROOM_ID" VARCHAR2(100), 
	"NAME" VARCHAR2(50), 
	"OFFICIAL_NO" VARCHAR2(50), 
	"REG_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table CLASSROOM
--------------------------------------------------------

  CREATE TABLE "CLASSROOM" 
   (	"CLASSROOM_CODE" VARCHAR2(20), 
	"CLASSROOM_NAME" VARCHAR2(30), 
	"BUILDING_CODE" VARCHAR2(30)
   );
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTMENT" 
   (	"DEP_NO" NUMBER, 
	"DEP_NAME" VARCHAR2(100), 
	"TEL" VARCHAR2(30), 
	"BUILDING_CODE" VARCHAR2(30), 
	"FACULTY_NO" NUMBER, 
	"TOTAL_CREDIT" NUMBER
   );
--------------------------------------------------------
--  DDL for Table DISTRIBUTE_ASSIGN
--------------------------------------------------------

  CREATE TABLE "DISTRIBUTE_ASSIGN" 
   (	"ASSIGN_NO" NUMBER, 
	"OPEN_SUB_CODE" VARCHAR2(10), 
	"ASSIGN_NAME" VARCHAR2(100), 
	"REG_DATE" DATE DEFAULT sysdate /* 등록일 */
   );
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "EMPLOYEE" 
   (	"EMP_NO" VARCHAR2(100), 
	"PWD" VARCHAR2(150), 
	"START_DATE" DATE DEFAULT sysdate, 
	"DEP_CODE" VARCHAR2(50), 
	"AUTH_CODE" VARCHAR2(50), 
	"EMP_NAME" VARCHAR2(50), 
	"RESIGNATION_DATE" DATE, 
	"IDENTITY_STATE" CHAR(1) DEFAULT 'N', 
	"POSITION_CODE" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table EMP_DEPART
--------------------------------------------------------

  CREATE TABLE "EMP_DEPART" 
   (	"DEP_CODE" VARCHAR2(50), 
	"DEP_NAME" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table EMP_POSITION
--------------------------------------------------------

  CREATE TABLE "EMP_POSITION" 
   (	"POSITION_CODE" VARCHAR2(50), 
	"POSITION_NAME" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table EVALUATION
--------------------------------------------------------

  CREATE TABLE "EVALUATION" 
   (	"SUB_CODE" VARCHAR2(10), 
	"STU_NO" VARCHAR2(100), 
	"CLASSIFICATION" VARCHAR2(30), 
	"MIDTERM" NUMBER, 
	"FINALS" NUMBER, 
	"ASSIGNMENT" NUMBER, 
	"ATTENDANCE" NUMBER, 
	"ETC" NUMBER, 
	"TOTAL_GRADE" NUMBER, 
	"REG_DATE" DATE DEFAULT sysdate, 
	"EDIT_DATE" DATE
   );
--------------------------------------------------------
--  DDL for Table FACULTY
--------------------------------------------------------

  CREATE TABLE "FACULTY" 
   (	"FACULTY_NO" NUMBER, 
	"FACULTY_NAME" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table FILES
--------------------------------------------------------

  CREATE TABLE "FILES" 
   (	"NO" NUMBER, 
	"POST_NO" NUMBER, 
	"FILE_NAME" VARCHAR2(1000), 
	"FILE_SIZE" NUMBER, 
	"ORIGINAL_FILE_NAME" VARCHAR2(1000), 
	"DOWN_COUNT" NUMBER DEFAULT 0, 
	"UPFILE_DATE" DATE DEFAULT sysdate
   );
--------------------------------------------------------
--  DDL for Table FOOTER
--------------------------------------------------------

  CREATE TABLE "FOOTER" 
   (	"COMPANY_NAME" VARCHAR2(100), 
	"TEL" VARCHAR2(100), 
	"ZIPCODE" VARCHAR2(100), 
	"ADDRESS1" VARCHAR2(100), 
	"ADDRESS2" VARCHAR2(100), 
	"POLICY" CLOB, 
	"START_YEAR" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table INBOX
--------------------------------------------------------

  CREATE TABLE "INBOX" 
   (	"NO" NUMBER, 
	"MSG_NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(100), 
	"READ_DATE" DATE, 
	"KEEP_FLAG" CHAR(1) DEFAULT 'N'
   );
--------------------------------------------------------
--  DDL for Table OFFICIAL_INFO
--------------------------------------------------------

  CREATE TABLE "OFFICIAL_INFO" 
   (	"OFFICIAL_NO" VARCHAR2(100), 
	"HP1" VARCHAR2(10), 
	"HP2" VARCHAR2(10), 
	"HP3" VARCHAR2(10), 
	"EMAIL1" VARCHAR2(50), 
	"EMAIL2" VARCHAR2(50), 
	"ZIPCODE" VARCHAR2(50), 
	"ADDRESS" VARCHAR2(100), 
	"ADDR_DETAIL" VARCHAR2(100), 
	"SSN" VARCHAR2(100), 
	"GENDER" VARCHAR2(20), 
	"CERTI_CODE" VARCHAR2(30), 
	"IMAGE_URL" VARCHAR2(150) DEFAULT 'default.jpg'
   );
--------------------------------------------------------
--  DDL for Table OPEN_SUBJ
--------------------------------------------------------

  CREATE TABLE "OPEN_SUBJ" 
   (	"OPEN_SUB_CODE" VARCHAR2(10), 
	"SUBJ_CODE" VARCHAR2(30), 
	"OPEN_DATE" DATE DEFAULT sysdate, 
	"CLOSE_DATE" DATE, 
	"PROF_NO" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table OUTBOX
--------------------------------------------------------

  CREATE TABLE "OUTBOX" 
   (	"MSG_NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(100), 
	"SEND_DATE" DATE DEFAULT sysdate, 
	"OFFICIAL_NAME" VARCHAR2(20), 
	"CONTENTS" VARCHAR2(3000), 
	"DEL_FLAG" CHAR(1) DEFAULT 'N'
   );
--------------------------------------------------------
--  DDL for Table POSTS
--------------------------------------------------------

  CREATE TABLE "POSTS" 
   (	"POST_NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(150), 
	"TITLE" VARCHAR2(300), 
	"CONTENTS" CLOB, 
	"REG_DATE" DATE DEFAULT sysdate, 
	"READ_COUNT" NUMBER DEFAULT 0, 
	"DEL_FLAG" CHAR(1) DEFAULT 'N', 
	"BD_CODE" VARCHAR2(10), 
	"GROUP_NO" NUMBER, 
	"SORT_NO" NUMBER DEFAULT 0, 
	"STEP" NUMBER DEFAULT 0, 
	"EDIT_DATE" DATE DEFAULT sysdate, 
	"IS_PRIVATE" CHAR(1) DEFAULT 'N'
   );
--------------------------------------------------------
--  DDL for Table PROFESSOR
--------------------------------------------------------

  CREATE TABLE "PROFESSOR" 
   (	"PROF_NO" VARCHAR2(100), 
	"PWD" VARCHAR2(150), 
	"PROF_NAME" VARCHAR2(50), 
	"DEP_NO" NUMBER, 
	"POSITION_NO" NUMBER, 
	"START_DATE" DATE DEFAULT sysdate, 
	"RESIGNATION_DATE" DATE, 
	"IDENTITY_STATE" CHAR(1) DEFAULT 'N', 
	"IDENTIFY_CODE" VARCHAR2(20), 
	"CHANGE_DATE" DATE
   );
--------------------------------------------------------
--  DDL for Table PROF_POSITION
--------------------------------------------------------

  CREATE TABLE "PROF_POSITION" 
   (	"POSITION_NO" NUMBER, 
	"POSITION_NAME" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table REGISTRATION
--------------------------------------------------------

  CREATE TABLE "REGISTRATION" 
   (	"SUB_CODE" VARCHAR2(10), 
	"STU_NO" VARCHAR2(100), 
	"CLASSIFICATION" VARCHAR2(30), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"SCORE" NUMBER, 
	"LECTURE_EVAL_FLAG" CHAR(1) DEFAULT 'N'
   );
--------------------------------------------------------
--  DDL for Table REGI_TIMETABLE
--------------------------------------------------------

  CREATE TABLE "REGI_TIMETABLE" 
   (	"OPEN_SUB_CODE" VARCHAR2(50), 
	"SHORT_NAMES" VARCHAR2(50)
   );
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "REPLY" 
   (	"REPLY_NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(100), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"CONTENTS" CLOB, 
	"DEL_FLAG" CHAR(1) DEFAULT 'N', 
	"POST_NO" NUMBER, 
	"OFFICIAL_NAME" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table REREPLY
--------------------------------------------------------

  CREATE TABLE "REREPLY" 
   (	"REREPLY_NO" NUMBER, 
	"REPLY_NO" NUMBER, 
	"OFFICIAL_NO" VARCHAR2(100), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"CONTENTS" CLOB, 
	"DEL_FLAG" CHAR(1) DEFAULT 'N', 
	"OFFICIAL_NAME" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table SCHOLARSHIP
--------------------------------------------------------

  CREATE TABLE "SCHOLARSHIP" 
   (	"SCHOLARSHIP_NO" NUMBER, 
	"SCHOLARSHIP_TYPE" VARCHAR2(50), 
	"SCHOLARSHIP" NUMBER
   );
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "STUDENT" 
   (	"STU_NO" VARCHAR2(100), 
	"PWD" VARCHAR2(150), 
	"NAME" VARCHAR2(50), 
	"MAJOR" NUMBER, 
	"SEMESTER" NUMBER DEFAULT 1, 
	"CREDITS" NUMBER DEFAULT 0, 
	"STATE" VARCHAR2(100) DEFAULT '1', 
	"ADMISSION_DATE" DATE DEFAULT sysdate, 
	"GRADUATION_DATE" DATE, 
	"IDENTITY_STATE" CHAR(1) DEFAULT 'N', 
	"MINOR" NUMBER, 
	"IDENTIFY_CODE" VARCHAR2(20), 
	"CHANGE_DATE" DATE
   );
--------------------------------------------------------
--  DDL for Table STUDENT_STATE
--------------------------------------------------------

  CREATE TABLE "STUDENT_STATE" 
   (	"STATE" VARCHAR2(100), 
	"STATE_NAME" VARCHAR2(100)
   );
--------------------------------------------------------
--  DDL for Table SUBJECT
--------------------------------------------------------

  CREATE TABLE "SUBJECT" 
   (	"SUBJ_CODE" VARCHAR2(30), 
	"SUBJ_NAME" VARCHAR2(100), 
	"EXPLANATION" CLOB, 
	"TYPE_CODE" VARCHAR2(30), 
	"CREDIT" NUMBER, 
	"PROF_NO" VARCHAR2(100), 
	"PERSONNEL" NUMBER(10,0)
   );
--------------------------------------------------------
--  DDL for Table SUBJ_EVAL
--------------------------------------------------------

  CREATE TABLE "SUBJ_EVAL" 
   (	"SUB_CODE" VARCHAR2(10), 
	"STU_NO" VARCHAR2(100), 
	"CLASSIFICATION" VARCHAR2(30), 
	"Q1" NUMBER, 
	"Q2" NUMBER, 
	"Q3" NUMBER, 
	"Q4" NUMBER, 
	"Q5" NUMBER, 
	"Q6" NUMBER, 
	"Q7" NUMBER, 
	"Q8" NUMBER, 
	"CONTENT" CLOB
   );
--------------------------------------------------------
--  DDL for Table SUBJ_TIME
--------------------------------------------------------

  CREATE TABLE "SUBJ_TIME" 
   (	"LECTURE_TIME_NO" NUMBER, 
	"OPEN_SUB_CODE" VARCHAR2(10), 
	"TIMETABLE_CODE" VARCHAR2(10), 
	"CLASSROOM_CODE" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table SUBJ_TYPE
--------------------------------------------------------

  CREATE TABLE "SUBJ_TYPE" 
   (	"TYPE_CODE" VARCHAR2(30), 
	"TYPE" VARCHAR2(30)
   );
--------------------------------------------------------
--  DDL for Table SYLLABUS
--------------------------------------------------------

  CREATE TABLE "SYLLABUS" 
   (	"OPEN_SUB_CODE" VARCHAR2(10), 
	"SYLLABUS" VARCHAR2(100), 
	"THEORY_TIME" NUMBER, 
	"TRAINING_TIME" NUMBER
   );
--------------------------------------------------------
--  DDL for Table TIMETABLE
--------------------------------------------------------

  CREATE TABLE "TIMETABLE" 
   (	"TIMETABLE_CODE" VARCHAR2(10), 
	"TIMETABLE_NAME" VARCHAR2(50), 
	"DAY" VARCHAR2(10), 
	"PERIOD" NUMBER, 
	"SHORT_NAME" VARCHAR2(20)
   );
--------------------------------------------------------
--  DDL for Table TUITION
--------------------------------------------------------

  CREATE TABLE "TUITION" 
   (	"NO" NUMBER, 
	"STU_NO" VARCHAR2(100), 
	"SEMESTER" NUMBER, 
	"TUITION" NUMBER, 
	"DEPOSIT_STATE" CHAR(1) DEFAULT 'N', 
	"DEPOSIT_DATE" DATE
   );
--------------------------------------------------------
--  DDL for View BOARD_STAT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOARD_STAT_VIEW" ("BD_CODE", "BD_NAME", "REG_DATE", "READ_COUNT") AS 
  select b.bd_code,b.bd_name,p.reg_date,p.read_count
from board b join posts p on b.BD_CODE = p.BD_CODE;
--------------------------------------------------------
--  DDL for View BOARD_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BOARD_VIEW" ("POST_NO", "TITLE", "CONTENTS", "REG_DATE", "READ_COUNT", "DEL_FLAG", "BD_CODE", "NO", "FILE_NAME", "FILE_SIZE", "ORIGINAL_FILE_NAME", "DOWN_COUNT", "UPFILE_DATE") AS 
  select p."POST_NO",p."TITLE",p."CONTENTS",p."REG_DATE",p."READ_COUNT",p."DEL_FLAG",p."BD_CODE", f.no, f.file_name, f.file_size, f.original_file_name, f.down_count, f.upfile_date
from posts p join files f
on p.post_no = f.post_no;
--------------------------------------------------------
--  DDL for View CLASS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "CLASS" ("DEP_NO", "CLASSROOM_CODE", "CLASSROOM_NAME") AS 
  select d.dep_no, c.classroom_code, c.classroom_name
from department d join classroom c
on c.building_code=d.building_code;
--------------------------------------------------------
--  DDL for View DEPARTMENT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "DEPARTMENT_VIEW" ("DEP_NO", "DEP_NAME", "TEL", "BUILDING_CODE", "FACULTY_NO", "TOTAL_CREDIT", "FACULTY_NAME", "BUILDING_NAME", "BUILDING_TEL") AS 
  (
select d."DEP_NO",d."DEP_NAME",d."TEL",d."BUILDING_CODE",d."FACULTY_NO",d."TOTAL_CREDIT",F.FACULTY_NAME,b.BUILDING_NAME,b.TEL as "BUILDING_TEL"
from department d join building b
on d.BUILDING_CODE = b.BUILDING_CODE
JOIN (SELECT * FROM FACULTY)F
ON d.FACULTY_NO = F.FACULTY_NO
);
--------------------------------------------------------
--  DDL for View EMPLOYEE_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EMPLOYEE_VIEW" ("EMP_NO", "PWD", "START_DATE", "DEP_CODE", "AUTH_CODE", "EMP_NAME", "RESIGNATION_DATE", "IDENTITY_STATE", "POSITION_CODE", "OFFICIAL_NO", "HP1", "HP2", "HP3", "EMAIL1", "EMAIL2", "ZIPCODE", "ADDRESS", "ADDR_DETAIL", "SSN", "GENDER", "CERTI_CODE", "IMAGE_URL", "DUPOFFINO", "BANK_CODE", "ACCOUNT_NO", "ACCOUNT_NAME", "BANK_NAME", "POSITION_NAME", "DEP_NAME", "AUTH_NAME", "AUTH_DESC", "AUTH_LEVEL") AS 
  (

SELECT s."EMP_NO",s."PWD",s."START_DATE",s."DEP_CODE",s."AUTH_CODE",s."EMP_NAME",s."RESIGNATION_DATE",s."IDENTITY_STATE",s."POSITION_CODE",o."OFFICIAL_NO",o."HP1",o."HP2",o."HP3",o."EMAIL1",o."EMAIL2",o."ZIPCODE",o."ADDRESS",o."ADDR_DETAIL",o."SSN",o."GENDER",o."CERTI_CODE",o."IMAGE_URL",bb."DUPOFFINO",bb."BANK_CODE",bb."ACCOUNT_NO",bb."ACCOUNT_NAME",bb."BANK_NAME", ss.POSITION_NAME,D.DEP_NAME,a.AUTH_NAME,a.AUTH_DESC,a.AUTH_LEVEL FROM
EMPLOYEE S JOIN OFFICIAL_INFO O
ON S.EMP_NO = O.OFFICIAL_NO
JOIN
(SELECT AI.OFFICIAL_NO AS "DUPOFFINO",AI.BANK_CODE,AI.ACCOUNT_NO,AI.ACCOUNT_NAME,B.BANK_NAME FROM ACCOUNT_INFO AI JOIN BANK B
ON AI.BANK_CODE = B.BANK_CODE
)BB
ON O.OFFICIAL_NO = BB.DUPOFFINO
join
(select * from EMP_position)ss
on ss.position_CODE = S.position_CODE
JOIN EMP_DEPART D
ON D.DEP_CODE = S.DEP_CODE
 join 
(select * from authority)a
on s.AUTH_CODE = a.AUTH_CODE);
--------------------------------------------------------
--  DDL for View FACULTY_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "FACULTY_VIEW" ("DEP_NO", "DEP_NAME", "TEL", "BUILDING_CODE", "FACULTY_NO", "TOTAL_CREDIT", "DEP_COUNT", "FACULTY_NAME", "BUILDING_NAME") AS 
  select d."DEP_NO",d."DEP_NAME",d."TEL",d."BUILDING_CODE",d."FACULTY_NO",d."TOTAL_CREDIT",dd.dep_count,f.faculty_name, b.building_name from (department d full outer join 
(select faculty_no, count(dep_no) as dep_count from department group by faculty_no)dd
on d.faculty_no=dd.faculty_no join building b on b.BUILDING_CODE = d.BUILDING_CODE)
full outer join faculty f on d.faculty_no=f.faculty_no;
--------------------------------------------------------
--  DDL for View PROFESSOR_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "PROFESSOR_VIEW" ("PROF_NO", "PWD", "PROF_NAME", "DEP_NO", "POSITION_NO", "START_DATE", "RESIGNATION_DATE", "IDENTITY_STATE", "IDENTIFY_CODE", "CHANGE_DATE", "OFFICIAL_NO", "HP1", "HP2", "HP3", "EMAIL1", "EMAIL2", "ZIPCODE", "ADDRESS", "ADDR_DETAIL", "SSN", "GENDER", "CERTI_CODE", "IMAGE_URL", "DEP_NAME", "FACULTY_NO", "FACULTY_NAME", "BUILDING_CODE", "TEL", "TOTAL_CREDIT", "DUPPONO", "BANK_CODE", "ACCOUNT_NO", "ACCOUNT_NAME", "BANK_NAME", "POSITION_NAME") AS 
  (
SELECT s."PROF_NO",s."PWD",s."PROF_NAME",s."DEP_NO",s."POSITION_NO",s."START_DATE",s."RESIGNATION_DATE",s."IDENTITY_STATE",s."IDENTIFY_CODE",s."CHANGE_DATE",o."OFFICIAL_NO",o."HP1",o."HP2",o."HP3",o."EMAIL1",o."EMAIL2",o."ZIPCODE",o."ADDRESS",o."ADDR_DETAIL",o."SSN",o."GENDER",o."CERTI_CODE",o."IMAGE_URL",A.DEP_NAME,A.FACULTY_NO, A.FACULTY_NAME,A.BUILDING_CODE,A.TEL,A.TOTAL_CREDIT, bb."DUPPONO",bb."BANK_CODE",bb."ACCOUNT_NO",bb."ACCOUNT_NAME",bb."BANK_NAME",ss.POSITION_NAME FROM
professor S JOIN OFFICIAL_INFO O
ON S.prof_NO = O.OFFICIAL_NO
JOIN
(
SELECT D.*,F.FACULTY_NAME FROM
DEPARTMENT D JOIN FACULTY F
ON F.FACULTY_NO = D.FACULTY_NO
)A
ON S.DEP_NO = A.DEP_NO
JOIN
(SELECT AI.OFFICIAL_NO AS "DUPPONO",AI.BANK_CODE,AI.ACCOUNT_NO,AI.ACCOUNT_NAME,B.BANK_NAME FROM ACCOUNT_INFO AI JOIN BANK B
ON AI.BANK_CODE = B.BANK_CODE
)BB
ON O.OFFICIAL_NO = BB.DUPPONO
join
(select * from prof_position)ss
on ss.position_no = S.position_no
);
--------------------------------------------------------
--  DDL for View SCORE_STAT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SCORE_STAT_VIEW" ("STU_NO", "MAJOR", "SEMESTER", "STATE", "DEP_NO", "DEP_NAME", "SUB_CODE", "CLASSIFICATION", "TOTAL_GRADE", "OPEN_DATE", "TYPE") AS 
  select s.stu_no,s.major,s.semester,s.state,
d.dep_no,d.dep_name,e.sub_code,e.classification,
e.total_grade,op.open_date,ty.type from evaluation e join open_subj op
on e.SUB_CODE=op.open_sub_code join student s on e.STU_NO = s.STU_NO
join department d on s.MAJOR=d.DEP_NO join subj_type ty on
e.classification=ty.TYPE_CODE;
--------------------------------------------------------
--  DDL for View SCORE_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SCORE_VIEW" ("SUB_CODE", "STU_NO", "TOTAL_GRADE", "OPEN_DATE", "PROF_NO", "SUBJ_NAME", "PROF_NAME", "CREDIT", "TYPE") AS 
  (select ev.sub_code, ev.stu_no,ev.total_grade,op.open_date,op.prof_no,su.subj_name,pr.prof_name,su.credit,ty.type from 
evaluation ev join open_subj op on ev.sub_code=op.open_sub_code 
join subject su on su.subj_code=op.subj_code 
join subj_type ty on ty.type_code=su.type_code
join professor pr on op.prof_no=pr.PROF_NO);
--------------------------------------------------------
--  DDL for View STUDENT_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "STUDENT_VIEW" ("STU_NO", "PWD", "NAME", "MAJOR", "SEMESTER", "CREDITS", "STATE", "ADMISSION_DATE", "GRADUATION_DATE", "IDENTITY_STATE", "MINOR", "IDENTIFY_CODE", "CHANGE_DATE", "OFFICIAL_NO", "HP1", "HP2", "HP3", "EMAIL1", "EMAIL2", "ZIPCODE", "ADDRESS", "ADDR_DETAIL", "SSN", "GENDER", "CERTI_CODE", "IMAGE_URL", "DEP_NO", "DEP_NAME", "TEL", "BUILDING_CODE", "FACULTY_NO", "TOTAL_CREDIT", "FACULTY_NAME", "DUPSTUNO", "BANK_CODE", "ACCOUNT_NO", "ACCOUNT_NAME", "BANK_NAME", "DUPSTATE", "STATE_NAME", "minor_dep_name", "minor_dep_no", "minor_faculty_name") AS 
  (
SELECT "STU_NO","PWD","NAME","MAJOR","SEMESTER","CREDITS","STATE","ADMISSION_DATE","GRADUATION_DATE","IDENTITY_STATE","MINOR","IDENTIFY_CODE","CHANGE_DATE","OFFICIAL_NO","HP1","HP2","HP3","EMAIL1","EMAIL2","ZIPCODE","ADDRESS","ADDR_DETAIL","SSN","GENDER","CERTI_CODE","IMAGE_URL","DEP_NO","DEP_NAME","TEL","BUILDING_CODE","FACULTY_NO","TOTAL_CREDIT","FACULTY_NAME","DUPSTUNO","BANK_CODE","ACCOUNT_NO","ACCOUNT_NAME","BANK_NAME","DUPSTATE","STATE_NAME","minor_dep_name","minor_dep_no","minor_faculty_name" FROM
STUDENT S JOIN OFFICIAL_INFO O
ON S.STU_NO = O.OFFICIAL_NO
JOIN
(
SELECT D.*,F.FACULTY_NAME FROM
DEPARTMENT D JOIN FACULTY F
ON F.FACULTY_NO = D.FACULTY_NO
)A
ON S.MAJOR = A.DEP_NO
JOIN
(SELECT AI.OFFICIAL_NO AS "DUPSTUNO",AI.BANK_CODE,AI.ACCOUNT_NO,AI.ACCOUNT_NAME,B.BANK_NAME FROM ACCOUNT_INFO AI JOIN BANK B
ON AI.BANK_CODE = B.BANK_CODE
)BB
ON O.OFFICIAL_NO = BB.DUPSTUNO
join
(select STATE as "DUPSTATE", STATE_NAME from student_state)ss
on ss.DUPSTATE = S.STATE
left outer join 
(
SELECT dm.dep_name as "minor_dep_name", Dm.dep_no as "minor_dep_no",Fm.FACULTY_NAME as "minor_faculty_name" FROM
DEPARTMENT Dm JOIN FACULTY Fm
ON Fm.FACULTY_NO = Dm.FACULTY_NO
)md
ON S.minor = md."minor_dep_no");
--------------------------------------------------------
--  DDL for View STUDENT_VIEW2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "STUDENT_VIEW2" ("DEP_NAME", "FACULTY_NAME", "STU_NO", "NAME", "SEMESTER") AS 
  select d.dep_name, f.faculty_name, s.stu_no, s.name, s.semester
from department d join faculty f
on  d.faculty_no = f.faculty_no
join student s
on d.dep_no=s.major;
REM INSERTING into ACCOUNT_INFO
SET DEFINE OFF;
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202033340004','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202032900005','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202031150006','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020570002','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202010050005','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202032250002','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202010040001','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030860003','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202010050002','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030010008','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021380031','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021690001','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021320003','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021330004','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020010005','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021140006','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021150007','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202023260008','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202023270009','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202023280010','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202023290011','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020050012','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020060013','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020070014','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020020015','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020040016','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020040017','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020840018','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021340019','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021350020','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020120021','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020160022','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020180023','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020680024','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020240025','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020880028','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202021120029','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030100009','1','100212345689',null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020840032','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030240011','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020230033','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030230012','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020230034','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030220014','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202031650015','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030210016','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202033360017','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030890018','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202010030003','1','10024567513','유직원');
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202010020004','1','100212345689','유직원');
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020230026','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020220027','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020240030','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030840010','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030230013','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202031380019','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202031390020','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202030920021','1',null,null);
Insert into ACCOUNT_INFO (OFFICIAL_NO,BANK_CODE,ACCOUNT_NO,ACCOUNT_NAME) values ('202020230035','1',null,null);
REM INSERTING into ASSIGNMENT
SET DEFINE OFF;
Insert into ASSIGNMENT (ASSIGN_NO,STU_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,APPLY_DATE) values (17,'202030860003','김우석_20200819161123804.docx',4,'김우석.docx',to_date('20/08/19','RR/MM/DD'));
REM INSERTING into AUTHORITY
SET DEFINE OFF;
Insert into AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('ADMIN','관리자','manager',1,to_date('20/07/28','RR/MM/DD'));
Insert into AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('ASSISTANT','부관리자','assistant manager',2,to_date('20/07/28','RR/MM/DD'));
Insert into AUTHORITY (AUTH_CODE,AUTH_NAME,AUTH_DESC,AUTH_LEVEL,REG_DATE) values ('STAFF','스태프','staff',3,to_date('20/07/28','RR/MM/DD'));
REM INSERTING into AWARD
SET DEFINE OFF;
REM INSERTING into BANK
SET DEFINE OFF;
Insert into BANK (BANK_CODE,BANK_NAME) values ('1','KB국민');
Insert into BANK (BANK_CODE,BANK_NAME) values ('2','KEB하나');
Insert into BANK (BANK_CODE,BANK_NAME) values ('3','신한은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('4','우리은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('5','NH농협');
Insert into BANK (BANK_CODE,BANK_NAME) values ('6','IBK기업');
Insert into BANK (BANK_CODE,BANK_NAME) values ('7','KDB산업');
Insert into BANK (BANK_CODE,BANK_NAME) values ('8','한국씨티');
Insert into BANK (BANK_CODE,BANK_NAME) values ('9','SC제일');
Insert into BANK (BANK_CODE,BANK_NAME) values ('10','BNK부산');
Insert into BANK (BANK_CODE,BANK_NAME) values ('11','DGB대구');
Insert into BANK (BANK_CODE,BANK_NAME) values ('12','BNK경남');
Insert into BANK (BANK_CODE,BANK_NAME) values ('13','Sh수협');
Insert into BANK (BANK_CODE,BANK_NAME) values ('14','광주은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('15','전북은행');
Insert into BANK (BANK_CODE,BANK_NAME) values ('16','제주은행');
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('F','202010010001','자유게시판',to_date('20/07/24','RR/MM/DD'),to_date('20/07/24','RR/MM/DD'),1,'Y','Y','N','N','Y',3,1048576,'B','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('SNF','202010010001','분실물/습득물',to_date('20/07/24','RR/MM/DD'),to_date('20/07/24','RR/MM/DD'),2,'Y','Y','N','N','Y',3,1048576,'B','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('M','202010010001','벼룩시장',to_date('20/07/24','RR/MM/DD'),to_date('20/07/24','RR/MM/DD'),3,'Y','Y','N','N','Y',3,1048576,'B','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('R','202010010001','하숙자취방정보',to_date('20/07/24','RR/MM/DD'),to_date('20/07/24','RR/MM/DD'),4,'Y','Y','N','N','N',3,1048576,'B','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('P','202010010001','포털공지',to_date('20/07/27','RR/MM/DD'),to_date('20/08/12','RR/MM/DD'),1,'Y','N','N','N','Y',2,2,'N','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('H','202010010001','홈페이지공지',to_date('20/07/27','RR/MM/DD'),to_date('20/08/12','RR/MM/DD'),2,'Y','N','N','N','Y',2,2,'N','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('W','202010010001','서식자료실',to_date('20/07/27','RR/MM/DD'),to_date('20/07/27','RR/MM/DD'),1,'Y','N','N','N','Y',5,10485760,'P','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('PG','202010010001','프로그램자료실',to_date('20/07/27','RR/MM/DD'),to_date('20/07/27','RR/MM/DD'),2,'Y','N','N','N','Y',5,10485760,'P','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('NON','202010010001','미사용게시판',to_date('20/07/24','RR/MM/DD'),to_date('20/07/24','RR/MM/DD'),1,'N','Y','N','N','Y',3,1048576,'B','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('QNA','202010010001','질문답변',to_date('20/08/05','RR/MM/DD'),to_date('20/08/05','RR/MM/DD'),1,'Y','N','Y','Y','N',0,1048576,'S','STAFF');
Insert into BOARD (BD_CODE,OFFICIAL_NO,BD_NAME,REG_DATE,EDIT_DATE,BD_ORDER,USAGE,IS_REPLY,IS_COMMENT,IS_PRIVATE,IS_UPLOAD,MAX_UPFILE,MAX_FILESIZE,CATEGORY_CODE,AUTH_CODE) values ('ABC','202010040001','실습게시판',to_date('20/08/14','RR/MM/DD'),to_date('20/08/18','RR/MM/DD'),1,'N','Y','Y','Y','Y',3,1,'B','ASSISTANT');
REM INSERTING into BOOKMARK
SET DEFINE OFF;
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (9,'202030860003','수강신청','/portal/registration/main');
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (11,'202032900005','캠퍼스맵','/portal/campusMap');
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (12,'202030860003','성적조회','/portal/student/studentScore');
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (7,'202010040001','즐겨찾기 관리','/portal/bookmark/manager');
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (6,'202010010001','게시판 메인','/portal/portal/board/main?categoryCode=B');
Insert into BOOKMARK (NO,OFFICIAL_NO,NAME,URL) values (14,'202030860003','인덱스','/portal/index');
REM INSERTING into BUILDING
SET DEFINE OFF;
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('A001','의대동','정문 우측 150m','02-1234-0107');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('A002','의대동','정문 우측 20m','02-1234-0108');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('A003','의대동','정문 우측 40m','02-1234-0109');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('A004','의대동','정문 우측 80m','02-1234-0110');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B001','공과대학동','후문 좌측 50m','02-1234-0111');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B002','공과대학동','후문 좌측 50m','02-1234-0112');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B003','공과대학동','후문 우측 20m','02-1234-0113');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B004','공과대학동','후문 우측 20m','02-1234-0115');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B005','인문사회동','후문 우측 80m','02-1234-0116');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('B006','인문사회동','후문 우측 80m','02-1234-0117');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('C001','인문사회동','정문 좌측 40m','02-1234-0118');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('C002','인문사회동','정문 좌측 40m','02-1234-0119');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('C003','인문사회동','정문 좌측 30m','02-1234-0120');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('C004','인문사회동','정문 좌측 80m','02-1234-0121');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('C005','자연과학동','정문 좌측 100m','02-1234-0122');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('D001','자연과학동','정문 좌측 120m','02-1234-0123');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('D002','자연과학동','정문 좌측 150m','02-1234-0124');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('E001','예술대학동','후문 우측 130m','02-1234-0125');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('E002','예술대학동','후문 우측 140m','02-1234-0126');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('F001','자연과학동','후문 좌측 15m','02-1234-0127');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('G001','자연과학동','후문 우측 115m','02-1234-0128');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('G002','자연과학동','후문 우측 135m','02-1234-0129');
Insert into BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL,TEL) values ('Z001','본관','캠퍼스 중앙','02-1234-0114');
REM INSERTING into CATEGORY
SET DEFINE OFF;
Insert into CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values ('B','게시판','Y',to_date('20/07/24','RR/MM/DD'));
Insert into CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values ('N','공지','Y',to_date('20/07/24','RR/MM/DD'));
Insert into CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values ('P','포털자료실','Y',to_date('20/07/24','RR/MM/DD'));
Insert into CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values ('S','질문답변','N',to_date('20/08/05','RR/MM/DD'));
REM INSERTING into CERTIFICATION
SET DEFINE OFF;
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0002','certEnroll',1,'202030860003',to_date('20/08/13','RR/MM/DD'),'Y','재학증명서');
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0001','certEnroll',1,'202030860003',to_date('20/08/13','RR/MM/DD'),'Y','재학증명서');
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0003','certAward',1,'202030860003',to_date('20/08/13','RR/MM/DD'),'Y','장학증명서');
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0004','certEnroll',1,'202030860003',to_date('20/08/14','RR/MM/DD'),'Y','재학증명서');
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0005','certEnroll',1,'202030010008',to_date('20/08/19','RR/MM/DD'),'Y','재학증명서');
Insert into CERTIFICATION (NO,CERT_CODE,QTY,STU_NO,REG_DATE,IS_PRINT,CERT_NAME) values ('2020-0006','certEnroll',1,'202030860003',to_date('20/08/19','RR/MM/DD'),'Y','재학증명서');
REM INSERTING into CHATMESSAGE
SET DEFINE OFF;
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (153,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202031380019','김상국','김상국(202031380019)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (154,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202031380019','김상국','나는아니지롱','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (162,'71bd2b02-3aab-4eb9-8d1d-163f5b770703','202031390020','박노아','박노아(202031390020)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (163,'71bd2b02-3aab-4eb9-8d1d-163f5b770703','202031390020','박노아','박노아(202031390020)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (146,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (152,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','안녕하세요 유준석입니다','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (164,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202031390020','박노아','박노아(202031390020)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (165,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202031390020','박노아','박노아(202031390020)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (166,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (193,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (194,'71bd2b02-3aab-4eb9-8d1d-163f5b770703','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (195,'71bd2b02-3aab-4eb9-8d1d-163f5b770703','202010050002','박철','ㅎㅇ','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (199,'90ae5449-a717-45b4-92be-13146d656497','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (209,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (210,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (211,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (212,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (213,'ee96ab5f-7970-4644-9679-1865186ac664','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (214,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (215,'ee96ab5f-7970-4644-9679-1865186ac664','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (216,'833552b7-a423-4c1f-9d6c-0fca37b5216e','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (217,'833552b7-a423-4c1f-9d6c-0fca37b5216e','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (218,'badab663-5d73-4b4b-8697-1602d53512bd','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (219,'badab663-5d73-4b4b-8697-1602d53512bd','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (220,'3c402b95-56bb-4af5-9b4c-dbf8b55d7df6','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (221,'3c402b95-56bb-4af5-9b4c-dbf8b55d7df6','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (225,'c9938a8d-a617-46eb-bb56-bb248a337e82','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (226,'c9938a8d-a617-46eb-bb56-bb248a337e82','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (227,'ee96ab5f-7970-4644-9679-1865186ac664','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (228,'ee96ab5f-7970-4644-9679-1865186ac664','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (191,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (192,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202010050002','박철','?','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (55,'90ae5449-a717-45b4-92be-13146d656497','202020010001','김교수','김교수(202020010001)님이 입장하셨습니다.','ENTER',to_date('20/08/10','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (56,'90ae5449-a717-45b4-92be-13146d656497','202020010001','김교수','김교수(202020010001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/10','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (54,'90ae5449-a717-45b4-92be-13146d656497','202030010001','수학생','수학생(202030010001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/04','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (57,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (58,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (59,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (60,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (61,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (62,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (85,'90ae5449-a717-45b4-92be-13146d656497','202021111111','박철','박철(202021111111)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (86,'90ae5449-a717-45b4-92be-13146d656497','202021111111','박철','박철(202021111111)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (87,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202021111111','박철','박철(202021111111)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (88,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202021111111','박철','박철(202021111111)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (91,'90ae5449-a717-45b4-92be-13146d656497','202021111111','박철','박철(202021111111)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (52,'90ae5449-a717-45b4-92be-13146d656497','202030010001','수학생','수학생(202030010001)님이 입장하셨습니다.','ENTER',to_date('20/08/04','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (53,'90ae5449-a717-45b4-92be-13146d656497','202030010001','수학생','어서오세요 사회복지학과 입니다','CHAT',to_date('20/08/04','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (92,'90ae5449-a717-45b4-92be-13146d656497','202021111111','박철','박철(202021111111)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (126,'90ae5449-a717-45b4-92be-13146d656497','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (127,'90ae5449-a717-45b4-92be-13146d656497','202010030003','유준석','안녕하세요 신입생입니다.','CHAT',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (128,'90ae5449-a717-45b4-92be-13146d656497','202010030003','유준석','궁금한 사항이 있는데 질문 가능 할까요?','CHAT',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (129,'90ae5449-a717-45b4-92be-13146d656497','202010030003','유준석','혹시 학생처가 어느 건물에 있나요?','CHAT',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (130,'90ae5449-a717-45b4-92be-13146d656497','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (63,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (64,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (65,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (66,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (67,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (68,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (223,'c9938a8d-a617-46eb-bb56-bb248a337e82','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (70,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (71,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','안녕하세요','CHAT',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (72,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (73,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (74,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (224,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (79,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (80,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','ㅇㄹㄹㄹㅇ','CHAT',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (81,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/14','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (222,'c9938a8d-a617-46eb-bb56-bb248a337e82','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (95,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (96,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','gd','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (97,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (98,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (99,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (100,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (101,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (102,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (103,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㅎㅇ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (104,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (105,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (106,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철',null,'CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (107,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (108,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (109,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (110,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (111,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철',null,'CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (112,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ\','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (113,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (114,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (115,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (116,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (117,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (118,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','ㄴ','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (119,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철',null,'CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (120,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','반응 구데기','CHAT',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (121,'90ae5449-a717-45b4-92be-13146d656497','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (122,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010040001','이의철','이의철(202010040001)님이 입장하셨습니다.','ENTER',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (123,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010040001','이의철','이의철(202010040001)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/17','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (131,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (132,'90ae5449-a717-45b4-92be-13146d656497','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (133,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (134,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (142,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','해명하십쇼','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (143,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (137,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 입장하셨습니다.','ENTER',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (138,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202030860003','김우석','김우석(202030860003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/18','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (144,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (140,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (141,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','박철교수님','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (145,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (147,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (148,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','dhdh','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (149,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','오오','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (150,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','채팅이 된다니','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (151,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (155,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202031380019','김상국','김상국(202031380019)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (156,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202031380019','김상국','김상국(202031380019)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (157,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202031380019','김상국','김상국(202031380019)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (158,'90ae5449-a717-45b4-92be-13146d656497','202031380019','김상국','김상국(202031380019)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (159,'90ae5449-a717-45b4-92be-13146d656497','202031380019','김상국','김상국(202031380019)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (160,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202031380019','김상국','김상국(202031380019)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (161,'baf6830e-535d-4ab9-a447-6bbd41a854e0','202031380019','김상국','김상국(202031380019)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (196,'71bd2b02-3aab-4eb9-8d1d-163f5b770703','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (197,'90ae5449-a717-45b4-92be-13146d656497','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (198,'90ae5449-a717-45b4-92be-13146d656497','202010050002','박철','ㄹㄹ','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (200,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (201,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010050002','박철','드루와','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (202,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010050002','박철','드루와','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (203,'fd4c65dc-caea-48e7-a3e5-98108b54350c','202010050002','박철','박철(202010050002)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (204,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010050002','박철','박철(202010050002)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (205,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (206,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','없습니다','CHAT',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (207,'47cb923a-9e44-42df-8eea-8c880a57cbe3','202010030003','유준석','유준석(202010030003)님이 퇴장하셨습니다.','LEAVE',to_date('20/08/19','RR/MM/DD'));
Insert into CHATMESSAGE (NO,ROOM_ID,WRITER_ID,WRITER_NAME,MESSAGE,TYPE,REG_DATE) values (208,'2b74c6f2-0cd3-4da4-9194-5e9592025b4e','202010030003','유준석','유준석(202010030003)님이 입장하셨습니다.','ENTER',to_date('20/08/19','RR/MM/DD'));
REM INSERTING into CHATROOM
SET DEFINE OFF;
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('baf6830e-535d-4ab9-a447-6bbd41a854e0','척척하사 채팅방','202010030003',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('71bd2b02-3aab-4eb9-8d1d-163f5b770703','새방','202031390020',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('2b74c6f2-0cd3-4da4-9194-5e9592025b4e','방방방','202031390020',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('90ae5449-a717-45b4-92be-13146d656497','사회복지학과 모여라','202030010001',to_date('20/08/04','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('fd4c65dc-caea-48e7-a3e5-98108b54350c','박철교수님 질문있습니다.','202010040001',to_date('20/08/14','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('c9938a8d-a617-46eb-bb56-bb248a337e82','아 ... 끝냈네','202010050002',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('833552b7-a423-4c1f-9d6c-0fca37b5216e','박철 기장님 질문있습니다','202010050002',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('47cb923a-9e44-42df-8eea-8c880a57cbe3','박철 기장님 질문있습니다','202010050002',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('ee96ab5f-7970-4644-9679-1865186ac664','박철 기장님 질문있습니다','202010050002',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('badab663-5d73-4b4b-8697-1602d53512bd','박철 기장님 질문있습니다','202010050002',to_date('20/08/19','RR/MM/DD'));
Insert into CHATROOM (ROOM_ID,NAME,OFFICIAL_NO,REG_DATE) values ('3c402b95-56bb-4af5-9b4c-dbf8b55d7df6','박철 기장님 질문있다니까 왜 끝내요','202010050002',to_date('20/08/19','RR/MM/DD'));
REM INSERTING into CLASSROOM
SET DEFINE OFF;
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-07','관현악과 1강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-01','관현악실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-06','관현악과 2강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-179-03','통계학 3강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-180-01','화학 1강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-180-02','화학 2강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-180-03','화학 3강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A002-001-22','간호학과 1강의실','A002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-329-02','임상수의학과 2강의실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-329-03','임상수의학과 1실습실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-329-04','임상수의학과 2실습실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-005-01','토목공학과 1강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-005-02','토목공학과 2강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-005-03','토목공학과 1실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-005-04','토목공학과 2실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-006-01','건축학과 1강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-006-02','건축학과 2강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-006-03','건축학과 1실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-006-04','건축학과 2실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-007-01','건축공학과 1강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-007-02','건축공학과 2강의실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-007-03','건축공학과 1실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B001-007-04','건축공학과 2실습실','B001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-012-01','산업공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-012-02','산업공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-012-03','산업공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-012-04','산업공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-013-01','에너지공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-132-01','의예과 1강의실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-132-02','의예과 2강의실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-132-03','의예과 1실습실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-132-04','의예과 2실습실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-133-01','의학과 1강의실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-133-02','의학과 2강의실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-133-03','의학과 1실습실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A001-133-04','의학과 2실습실','A001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-115-01','제약학과 1강의실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-115-02','제약학과 2강의실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-115-03','제약학과 1실습실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-115-04','제약학과 2실습실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-114-01','약학과 1강의실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-114-02','약학과 2강의실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-114-03','약학과 1실습실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A003-114-04','약학과 2실습실','A003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-326-01','수의학과 1강의실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-326-02','수의학과 2강의실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-326-03','수의학과 1실습실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-326-04','수의학과 2실습실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('A004-329-01','임상수의학과 1강의실','A004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-013-02','에너지공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-013-03','에너지공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-013-04','에너지공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-016-01','반도체공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-016-02','반도체공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-016-03','반도체공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-016-04','반도체공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-017-01','원자핵공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-017-02','원자핵공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-017-03','원자핵공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-017-04','원자핵공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-018-01','재료공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-018-02','재료공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-018-03','재료공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-018-04','재료공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-019-01','전기공학과 1강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-019-02','전기공학과 2강의실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-019-03','전기공학과 1실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B002-019-04','전기공학과 2실습실','B002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-002-01','경영학과 1강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-002-02','경영학과 2강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-002-03','경영학과 1실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-002-04','경영학과 2실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-004-01','벤처경영학과 1강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-004-02','벤처경영학과 2강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-004-03','벤처경영학과 1실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-004-04','벤처경영학과 2실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-010-01','기계공학 1강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-010-02','기계공학 2강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-010-03','기계공학 1실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-010-04','기계공학 2실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-084-01','경제학과 1강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-084-02','경제학과 2강의실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-084-03','경제학과 1실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B003-084-04','경제학과 2실습실','B003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-02','관악전공 2강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-03','관악전공 1실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-111-04','관악전공 2실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-112-01','피아노전공 1강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-112-02','피아노전공 2강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-112-03','피아노전공 1실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-112-04','피아노전공 2실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-113-01','현악전공 1강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-113-02','현악전공 2강의실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-113-03','현악전공 1실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B004-113-04','현악전공 2실습실','B004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-022-01','환경학과 1강의실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-022-02','환경학과 2강의실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-022-03','환경학과 1실습실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-022-04','환경학과 2실습실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-024-01','생명공학과 1강의실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-024-02','생명공학과 2강의실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-024-03','생명공학과 1실습실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B005-024-04','생명공학과 2실습실','B005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-134-01','고고학과 1강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-134-02','고고학과 2강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-134-03','고고학과 1실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-134-04','고고학과 2실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-135-01','미술사학과 1강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-135-02','미술사학과 2강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-135-03','미술사학과 1실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-135-04','미술사학과 2실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-189-01','국제학과 1강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-189-02','국제학과 2강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-189-03','국제학과 1실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-189-04','국제학과 2실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-190-01','국제지역학과 1강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-190-02','국제지역학과 2강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-190-03','국제지역학과 1실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-190-04','국제지역학과 2실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-225-01','기계공학과 1강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-225-02','기계공학과 2강의실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-225-03','기계공학과 1실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('B006-225-04','기계공학과 2실습실','B006');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-138-01','국어국문학과 1강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-138-02','국어국문학과 2강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-138-03','국어국문학과 3강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-139-01','노어노문학과 1강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-139-02','노어노문학과 2강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-139-03','노어노문학과 3강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-140-01','독어독문학과 1강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-140-02','독어독문학과 2강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-140-03','독어독문학과 3강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-166-01','중어중문학과 1강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-166-02','중어중문학과 2강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C001-166-03','중어중문학과 3강의실','C001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-098-01','정치학 1강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-098-02','정치학 2강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-098-03','정치학 3강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-099-01','외교학 1강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-099-02','외교학 2강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C002-099-03','외교학 3강의실','C002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-165-01','1강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-165-02','2강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-165-03','3강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-167-01','1강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-167-02','2강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C003-167-03','3강의실','C003');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-086-01','사회복지학과 1강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-086-02','사회복지학과 2강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-086-03','사회복지학과 3강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-087-01','사회학과 1강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-087-02','사회학과 2강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-087-03','사회학과 3강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-168-01','물리학 1강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-168-02','물리학 2강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-168-03','물리학 3강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-169-01','천문·기상학 1강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-169-02','천문·기상학 2강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-169-03','천문·기상학 3강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-290-01','법학과 1강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-290-02','법학과 2강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C004-290-03','법학과 3강의실','C004');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-300-01','산림환경학과 1강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-300-02','산림환경학과 2강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-300-03','산림환경학과 1실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-300-04','산림환경학과 2실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-301-01','임산공학과 1강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-301-02','임산공학과 2강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-301-03','임산공학과 1실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-301-04','임산공학과 2실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-303-01','산림자원학과 1강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-303-02','산림자원학과 2강의실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-303-03','산림자원학과 1실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('C005-303-04','산림자원학과 2실습실','C005');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-067-01','교육학 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-067-02','교육학 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-067-03','교육학 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-067-04','교육학 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-068-01','국어교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-068-02','국어교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-068-03','국어교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-068-04','국어교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-069-01','독어교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-069-02','독어교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-069-03','독어교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-069-04','독어교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-070-01','물리교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-070-02','물리교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-070-03','물리교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-070-04','물리교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-071-01','불어교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-071-02','불어교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-071-03','불어교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-071-04','불어교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-072-01','사회교육계열 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-072-02','사회교육계열 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-072-03','사회교육계열 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-072-04','사회교육계열 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-073-01','사회교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-073-02','사회교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-073-03','사회교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-073-04','사회교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-074-01','생물교육과 1강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-074-02','생물교육과 2강의실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-074-03','생물교육과 1실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D001-074-04','생물교육과 2실습실','D001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-075-01','수학교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-075-02','수학교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-075-03','수학교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-075-04','수학교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-076-01','역사교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-076-02','역사교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-076-03','역사교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-076-04','역사교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-077-01','영어교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-077-02','영어교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-077-03','영어교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-077-04','영어교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-079-01','윤리교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-079-02','윤리교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-079-03','윤리교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-079-04','윤리교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-081-01','지리교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-081-02','지리교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-081-03','지리교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-081-04','지리교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-082-01','체육교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-082-02','체육교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-082-03','체육교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-082-04','체육교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-083-01','화학교육과 1강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-083-02','화학교육과 2강의실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-083-03','화학교육과 1실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('D002-083-04','화학교육과 2실습실','D002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-053-01','도예전공 1강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-053-02','도예전공 2강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-053-03','도예전공 1실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-053-04','도예전공 2실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-054-01','동양화과 1강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-054-02','동양화과 2강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-054-03','동양화과 1실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-054-04','동양화과 2실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-055-01','디자인학과 1강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-055-02','디자인학과 2강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-055-03','디자인학과 1실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-055-04','디자인학과 2실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-056-01','공예과 1강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-056-02','공예과 2강의실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-056-03','공예과 1실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E001-056-04','공예과 2실습실','E001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-057-01','금속공예과 1강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-057-02','금속공예과 2강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-057-03','금속공예과 1실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-057-04','금속공예과 2실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-058-01','디자인 1강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-058-02','디자인 2강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-058-03','디자인 1실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-058-04','디자인 2실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-060-01','서양화과 1강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-060-02','서양화과 2강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-060-03','서양화과 1실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-060-04','서양화과 2실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-061-01','시각디자인과 1강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-061-02','시각디자인과 2강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-061-03','시각디자인과 1실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-061-04','시각디자인과 2실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-064-01','조소과 1강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-064-02','조소과 2강의실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-064-03','조소과 1실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('E002-064-04','조소과 2실습실','E002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-334-01','농업학과 1강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-334-02','농업학과 2강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-334-03','농업학과 1실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-334-04','농업학과 2실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-335-01','원예과학과 1강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-335-02','원예과학과 2강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-335-03','원예과학과 1실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-335-04','원예과학과 2실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-337-01','작물·원예학 1강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-337-02','작물·원예학 2강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-337-03','작물·원예학1실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-337-04','작물·원예학 2실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-338-01','식품공학과 1강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-338-02','식품공학과 2강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-338-03','식품공학과 1실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-338-04','식품공학과 2실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-339-01','식품영양학과 1강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-339-02','식품영양학과 2강의실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-339-03','식품영양학과 1실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('F001-339-04','식품영양학과 2실습실','F001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-088-01','심리학과 1강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-088-02','심리학과 2강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-088-03','심리학과 3강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-089-01','언론정보학과 1강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-089-02','언론정보학과 2강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-089-03','언론정보학과 3강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-092-01','국제지역학 1강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-092-02','국제지역학 2강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-092-03','국제지역학 3강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-096-01','인류학 1강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-096-02','인류학 2강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-096-03','인류학 3강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-097-01','지리학과 1강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-097-02','지리학과 2강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G001-097-03','지리학과 3강의실','G001');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-172-01','생명과학과 1강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-172-02','생명과학과 2강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-172-03','생명과학과 3강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-173-01','수학과 1강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-173-02','수학과 2강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-173-03','수학과 3강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-178-01','환경학 1강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-178-02','환경학 2강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-178-03','환경학 3강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-179-01','통계학 1강의실','G002');
Insert into CLASSROOM (CLASSROOM_CODE,CLASSROOM_NAME,BUILDING_CODE) values ('G002-179-02','통계학 2강의실','G002');
REM INSERTING into DEPARTMENT
SET DEFINE OFF;
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (1,'간호학과','02-1234-0001','A002',2,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (5,'토목공학과','02-1234-0002','B001',5,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (6,'건축학과','02-1234-0003','B001',5,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (7,'건축공학과','02-1234-0004','B001',5,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (2,'경영학과','02-1234-0005','B003',6,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (4,'벤처경영학과','02-1234-0006','B003',6,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (84,'경제학과','02-1234-0007','B003',7,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (134,'고고학과','02-1234-0008','B006',8,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (135,'미술사학과','02-1234-0009','B006',8,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (12,'산업공학과','02-1234-0010','B002',9,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (16,'반도체공학과','02-1234-0011','B002',9,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (18,'재료공학과','02-1234-0012','B002',9,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (67,'교육학','02-1234-0013','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (68,'국어교육과','02-1234-0014','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (69,'독어교육과','02-1234-0015','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (70,'물리교육과','02-1234-0016','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (71,'불어교육과','02-1234-0017','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (72,'사회교육계열','02-1234-0018','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (73,'사회교육과','02-1234-0019','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (74,'생물교육과','02-1234-0020','D001',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (75,'수학교육과','02-1234-0021','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (76,'역사교육과','02-1234-0022','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (77,'영어교육과','02-1234-0023','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (79,'윤리교육과','02-1234-0024','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (80,'지구과학교육과','02-1234-0025','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (81,'지리교육과','02-1234-0026','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (82,'체육교육과','02-1234-0027','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (83,'화학교육과','02-1234-0028','D002',10,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (188,'국제개발정책학과','02-1234-0029','B006',11,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (189,'국제학과','02-1234-0030','B006',11,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (190,'국제지역학과','02-1234-0031','B006',11,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (191,'무역·유통학과','02-1234-0032','B006',11,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (225,'기계공학과','02-1234-0033','B006',12,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (226,'멀티스케일기계설계과','02-1234-0034','B006',12,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (10,'기계공학','02-1234-0035','B003',13,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (11,'항공·우주공학과','02-1234-0036','B003',13,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (111,'관악전공','02-1234-0037','B004',14,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (112,'피아노전공','02-1234-0038','B004',14,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (113,'현악전공','02-1234-0039','B004',14,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (54,'동양화과','02-1234-0040','E001',15,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (53,'도예전공','02-1234-0041','E001',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (55,'디자인학과','02-1234-0042','E001',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (56,'공예과','02-1234-0043','E001',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (57,'금속공예과','02-1234-0044','E002',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (58,'디자인','02-1234-0045','E002',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (61,'시각디자인과','02-1234-0046','E002',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (62,'통합창의디자인과','02-1234-0047','E002',16,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (168,'물리학','02-1234-0048','C004',17,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (169,'천문·기상학','02-1234-0049','C004',17,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (285,'바이오소재공학과','02-1234-0050','B004',18,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (286,'바이오시스템공학과','02-1234-0051','B004',18,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (287,'바이오엔지니어링과','02-1234-0052','B004',18,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (290,'법학과','02-1234-0053','C004',19,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (85,'교양사회과학과','02-1234-0054','C004',20,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (86,'사회복지학과','02-1234-0055','C004',20,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (87,'사회학과','02-1234-0056','C004',20,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (300,'산림환경학과','02-1234-0057','C005',21,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (301,'임산공학과','02-1234-0058','C005',21,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (302,'환경재료과학과','02-1234-0059','C005',21,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (303,'산림자원학과','02-1234-0060','C005',21,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (104,'소비자·가정자원과','02-1234-0061','C005',22,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (106,'아동·가족학과','02-1234-0062','C005',22,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (326,'수의학과','02-1234-0063','A004',4,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (327,'산업동물임상의학과','02-1234-0064','A004',4,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (328,'수의생명과학과','02-1234-0065','A004',4,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (329,'임상수의학과','02-1234-0066','A004',4,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (60,'서양화과','02-1234-0067','E002',23,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (64,'조소과','02-1234-0068','E002',23,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (333,'식물생산과학과','02-1234-0069','F001',24,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (338,'식품공학과','02-1234-0070','F001',25,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (339,'식품영양학과','02-1234-0071','F001',25,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (114,'약학과','02-1234-0072','A003',3,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (115,'제약학과','02-1234-0073','A003',3,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (138,'국어국문학과','02-1234-0074','C001',26,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (139,'노어노문학과','02-1234-0075','C001',26,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (140,'독어독문학과','02-1234-0076','C001',26,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (143,'프랑스어·문학','02-1234-0077','C001',26,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (166,'중어중문학과','02-1234-0078','C001',26,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (13,'에너지공학과','02-1234-0079','B002',27,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (17,'원자핵공학과','02-1234-0080','B002',27,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (108,'의류·의상학과','02-1234-0081','C002',28,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (132,'의예과','02-1234-0082','A001',1,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (133,'의학과','02-1234-0083','A001',1,200);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (96,'인류학','02-1234-0084','G001',29,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (97,'지리학과','02-1234-0085','G001',29,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (88,'심리학과','02-1234-0086','G001',30,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (89,'언론정보학과','02-1234-0087','G001',30,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (92,'국제지역학','02-1234-0088','G001',30,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (172,'생명과학과','02-1234-0089','G002',31,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (173,'수학과','02-1234-0090','G002',31,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (178,'환경학','02-1234-0091','G002',31,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (179,'통계학','02-1234-0092','G002',31,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (180,'화학','02-1234-0093','G002',31,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (334,'농업학과','02-1234-0094','F001',32,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (335,'원예과학과','02-1234-0095','F001',32,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (336,'작물생명과학과','02-1234-0096','F001',32,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (337,'작물·원예학','02-1234-0097','F001',32,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (19,'전기공학과','02-1234-0098','B002',33,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (98,'정치학','02-1234-0099','C002',34,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (99,'외교학','02-1234-0100','C002',34,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (21,'조선·해양공학과','02-1234-0101','B002',35,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (165,'종교학과','02-1234-0102','C003',36,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (167,'철학·윤리학','02-1234-0103','C003',36,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (22,'환경학과','02-1234-0104','B005',37,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (23,'전산학·컴퓨터공학과','02-1234-0105','B005',38,140);
Insert into DEPARTMENT (DEP_NO,DEP_NAME,TEL,BUILDING_CODE,FACULTY_NO,TOTAL_CREDIT) values (24,'생명공학과','02-1234-0106','B005',39,140);
REM INSERTING into DISTRIBUTE_ASSIGN
SET DEFINE OFF;
Insert into DISTRIBUTE_ASSIGN (ASSIGN_NO,OPEN_SUB_CODE,ASSIGN_NAME,REG_DATE) values (17,'001-013','깜지 200장',to_date('20/08/19','RR/MM/DD'));
REM INSERTING into EMPLOYEE
SET DEFINE OFF;
Insert into EMPLOYEE (EMP_NO,PWD,START_DATE,DEP_CODE,AUTH_CODE,EMP_NAME,RESIGNATION_DATE,IDENTITY_STATE,POSITION_CODE) values ('202010050005','920501',to_date('20/08/18','RR/MM/DD'),'5','ADMIN','황재현',null,'N','1');
Insert into EMPLOYEE (EMP_NO,PWD,START_DATE,DEP_CODE,AUTH_CODE,EMP_NAME,RESIGNATION_DATE,IDENTITY_STATE,POSITION_CODE) values ('202010040001','940303',to_date('20/08/12','RR/MM/DD'),'4','STAFF','이의철',null,'N','1');
Insert into EMPLOYEE (EMP_NO,PWD,START_DATE,DEP_CODE,AUTH_CODE,EMP_NAME,RESIGNATION_DATE,IDENTITY_STATE,POSITION_CODE) values ('202010050002','$2a$10$a9bFtMNAXy6kj7u3b60XSOYYOjHilEHVN2AXG5mTelZ6cS2l3X5ri',to_date('20/08/18','RR/MM/DD'),'5','ADMIN','박철',null,'N','1');
Insert into EMPLOYEE (EMP_NO,PWD,START_DATE,DEP_CODE,AUTH_CODE,EMP_NAME,RESIGNATION_DATE,IDENTITY_STATE,POSITION_CODE) values ('202010030003','$2a$10$1cUvtOFyqZhA2U6lXG1eO.IcA9kor3x5BocGNHZmkVW/BqyKet8H.',to_date('20/08/18','RR/MM/DD'),'3','STAFF','유준석',null,'N','2');
Insert into EMPLOYEE (EMP_NO,PWD,START_DATE,DEP_CODE,AUTH_CODE,EMP_NAME,RESIGNATION_DATE,IDENTITY_STATE,POSITION_CODE) values ('202010020004','950328',to_date('20/08/18','RR/MM/DD'),'2','ASSISTANT','유철구',null,'N','2');
REM INSERTING into EMP_DEPART
SET DEFINE OFF;
Insert into EMP_DEPART (DEP_CODE,DEP_NAME) values ('1','교학처');
Insert into EMP_DEPART (DEP_CODE,DEP_NAME) values ('2','기획처');
Insert into EMP_DEPART (DEP_CODE,DEP_NAME) values ('3','학생처');
Insert into EMP_DEPART (DEP_CODE,DEP_NAME) values ('4','입학홍보처');
Insert into EMP_DEPART (DEP_CODE,DEP_NAME) values ('5','사무처');
REM INSERTING into EMP_POSITION
SET DEFINE OFF;
Insert into EMP_POSITION (POSITION_CODE,POSITION_NAME) values ('1','부장');
Insert into EMP_POSITION (POSITION_CODE,POSITION_NAME) values ('2','주임');
Insert into EMP_POSITION (POSITION_CODE,POSITION_NAME) values ('3','사원');
REM INSERTING into EVALUATION
SET DEFINE OFF;
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030860003','MRC',1,1,2,2,2,85,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030100009','MRC',1,1,2,2,2,56,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-022','202030100009','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202032250002','MRC',2,2,2,2,2,78,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-022','202032250002','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202032250002','MRC',3,3,3,3,3,93,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202033340004','MRC',2,2,2,2,2,77,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-022','202033340004','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202033340004','MRC',4,4,4,4,4,65,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202033360017','MRC',0,0,0,0,0,87,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202033360017','MRC',0,0,0,0,0,76,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202033360017','BRC',0,0,0,0,0,60,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('006-018','202030860003','GEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030240011','MRC',1,1,0,0,0,74,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030840010','MRC',1,1,2,2,2,84,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030240011','MRC',2,2,2,2,2,56,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030210016','MRC',1,1,0,0,0,78,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202031650015','MRC',0,0,0,0,0,93,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202031650015','MRC',3,3,3,3,3,95,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030210016','MRC',1,1,1,1,1,86,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202033360017','MRC',4,4,4,4,4,88,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202031650015','MRC',0,0,0,0,0,98,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202031650015','BRC',0,0,0,0,0,98,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202030210016','BRC',0,0,0,0,0,77,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202030210016','MRC',0,0,0,0,0,66,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202032900005','MRC',4,4,4,4,4,92,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('002-016','202032900005','MRC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030010008','MRC',1,1,1,1,1,85,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-022','202030010008','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030010008','MRC',1,1,1,1,1,1,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-021','202030840010','MRC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-024','202030840010','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-022','202030860003','MEC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030860003','MRC',2,2,2,2,2,88,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202031150006','MRC',1,1,2,2,2,96,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202031150006','MRC',3,3,3,3,3,97,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('024-021','202031150006','MRC',null,null,null,null,null,null,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030220014','MRC',1,1,0,0,0,87,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030220014','MRC',1,1,1,1,1,88,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030890018','MRC',1,1,0,0,0,95,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030890018','MRC',0,0,0,0,0,11,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202030220014','BRC',0,0,0,0,0,79,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202030220014','MRC',0,0,0,0,0,78,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202030890018','BRC',0,0,0,0,0,86,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202030890018','MRC',0,0,0,0,0,94,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202031380019','MRC',1,1,0,0,0,80,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202031380019','BRC',0,0,0,0,0,98,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202031380019','MRC',0,0,0,0,0,45,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202031380019','MRC',0,0,0,0,0,87,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202031390020','MRC',1,1,0,0,0,90,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202031390020','BRC',0,0,0,0,0,75,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202031390020','MRC',0,0,0,0,0,65,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202031390020','MRC',0,0,0,0,0,86,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-013','202030920021','MRC',1,1,0,0,0,66,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202030920021','BRC',0,0,0,0,0,83,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-011','202030920021','MRC',0,0,0,0,0,99,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-029','202030920021','MRC',0,0,0,0,0,68,to_date('20/08/19','RR/MM/DD'),null);
Insert into EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('001-017','202030860003','BRC',0,0,0,0,0,93,to_date('20/08/19','RR/MM/DD'),null);
REM INSERTING into FACULTY
SET DEFINE OFF;
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (1,'의학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (2,'간호학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (3,'약학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (4,'수의학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (5,'건설환경공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (6,'경영학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (7,'경제학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (8,'고고미술사학과');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (9,'공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (10,'교육학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (11,'국제학과');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (12,'기계공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (13,'기계항공공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (14,'기악부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (15,'동양화과');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (16,'디자인학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (17,'물리·천문학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (18,'바이오시스템·소재학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (19,'법학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (20,'사회학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (21,'산림과학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (22,'소비자아동학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (23,'순수미술학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (24,'식물생산과학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (25,'식품영양학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (26,'어문학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (27,'에너지자원공학과');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (28,'의류학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (29,'인류.지리학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (30,'인문학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (31,'자연과학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (32,'작물·원예학');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (33,'전기·정보공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (34,'정치외교학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (35,'조선·해양공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (36,'종교·철학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (37,'지구환경시스템공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (38,'컴퓨터공학부');
Insert into FACULTY (FACULTY_NO,FACULTY_NAME) values (39,'화학생물공학부');
REM INSERTING into FILES
SET DEFINE OFF;
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (42,69,'실전반 신청서_20200818153254426.hwp',17920,'실전반 신청서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (39,46,'java6강_static_상속_20200818105200308.pdf',1287428,'java6강_static_상속.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (51,76,'붙임2) 교직원 단체상해보험 계약조건 및 유의사항_20200818182237807.hwp',23040,'붙임2) 교직원 단체상해보험 계약조건 및 유의사항.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (52,76,'붙임3) 제출서식(본교 소정양식)_20200818182237809.hwp',28160,'붙임3) 제출서식(본교 소정양식).hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (6,18,'back2_20200803104302768.jpg',23321,'back2.jpg',0,to_date('20/08/03','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (20,31,'[교수학습개발센터] 2020-1 온라인 학습법 공모전 참여 신청서_20200812204118446.hwp',1015808,'[교수학습개발센터] 2020-1 온라인 학습법 공모전 참여 신청서.hwp',0,to_date('20/08/12','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (53,77,'[붙임]2020학년도 기업 맞춤형 전문 기업 지원 서비스를 위한 마이크로 타겟팅 제출서류_20200818182354904.hwp',75776,'[붙임]2020학년도 기업 맞춤형 전문 기업 지원 서비스를 위한 마이크로 타겟팅 제출서류.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (54,80,'출생신고서_20200818183743145.doc',57344,'출생신고서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (55,80,'출생신고서_20200818183743151.hwp',28434,'출생신고서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (41,68,'[붙임]2020학년도 기업 맞춤형 전문 기업 지원 서비스를 위한 마이크로 타겟팅 제출서류_20200818153155734.hwp',75776,'[붙임]2020학년도 기업 맞춤형 전문 기업 지원 서비스를 위한 마이크로 타겟팅 제출서류.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (45,71,'고소장(고발장, 진정서, 탄원서)_20200818164223505.doc',22016,'고소장(고발장, 진정서, 탄원서).doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (46,71,'고소장(고발장, 진정서, 탄원서)_20200818164223513.hwp',24069,'고소장(고발장, 진정서, 탄원서).hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (28,36,'1.사직서엑셀_20200818103959200.xls',16896,'1.사직서엑셀.xls',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (5,17,'4_20200730185910185.jpg',17884,'4.jpg',0,to_date('20/07/30','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (44,70,'고발장_20200818164139994.hwp',23702,'고발장.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (27,36,'1.사직서양식_20200818103959197.hwp',11264,'1.사직서양식.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (29,36,'1.사직서워드_20200818104015478.doc',20480,'1.사직서워드.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (30,37,'휴학원_20200818104245522.hwp',26112,'휴학원.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (31,38,'jdk-8u241-windows-x64_20200818104648850.exe',221163040,'jdk-8u241-windows-x64.exe',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (32,39,'OracleXE112_Win64_20200818104825863.zip',331972833,'OracleXE112_Win64.zip',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (33,40,'sqldeveloper-19.2.1.247.2212-no-jre_20200818104933583.zip',429678243,'sqldeveloper-19.2.1.247.2212-no-jre.zip',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (34,41,'java1강_변수_자료형_형변환_20200818105030982.pdf',1503872,'java1강_변수_자료형_형변환.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (35,42,'java2강_연산자_제어문_20200818105047363.pdf',1793855,'java2강_연산자_제어문.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (36,43,'java3강_메서드_20200818105102805.pdf',1152726,'java3강_메서드.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (37,44,'java4강_배열_20200818105119639.pdf',1103934,'java4강_배열.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (38,45,'java5강_클래스_20200818105140399.pdf',1417178,'java5강_클래스.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (40,47,'java7강_오버라이딩_20200818105216463.pdf',989698,'java7강_오버라이딩.pdf',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (43,70,'고발장_20200818164139991.doc',21504,'고발장.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (47,72,'공증위임장_20200818164347528.doc',24576,'공증위임장.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (48,72,'공증위임장_20200818164347531.hwp',23460,'공증위임장.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (49,75,'교통사고 목격 진술서_20200818164905107.doc',21504,'교통사고 목격 진술서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (50,75,'교통사고 목격 진술서_20200818164905111.hwp',23486,'교통사고 목격 진술서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (56,81,'행사계획서_20200818183904085.doc',33792,'행사계획서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (57,81,'행사계획서_20200818183904095.hwp',24356,'행사계획서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (58,81,'행사계획서_20200818183904103.xls',21504,'행사계획서.xls',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (59,82,'팩스민원신청서_20200818184004434.doc',31744,'팩스민원신청서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (60,82,'팩스민원신청서_20200818184004436.hwp',23689,'팩스민원신청서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (61,83,'탄원서_20200818184102987.doc',29184,'탄원서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (62,83,'탄원서_20200818184102996.hwp',28201,'탄원서.hwp',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (63,84,'자녀양육비청구서_20200818184238035.doc',32768,'자녀양육비청구서.doc',0,to_date('20/08/18','RR/MM/DD'));
Insert into FILES (NO,POST_NO,FILE_NAME,FILE_SIZE,ORIGINAL_FILE_NAME,DOWN_COUNT,UPFILE_DATE) values (64,84,'자녀양육비청구서_20200818184238047.hwp',29041,'자녀양육비청구서.hwp',0,to_date('20/08/18','RR/MM/DD'));
REM INSERTING into FOOTER
SET DEFINE OFF;
Insert into FOOTER (COMPANY_NAME,TEL,ZIPCODE,ADDRESS1,ADDRESS2,START_YEAR) values ('척척학사','02-172-00000','07541','서울시 강남구','테헤란로 222','2020');
REM INSERTING into INBOX
SET DEFINE OFF;
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (38,32,'202010040001',to_date('20/08/17','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (39,32,'202021690001',to_date('20/08/18','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (40,32,'202031111116',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (41,32,'202031111117',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (43,34,'202010040001',to_date('20/08/17','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (45,36,'202020570002',to_date('20/08/18','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (46,36,'202020010001',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (47,36,'202010050005',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (48,36,'202031111119',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (59,45,'202030860003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (60,46,'202030860003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (61,47,'202030860003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (1,2,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (2,3,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (3,4,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (4,4,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (5,5,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (6,5,'202030010001',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (7,6,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (8,6,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (9,7,'202010010001',to_date('20/08/11','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (10,7,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (11,8,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (12,8,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (13,9,'202010010001',to_date('20/08/12','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (14,9,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (15,10,'202010010001',to_date('20/08/11','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (16,10,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (17,11,'202020010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (18,12,'202020010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (19,13,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (20,14,'202030010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (21,15,'202020010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (22,16,'202030010001',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (23,17,'202020010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (24,18,'202020010001',to_date('20/08/10','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (29,23,'202020010001',to_date('20/08/11','RR/MM/DD'),'Y');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (30,24,'202020010001',to_date('20/08/11','RR/MM/DD'),'Y');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (32,26,'202020010001',to_date('20/08/13','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (33,27,'202010040001',to_date('20/08/14','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (34,28,'202010040001',to_date('20/08/14','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (35,29,'202030860003',to_date('20/08/14','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (36,30,'202010040001',to_date('20/08/14','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (37,31,'202021111111',to_date('20/08/18','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (42,33,'202021111111',to_date('20/08/18','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (44,35,'202010040001',to_date('20/08/17','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (49,37,'202020010005',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (50,38,'202010030003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (51,39,'202010030003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (52,40,'202010030003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (53,41,'202030860003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (55,43,'202010040001',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (25,19,'202020010001',to_date('20/08/11','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (26,20,'202030010001',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (27,21,'202020010001',to_date('20/08/13','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (28,22,'202020010001',to_date('20/08/11','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (54,42,'202010030003',to_date('20/08/19','RR/MM/DD'),'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (56,44,'202020010005',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (57,44,'202021150007',null,'N');
Insert into INBOX (NO,MSG_NO,OFFICIAL_NO,READ_DATE,KEEP_FLAG) values (58,44,'202021330004',null,'N');
REM INSERTING into OFFICIAL_INFO
SET DEFINE OFF;
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111115','010','3822','5882',null,null,null,null,null,'820725-1000000','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021111111','010','3822','5882','fe5882','gmail.com',null,null,null,'820725-1000000','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111113','010','1112','2122',null,null,null,null,null,'010302-3000022','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111114','010','1113','2123',null,null,null,null,null,'010303-3000001','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111116','010','1115','2125',null,null,null,null,null,'010305-3000003','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111117','010','1116','2126',null,null,null,null,null,'010306-3000004','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111118','010','1117','2127',null,null,null,null,null,'010307-3000005','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111119','010','1118','2128',null,null,null,null,null,'010308-3000006','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111120','010','3822','5882',null,null,null,null,null,'010309-3000007','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111121','010','1120','2130',null,null,null,null,null,'010310-3000008','M',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111122','010','1121','2131',null,null,null,null,null,'010311-4000009','F',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111123','010','1122','2132',null,null,null,null,null,'010312-4000010','F',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111124','010','1123','2133',null,null,null,null,null,'010313-4000011','F',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111125','010','1124','2134',null,null,null,null,null,'010314-4000012','F',null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202033340004','010','9609','6147','paulkim6147','naver.com',null,null,null,'9403031122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202032900005','010','3822','5882','fe5882','gmail.com',null,null,null,'1111111111111',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031150006','010','6314','7773','shn6314','naver.com',null,null,null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020570002','010','6314','7773','shn6314','naver.com',null,null,null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010050005','010','5091','3797','wogus0501','gmail.com',null,null,null,'9205011212121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010010001','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010001','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010003','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010004','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010005','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010006','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010002','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020010001','010','9609','6147',null,null,null,null,null,'940303-1122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202032250002','010','9609','6147','paulkim6147','naver.com',null,null,null,'9504062112312',null,null,'download_20200818141751169.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010040001','010','9609','6147','paulkim6147','naver.com',null,null,null,'9403031194312',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030860003','010','9609','6147','paulkim6147','naver.com',null,null,null,'9403031112221',null,null,'KakaoTalk_20200806_114107120_20200814104730870.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010050002','010','3822','5882','fe5882','gmail.com',null,null,null,'8207251111111',null,null,'박철_20200819113548748.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030010008','010','8767','1839','fe5882','gmail.com',null,null,null,'9999991111111',null,null,'kakaotalk_20200819_112621351_20200819113316811.png');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021380031','010','1049','1049','HaksaProf049','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021690001','010','9609','6147','paulkim6147','naver.com',null,null,null,'9403031122333',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031111112',null,null,null,null,null,null,null,null,'940303',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021320003','010','1001','1001','HaksaProf001','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021330004','010','1002','1002','HaksaProf002','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020010005','010','1021','1021','HaksaProf021','naver.com',null,null,null,'5903281234567',null,null,'김민아_20200819152448291.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021140006','010','1035','1035','HaksaProf035','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021150007','010','1036','1036','HaksaProf036','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202023260008','010','1039','1039','HaksaProf039','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202023270009','010','1061','1061','HaksaProf061','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202023280010','010','1062','1062','HaksaProf062','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202023290011','010','1063','1063','HaksaProf063','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020050012','010','1106','1106','HaksaProf106','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020060013','010','1105','1105','HaksaProf105','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020070014','010','1104','1104','HaksaProf104','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020020015','010','1103','1103','HaksaProf103','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020040016','010','1102','1102','HaksaProf102','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020040017','010','1101','1101','HaksaProf101','gmail.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020840018','010','1100','1100','HaksaProf100','daum.net',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021340019','010','1099','1099','HaksaProf099','gmail.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021350020','010','1098','1098','HaksaProf098','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020120021','010','1097','1097','HaksaProf097','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020160022','010','1096','1096','HaksaProf096','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020180023','010','1095','1095','HaksaProf095','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020680024','010','1094','1094','HaksaProf094','daum.net',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020240025','010','1001','1001','HaksaProf001','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020880028','010','1053','1053','HaksaProf053','gmail.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202021120029','010','1060','1060','HaksaProf060','daum.net',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030100009','010','6314','7773','shn6314','naver.com',null,null,null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020840032','010','6314','7773','shn6314','naver.com',null,null,null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030240011','010','5091','3797','1321','daum.net',null,null,null,'9205011212121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020230033','010','3822','5882','fe5882','naver.com',null,null,null,'1111111111111',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030230012','010','3822','5882','fe5882','naver.com',null,null,null,'1111111111111',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020230034','010','3822','5882','fe5882','naver.com',null,null,null,'1111111111111',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030220014','010','50','50','10','naver.com',null,null,null,'9205011121211',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031650015','010','21','21','21','naver.com',null,null,null,'9205011212121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030210016','010','5051','2121','12','naver.com',null,null,null,'9205011312121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202033360017','010','545','51','51','naver.com',null,null,null,'920501121212',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030890018','010','5151','5115','51','naver.com',null,null,null,'9205011212121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010030003','010','6314','7773','shn6314','naver.com','08757','서울 관악구 양녕로 5',null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202010020004','010','6314','7773','shn6314','naver.com','06267','서울 강남구 남부순환로 2609',null,'9503281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020230026','010','1043','1043','HaksaProf043','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020220027','010','1055','1055','HaksaProf055','naver.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020240030','010','1044','1044','HaksaProf044','gmail.com',null,null,null,'5903281234567',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030840010','010','5091','3797','wogus0501','daum.net',null,null,null,'9205011213121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030230013','010','5091','3797','11','naver.com',null,null,null,'9205011212132',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031380019','010','545','54','12','naver.com',null,null,null,'9205011051554',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202031390020','010','6556','5151','51','naver.com',null,null,null,'9205011212151',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202030920021','010','5151','5151','65165','naver.com',null,null,null,'9205011212121',null,null,'default.jpg');
Insert into OFFICIAL_INFO (OFFICIAL_NO,HP1,HP2,HP3,EMAIL1,EMAIL2,ZIPCODE,ADDRESS,ADDR_DETAIL,SSN,GENDER,CERTI_CODE,IMAGE_URL) values ('202020230035','010','6349','4662','f5882','naver.com',null,null,null,'9999992222222',null,null,'default.jpg');
REM INSERTING into OPEN_SUBJ
SET DEFINE OFF;
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('002-016','MRC-002-016',to_date('20/08/18','RR/MM/DD'),to_date('20/08/19','RR/MM/DD'),'202020020015');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('001-029','MRC-001-029',to_date('19/08/08','RR/MM/DD'),null,'202020010005');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('001-013','MRC-001-013',to_date('20/02/19','RR/MM/DD'),null,'202020010005');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('002-014','MRC-002-014',to_date('20/08/18','RR/MM/DD'),null,'202020020015');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('024-024','MEC-024-024',to_date('20/08/19','RR/MM/DD'),null,'202020240025');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('084-025','BRC-084-025',to_date('20/08/19','RR/MM/DD'),null,'202020840032');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('006-019','MRC-006-019',to_date('20/08/19','RR/MM/DD'),null,'202020060013');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('006-020','MEC-006-020',to_date('20/08/19','RR/MM/DD'),null,'202020060013');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('023-027','MRC-023-027',to_date('20/08/19','RR/MM/DD'),null,'202020230034');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('002-028','MRC-002-028',to_date('20/08/19','RR/MM/DD'),null,'202020020015');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('006-018','GEC-006-018',to_date('20/08/19','RR/MM/DD'),null,'202020060013');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('001-011','MRC-001-011',to_date('18/08/09','RR/MM/DD'),null,'202020010005');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('001-017','BRC-001-017',to_date('19/02/13','RR/MM/DD'),null,'202020010005');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('024-021','MRC-024-021',to_date('20/08/19','RR/MM/DD'),null,'202020240025');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('024-022','MEC-024-022',to_date('20/08/19','RR/MM/DD'),null,'202020240025');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('024-023','MEC-024-023',to_date('20/08/19','RR/MM/DD'),null,'202020240025');
Insert into OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,OPEN_DATE,CLOSE_DATE,PROF_NO) values ('023-030','MRC-023-030',to_date('20/08/19','RR/MM/DD'),null,'202020230035');
REM INSERTING into OUTBOX
SET DEFINE OFF;
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (32,'202021111111',to_date('20/08/17','RR/MM/DD'),'박철','공지 확인 하신다음 답변주세요!','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (34,'202010040001',to_date('20/08/17','RR/MM/DD'),'이의철','안녕하세요 이것은 테스트용으로써 자기 자신에게 보내는 쪽지 입니다.
','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (36,'202030860003',to_date('20/08/18','RR/MM/DD'),'김우석','test','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (45,'202032900005',to_date('20/08/19','RR/MM/DD'),'권용수','옛다 쪽지','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (46,'202032900005',to_date('20/08/19','RR/MM/DD'),'권용수','실시간이랍니다','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (47,'202030860003',to_date('20/08/19','RR/MM/DD'),'김우석','내게쓰기','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (2,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','테스트입니다 제발 되줘라','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (3,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','ㅎㅎㅎㅎ 제발 되거라아','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (4,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','도대체 뭐가 문제니?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (5,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','마지막 테스트이길','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (6,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','하우.. 제바루ㅜㅜㅜ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (7,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','제발 되주면 안되겠지','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (8,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','언제 되어줄거니?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (9,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (10,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','될까요?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (11,'202030010001',to_date('20/08/10','RR/MM/DD'),'수학생','ㅎㅇ요 교수님','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (12,'202030010001',to_date('20/08/10','RR/MM/DD'),'수학생','왜 응답이 없어요?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (13,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','그래 안녕','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (14,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','항ㅁㅎㄷㅎㅁㄷㅎㅁㄷㅎㅁㄷㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (15,'202030010001',to_date('20/08/10','RR/MM/DD'),'수학생','ㅁㅁㄷㅎㅁㄷㅎㅁㄷㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (16,'202030010001',to_date('20/08/10','RR/MM/DD'),'수학생','내게쓴 편지','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (17,'202010010001',to_date('20/08/10','RR/MM/DD'),'테스트','안녕하세요 교수님
수강 확인 해주세요','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (18,'202020010001',to_date('20/08/10','RR/MM/DD'),'김교수','자기한테[','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (23,'202030010001',to_date('20/08/11','RR/MM/DD'),'수학생','ㅎㅁㄷㅎㅁㄷㅎㅁㄷㅎㅁㄷㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (24,'202030010001',to_date('20/08/11','RR/MM/DD'),'수학생','ㅁㅎㄷㅎㅁㅈㄷㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (25,'202030010001',to_date('20/08/11','RR/MM/DD'),'수학생','ㅁㄷㅎㅁㅈㄷㅎㅁㄷㅈㅎㅁㅈㄷㅎㅁㄷㅈㅎㅁㅈㄷㅎㅁㅈㄷㅎ','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (26,'202010010001',to_date('20/08/11','RR/MM/DD'),'테스트','응~ 안돼~','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (27,'202010040001',to_date('20/08/14','RR/MM/DD'),'이의철','내게 쓰기','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (28,'202010040001',to_date('20/08/14','RR/MM/DD'),'이의철','테스트','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (29,'202010040001',to_date('20/08/14','RR/MM/DD'),'이의철','감사합니다','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (30,'202030860003',to_date('20/08/14','RR/MM/DD'),'김우석','안녕하세요','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (31,'202030860003',to_date('20/08/14','RR/MM/DD'),'김우석','받는 사람 직접 입력 불편','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (33,'202010040001',to_date('20/08/17','RR/MM/DD'),'이의철','어떤 공지를 보면 되나요?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (35,'202010040001',to_date('20/08/17','RR/MM/DD'),'이의철','안녕하신가요?','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (37,'202020010005',to_date('20/08/19','RR/MM/DD'),'박기순','테스트1','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (38,'202010030003',to_date('20/08/19','RR/MM/DD'),'유준석','a','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (39,'202010030003',to_date('20/08/19','RR/MM/DD'),'유준석','안녕','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (40,'202010030003',to_date('20/08/19','RR/MM/DD'),'유준석','dlfjssor','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (41,'202030860003',to_date('20/08/19','RR/MM/DD'),'김우석','gadg','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (43,'202010030003',to_date('20/08/19','RR/MM/DD'),'유준석','안녕','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (19,'202030010001',to_date('20/08/11','RR/MM/DD'),'수학생','잘 가지나여?
','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (20,'202020010001',to_date('20/08/11','RR/MM/DD'),'김교수','네 잘 가집니당
','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (21,'202030010001',to_date('20/08/11','RR/MM/DD'),'수학생','ㅎㅇ요 교수님 A주세요','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (22,'202020010001',to_date('20/08/11','RR/MM/DD'),'김교수','fsdafaef','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (42,'202010030003',to_date('20/08/19','RR/MM/DD'),'유준석','안녕
','N');
Insert into OUTBOX (MSG_NO,OFFICIAL_NO,SEND_DATE,OFFICIAL_NAME,CONTENTS,DEL_FLAG) values (44,'202030860003',to_date('20/08/19','RR/MM/DD'),'김우석','안녕하세요','N');
REM INSERTING into POSTS
SET DEFINE OFF;
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (46,'202010050002','JAVA1타강사 양명숙 강사님의 자바 6강',to_date('20/08/18','RR/MM/DD'),0,'N','PG',46,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (51,'202031111115','단국대 치대건물 걸어서 3분거리인 천안 원룸 반년 총액 100만원으로 내놓습니다.',to_date('20/08/18','RR/MM/DD'),1,'N','R',51,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (53,'202033340004','원룸텔 수파크빌 .2020년 방 가격 저렴 . 단기 가능합니다.전화주세요!!',to_date('20/08/18','RR/MM/DD'),1,'N','R',53,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (55,'202032250002','[여성전용]프렌즈셰어하우스(안서동) 1호점(여의주A룸)2자리, 1호점(여의주B룸)1자리, 2호점(어울림A룸)2자리, 5호점(어울림B룸)1자리, 5호점(어울림C룸)1자리',to_date('20/08/18','RR/MM/DD'),1,'N','R',55,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (56,'202030860003','원룸형하숙- 숙식해결 , 학교최단 1분거리',to_date('20/08/18','RR/MM/DD'),1,'N','R',56,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (18,'202030010001','학생관 1층에서 노트 보신분 계신가요?',to_date('20/08/03','RR/MM/DD'),1,'N','SNF',18,0,0,to_date('20/08/03','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (58,'202032250002','멕시코행 비행기표 저렴하게 팝니다.',to_date('20/08/18','RR/MM/DD'),3,'N','M',58,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (31,'202010040001','[교수학습개발센터] 2020-1학기 나만의 온라인 수업 챌린지 스토리 공모전 안내',to_date('20/08/12','RR/MM/DD'),5,'N','P',31,0,0,to_date('20/08/12','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (63,'202032250002','우리카드 주웠습니다',to_date('20/08/18','RR/MM/DD'),0,'N','SNF',63,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (64,'202032250002','박채현(99년생)학생의 신분증을 보관하고 있습니다.',to_date('20/08/18','RR/MM/DD'),0,'N','SNF',64,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (68,'202010020004','[LINC+] 2020학년도 기업 맞춤형 전문 기업지원 서비스를 위한 "마이크로 타겟팅" 지원사업 모집공고',to_date('20/08/18','RR/MM/DD'),5,'N','P',68,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (48,'202010050002','8강부터는 유료화로 전환됩니다.',to_date('20/08/18','RR/MM/DD'),0,'N','PG',48,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (57,'202030860003','자전거 티티카카 심플러스 팝니다.',to_date('20/08/18','RR/MM/DD'),1,'N','M',57,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (60,'202032900005','대학원동 혜당관 사이에서 에어팟 잃어버렸는데',to_date('20/08/18','RR/MM/DD'),0,'N','SNF',60,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (61,'202031111115','프린터토너 보신 분 연락주세요(공학관)',to_date('20/08/18','RR/MM/DD'),0,'N','SNF',61,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (59,'202032900005','[삽니다] Principles of Information Security, 5th Edition',to_date('20/08/18','RR/MM/DD'),6,'N','M',59,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (62,'202031111112','캘빈클레인 갈색지갑을 잃어버렸습니다.',to_date('20/08/18','RR/MM/DD'),0,'N','SNF',62,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (65,'202030860003','죽전도서관에서 코치 카드지갑을 분실했습니다',to_date('20/08/18','RR/MM/DD'),1,'N','SNF',65,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (66,'202010030003','[취업]2020하계(온라인)이공계 산업별 취업준비 전략',to_date('20/08/18','RR/MM/DD'),0,'N','P',66,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (67,'202010030003','[취업]2020하계(온라인)공기업 필기시험 대비 영역별 특강',to_date('20/08/18','RR/MM/DD'),0,'N','P',67,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (17,'202020010001','무더운 더운날',to_date('20/07/30','RR/MM/DD'),23,'N','F',17,0,0,to_date('20/08/02','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (36,'202010050002','사직서 양식입니다.',to_date('20/08/18','RR/MM/DD'),2,'N','W',36,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (37,'202010050002','휴학원 양식.',to_date('20/08/18','RR/MM/DD'),1,'N','W',37,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (38,'202010050002','JDK1.8.0_241',to_date('20/08/18','RR/MM/DD'),0,'N','PG',38,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (39,'202010050002','OracleXE112_Win64',to_date('20/08/18','RR/MM/DD'),0,'N','PG',39,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (40,'202010050002','SQLdeveloper',to_date('20/08/18','RR/MM/DD'),0,'N','PG',40,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (41,'202010050002','JAVA1타강사 양명숙 강사님의 자바 1강',to_date('20/08/18','RR/MM/DD'),1,'N','PG',41,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (42,'202010050002','JAVA1타강사 양명숙 강사님의 자바 2강',to_date('20/08/18','RR/MM/DD'),0,'N','PG',42,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (43,'202010050002','JAVA1타강사 양명숙 강사님의 자바 3강',to_date('20/08/18','RR/MM/DD'),1,'N','PG',43,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (44,'202010050002','JAVA1타강사 양명숙 강사님의 자바 4강',to_date('20/08/18','RR/MM/DD'),0,'N','PG',44,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (45,'202010050002','JAVA1타강사 양명숙 강사님의 자바 5강',to_date('20/08/18','RR/MM/DD'),0,'N','PG',45,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (47,'202010050002','JAVA1타강사 양명숙 강사님의 자바 7강',to_date('20/08/18','RR/MM/DD'),1,'N','PG',47,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (49,'202010050002','베스트 강의 박철의 살인교실 들을만 한가요?',to_date('20/08/18','RR/MM/DD'),3,'N','F',49,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (50,'202031111112','단국대 5분거리 저렴하고 쾌적한 풀옵션원룸',to_date('20/08/18','RR/MM/DD'),0,'N','R',50,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (52,'202031111115','5분 거리 단국대 삼거리 이룸하우스 3층 원룸 승계합니다. (반년)',to_date('20/08/18','RR/MM/DD'),0,'N','R',52,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (69,'202010020004','[취업]2020하계[온라인]자소서 트랙Ⅱ_자기소개서 작성 실전반(국민건강보험공단)',to_date('20/08/18','RR/MM/DD'),2,'N','P',69,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (86,'202032900005','일명 [연예인 마스크]가 숨쉬긴 편합니다.',to_date('20/08/19','RR/MM/DD'),5,'N','F',86,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (91,'202030010008','새마을 유튜브 영상 콘테스트 안내',to_date('20/08/19','RR/MM/DD'),1,'N','F',91,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (70,'202010050002','고발장 양식입니다.',to_date('20/08/18','RR/MM/DD'),1,'N','W',70,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (72,'202010050002','공증위임장 서식',to_date('20/08/18','RR/MM/DD'),1,'N','W',72,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (74,'202010020004','2020학년도 2학기 재학생 등록 안내',to_date('20/08/18','RR/MM/DD'),0,'N','H',74,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (75,'202010050002','교통사고 목격 진술서',to_date('20/08/18','RR/MM/DD'),1,'N','W',75,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (79,'202010020004','[교수학습개발센터] 총장님 축사 영상 포함 2020-1 단러닝클럽 Best Practice 공모전 온라인 발표회',to_date('20/08/18','RR/MM/DD'),5,'N','H',79,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (81,'202010050002','행사계획서 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',81,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (82,'202010050002','팩스민원신청서 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',82,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (83,'202010050002','탄원서 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',83,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (84,'202010050002','자녀양육비청구서 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',84,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (87,'202032900005','이시국 영국 콘서트 근황.jpg',to_date('20/08/19','RR/MM/DD'),0,'N','F',87,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (88,'202032250002','밀접 접촉자들 검사 거부.jpg ',to_date('20/08/19','RR/MM/DD'),0,'N','F',88,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (89,'202030860003','영어역시 개념원리로 단순화시키는 수업과외들어보세요',to_date('20/08/19','RR/MM/DD'),0,'N','F',89,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (94,'202030860003','Re: 색깔이 칙칙해여',to_date('20/08/19','RR/MM/DD'),2,'N','QNA',93,1,1,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (95,'202010030003','Re: 색깔이 칙칙해여',to_date('20/08/19','RR/MM/DD'),1,'N','QNA',93,1,1,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (76,'202010030003','[긴급]2020학년도 대학교 교직원 단체상해보험 가입업체 선정',to_date('20/08/18','RR/MM/DD'),0,'N','H',76,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (78,'202010030003','[EduAI센터] 열(熱)혈 Mate를 뽑아라! 이벤트(8.10~23) ',to_date('20/08/18','RR/MM/DD'),1,'N','H',78,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (93,'202030860003','색깔이 칙칙해여',to_date('20/08/19','RR/MM/DD'),3,'N','QNA',93,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (92,'202030860003','막날입니다.',to_date('20/08/19','RR/MM/DD'),1,'N','F',92,0,0,to_date('20/08/19','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (77,'202010030003','[LINC+] 2020학년도 기업 맞춤형 전문 기업지원 서비스를 위한 "마이크로 타겟팅" 지원사업 모집공고',to_date('20/08/18','RR/MM/DD'),0,'N','H',77,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (80,'202010050002','출생신고서 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',80,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (71,'202010050002','고소장 양식',to_date('20/08/18','RR/MM/DD'),1,'N','W',71,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (73,'202010050002','[필독] 포탈 서비스 이용 중 버그 발생시 대처요령',to_date('20/08/18','RR/MM/DD'),1,'N','H',73,0,0,to_date('20/08/18','RR/MM/DD'),'N');
Insert into POSTS (POST_NO,OFFICIAL_NO,TITLE,REG_DATE,READ_COUNT,DEL_FLAG,BD_CODE,GROUP_NO,SORT_NO,STEP,EDIT_DATE,IS_PRIVATE) values (90,'202030840010','[공모전] 2020 서울청년 평화경제 오픈랩 프로젝트',to_date('20/08/19','RR/MM/DD'),0,'N','F',90,0,0,to_date('20/08/19','RR/MM/DD'),'N');
REM INSERTING into PROFESSOR
SET DEFINE OFF;
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021111111','$2a$10$TflX2HIjrGJ3/hhhZKPireC5o5c3E6v5TfsLMp7nGzUYn55j/Hkgm','박철',111,1,to_date('20/08/03','RR/MM/DD'),null,'Y','939693',to_date('20/08/03','RR/MM/DD'));
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020570002','950328','유교수',57,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020010001','940303','김교수',111,1,to_date('20/07/30','RR/MM/DD'),null,'Y','352392',null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021380031','590328','최복자',138,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021690001','940303','박철',169,4,to_date('20/08/14','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021320003','590328','강기순',132,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021330004','590328','김성숙',132,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020010005','590328','박기순',1,4,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021140006','590328','박경희',114,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021150007','590328','박영미',115,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202023260008','590328','박순단',326,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202023270009','590328','금성숙',327,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202023280010','590328','금경이',328,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202023290011','590328','금대자',329,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020050012','590328','이봉원',5,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020060013','590328','이미정',6,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020070014','590328','윤미정',7,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020020015','590328','원정복',2,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020040016','590328','양점순',4,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020040017','590328','송심옥',4,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020840018','590328','인순이',84,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021340019','590328','전태순',134,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021350020','590328','유금자',135,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020120021','590328','유순단',12,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020160022','590328','유태자',16,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020180023','590328','유성희',18,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020680024','590328','유영미',68,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020240025','590328','강기순',24,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020880028','590328','최계옥',97,3,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202021120029','590328','최금자',112,4,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020840032','950328','김승현',84,1,to_date('20/08/19','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020230033','111111','김김김',23,1,to_date('20/08/19','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020230034','111111','김계산',23,1,to_date('20/08/19','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020230026','590328','최경이',82,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020220027','590328','최경희',99,1,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020240030','590328','최대자',24,2,to_date('20/08/18','RR/MM/DD'),null,'N',null,null);
Insert into PROFESSOR (PROF_NO,PWD,PROF_NAME,DEP_NO,POSITION_NO,START_DATE,RESIGNATION_DATE,IDENTITY_STATE,IDENTIFY_CODE,CHANGE_DATE) values ('202020230035','$2a$10$7paRSNm81XnLxxrCILc1BOxMcsr1QrsUVyjZZAsTAsiU/8vtplMRW','양명숙',23,1,to_date('20/08/19','RR/MM/DD'),null,'Y','050332',to_date('20/08/19','RR/MM/DD'));
REM INSERTING into PROF_POSITION
SET DEFINE OFF;
Insert into PROF_POSITION (POSITION_NO,POSITION_NAME) values (5,'퇴임');
Insert into PROF_POSITION (POSITION_NO,POSITION_NAME) values (1,'정교수');
Insert into PROF_POSITION (POSITION_NO,POSITION_NAME) values (2,'부교수');
Insert into PROF_POSITION (POSITION_NO,POSITION_NAME) values (3,'조교수');
Insert into PROF_POSITION (POSITION_NO,POSITION_NAME) values (4,'전임강사');
REM INSERTING into REGISTRATION
SET DEFINE OFF;
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030860003','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030100009','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-022','202030100009','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202032250002','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-022','202032250002','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202032250002','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202033340004','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-022','202033340004','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202033340004','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202033360017','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202033360017','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202033360017','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030100009','MRC',to_date('20/08/19','RR/MM/DD'),null,'Y');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('006-018','202030860003','GEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030840010','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030240011','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030240011','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030210016','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202031650015','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202031650015','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030210016','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202033360017','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202031650015','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202031650015','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202030210016','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202030210016','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202032900005','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('002-016','202032900005','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030010008','MRC',to_date('20/08/19','RR/MM/DD'),null,'Y');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-022','202030010008','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030010008','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-021','202030840010','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-024','202030840010','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-022','202030860003','MEC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030860003','MRC',to_date('20/08/19','RR/MM/DD'),null,'Y');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202031150006','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202031150006','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('024-021','202031150006','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030220014','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030220014','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030890018','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030890018','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202030220014','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202030220014','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202030890018','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202030890018','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202031380019','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202031380019','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202031380019','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202031380019','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202031390020','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202031390020','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202031390020','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202031390020','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-013','202030920021','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202030920021','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-011','202030920021','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-029','202030920021','MRC',to_date('20/08/19','RR/MM/DD'),null,'N');
Insert into REGISTRATION (SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('001-017','202030860003','BRC',to_date('20/08/19','RR/MM/DD'),null,'N');
REM INSERTING into REGI_TIMETABLE
SET DEFINE OFF;
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('001-013','수1,수2,목2');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('002-016','금1,금2,금3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('001-017','목6,목7,목8');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('001-029','금1,금2,금3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('002-014','월1,월5,수3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('006-020','월6,월7,월8');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('006-019','목1,목2,목3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('024-021','금7,금6,목6');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('024-022','금1,금2');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('023-027','화1,화2');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('002-028','화1,화2,화3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('024-024','월1,화2,화3');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('001-011','월1,월2,금8');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('006-018','수3,수4');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('024-023','화2,수4,수5,목2');
Insert into REGI_TIMETABLE (OPEN_SUB_CODE,SHORT_NAMES) values ('023-030','수1,수2,금3');
REM INSERTING into REPLY
SET DEFINE OFF;
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (15,'202010030003',to_date('20/08/19','RR/MM/DD'),'N',58,'유준석');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (6,'202032250002',to_date('20/08/14','RR/MM/DD'),'N',17,'신희나');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (9,'202030860003',to_date('20/08/18','RR/MM/DD'),'N',51,'김우석');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (13,'202010030003',to_date('20/08/19','RR/MM/DD'),'N',58,'유준석');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (16,'202030860003',to_date('20/08/19','RR/MM/DD'),'N',92,'김우석');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (17,'202030860003',to_date('20/08/19','RR/MM/DD'),'N',92,'김우석');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (8,'202010040001',to_date('20/08/14','RR/MM/DD'),'N',17,'이의철');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (12,'202020010005',to_date('20/08/19','RR/MM/DD'),'N',86,'박기순');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (10,'202030100009',to_date('20/08/19','RR/MM/DD'),'N',49,'김일이');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (11,'202030100009',to_date('20/08/19','RR/MM/DD'),'N',59,'김일이');
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO,OFFICIAL_NAME) values (14,'202010030003',to_date('20/08/19','RR/MM/DD'),'N',86,'유준석');
REM INSERTING into REREPLY
SET DEFINE OFF;
Insert into REREPLY (REREPLY_NO,REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,OFFICIAL_NAME) values (6,16,'202030860003',to_date('20/08/19','RR/MM/DD'),'N','김우석');
Insert into REREPLY (REREPLY_NO,REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,OFFICIAL_NAME) values (5,12,'202010050002',to_date('20/08/19','RR/MM/DD'),'N','박철');
REM INSERTING into SCHOLARSHIP
SET DEFINE OFF;
REM INSERTING into STUDENT
SET DEFINE OFF;
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111115','$2a$10$ffKsFaZYR/2//5itC7JCm.Vwo0p/t0scfIjesmJn/9VkY2YWxxqjm','박철',111,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,'168260',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111112','940303','이의철',111,1,0,'1',to_date('20/07/29','RR/MM/DD'),null,'Y',null,'647331',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111113','010302','이학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111114','010303','박학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111116','010305','정학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111117','010306','강학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111118','010307','조학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111119','010308','윤학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111120','010309','장학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,'624769',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111121','010310','임학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111122','010311','한학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111123','010312','오학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111124','010313','서학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031111125','010314','신학생',111,1,0,'1',to_date('20/08/04','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202033340004','940303','권용민',334,1,0,'1',to_date('20/08/14','RR/MM/DD'),null,'N',327,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202032900005','$2a$10$V8cJqS9b72an0O8oXnvA9.TjCGFYhhH0BSNs7.dUn1iF69UViTtJq','권용수',290,1,0,'5',to_date('20/08/18','RR/MM/DD'),null,'Y',null,'360735',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031150006','950328','유학생',115,1,0,'1',to_date('20/08/18','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010002','940303','김학색',334,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010003','940303','이학생',334,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010004','940303','박학생',334,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010005','940303','최학생',334,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010006','940303','전학생',334,1,0,'1',to_date('20/07/30','RR/MM/DD'),null,'Y',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202032250002','950406','신희나',225,1,0,'1',to_date('20/08/07','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010001','$2a$10$rRwSAwqqENBZYaZ94sngTexkKJblfoiAr6iL537TkrTJCl69/H2Y6','수학생',334,1,0,'1',to_date('20/07/20','RR/MM/DD'),null,'Y',null,'091493',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030860003','$2a$10$wvu5amGR6zubATrysR/04ueUorIPjlln2Qpi/4s6PGui20f98K0bu','김우석',86,3,0,'2',to_date('20/08/11','RR/MM/DD'),null,'Y',null,'935471',null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030010008','999999','이재민',1,1,0,'1',to_date('20/08/18','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030100009','950328','김일이',10,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030240011','920501','김세현',24,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030230012','111111','김컴공',23,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030220014','920501','황환경',22,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031650015','920501','황종가',165,1,0,'5',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030210016','920501','황조한',21,1,0,'5',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202033360017','920501','황원진',336,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030890018','920501','황정원',89,1,0,'3',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030840010','920501','황재현',84,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030230013','920501','김전산',23,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031380019','920501','김상국',138,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202031390020','920501','박노아',139,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
Insert into STUDENT (STU_NO,PWD,NAME,MAJOR,SEMESTER,CREDITS,STATE,ADMISSION_DATE,GRADUATION_DATE,IDENTITY_STATE,MINOR,IDENTIFY_CODE,CHANGE_DATE) values ('202030920021','920501','김국진',92,1,0,'1',to_date('20/08/19','RR/MM/DD'),null,'N',null,null,null);
REM INSERTING into STUDENT_STATE
SET DEFINE OFF;
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('6','제적생');
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('1','신입생');
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('2','재학생');
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('3','휴학생');
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('4','졸업가능');
Insert into STUDENT_STATE (STATE,STATE_NAME) values ('5','졸업생');
REM INSERTING into SUBJECT
SET DEFINE OFF;
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-002-016','회계원리','MRC',3,'202020020015',150);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('BRC-084-026','경제학이론','BRC',3,'202020840032',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-001-029','생리학','MRC',3,'202020010005',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-001-013','의학용어','MRC',3,'202020010005',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('NEC-057-015','통계자료 분석(SPSS)','NEC',3,'202020570002',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('GEC-057-012','수학과 통계','GEC',3,'202020570002',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-002-014','경영학원론','MRC',3,'202020020015',150);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MEC-024-024','유기화학Ⅱ','MEC',3,'202020240025',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('BRC-084-025','경제학이론','BRC',3,'202020840032',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-006-019','건축학개론','MRC',3,'202020060013',100);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MEC-006-020','건축설계(1)','MEC',3,'202020060013',100);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-023-027','컴퓨터의 역사','MRC',2,'202020230034',150);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-002-028','인적자원개발론','MRC',3,'202020020015',150);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('GEC-006-018','공업수학','GEC',2,'202020060013',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-001-011','해부학및 실습','MRC',3,'202020010005',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('BRC-001-017','간호의 이해','BRC',3,'202020010005',20);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-024-021','생명공학입문','MRC',3,'202020240025',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MEC-024-022','생물통계학','MEC',2,'202020240025',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MEC-024-023','유기화학Ⅰ ','MEC',3,'202020240025',50);
Insert into SUBJECT (SUBJ_CODE,SUBJ_NAME,TYPE_CODE,CREDIT,PROF_NO,PERSONNEL) values ('MRC-023-030','자바','MRC',3,'202020230035',150);
REM INSERTING into SUBJ_EVAL
SET DEFINE OFF;
Insert into SUBJ_EVAL (SUB_CODE,STU_NO,CLASSIFICATION,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8) values ('001-011','202030100009','MRC',7,5,5,7,6,6,2,6);
Insert into SUBJ_EVAL (SUB_CODE,STU_NO,CLASSIFICATION,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8) values ('001-011','202030010008','MRC',10,5,5,5,5,5,5,5);
Insert into SUBJ_EVAL (SUB_CODE,STU_NO,CLASSIFICATION,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8) values ('001-011','202030860003','MRC',2,2,6,5,5,5,5,5);
REM INSERTING into SUBJ_TIME
SET DEFINE OFF;
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (78,'001-029','FR2','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (79,'001-029','FR3','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (26,'001-013','WE1','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (27,'001-013','WE2','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (33,'002-016','FR1','B003-002-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (34,'002-016','FR2','B003-002-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (35,'002-016','FR3','B003-002-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (80,'001-017','TH6','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (81,'001-017','TH7','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (84,'023-030','WE2','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (77,'001-029','FR1','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (85,'023-030','FR3','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (22,'001-011','MO2','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (23,'001-011','FR8','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (28,'001-013','TH2','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (29,'002-014','MO1','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (43,'006-020','MO8','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (44,'024-021','FR7','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (45,'024-021','FR6','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (38,'006-019','TH1','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (41,'006-020','MO6','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (47,'024-022','FR1','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (48,'024-022','FR2','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (74,'002-028','TU1','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (75,'002-028','TU2','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (67,'024-024','MO1','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (68,'024-024','TU2','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (72,'023-027','TU1','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (73,'023-027','TU2','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (76,'002-028','TU3','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (31,'002-014','WE3','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (83,'023-030','WE1','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (21,'001-011','MO1','A002-001-22');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (30,'002-014','MO5','B003-002-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (36,'006-018','WE3','B001-007-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (37,'006-018','WE4','B001-007-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (39,'006-019','TH2','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (40,'006-019','TH3','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (42,'006-020','MO7','B001-006-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (46,'024-021','TH6','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (50,'024-023','WE4','B005-024-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (51,'024-023','WE5','B005-024-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (52,'024-023','TH2','B005-024-02');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (69,'024-024','TU3','B005-024-01');
Insert into SUBJ_TIME (LECTURE_TIME_NO,OPEN_SUB_CODE,TIMETABLE_CODE,CLASSROOM_CODE) values (82,'001-017','TH8','A002-001-22');
REM INSERTING into SUBJ_TYPE
SET DEFINE OFF;
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('GEC','교양선택');
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('MEC','전공선택');
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('NEC','일반선택');
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('MRC','전공필수');
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('GRC','교양필수');
Insert into SUBJ_TYPE (TYPE_CODE,TYPE) values ('BRC','기초필수');
REM INSERTING into SYLLABUS
SET DEFINE OFF;
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('006-018','공업수학_20200819112728600.pdf',50,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('023-030','자바_20200819160337167.pdf',500,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('001-029','생리학_20200819150509663.pdf',4,2);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('002-016','회계원리_20200818184902183.pdf',40,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('001-013','의학용어_20200818182441910.pdf',20,20);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('002-014','경영학원론_20200818182838352.pdf',30,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('024-021','생명공학입문_20200819114015592.pdf',50,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('006-019','건축학개론_20200819113155502.pdf',50,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('006-020','건축설계_20200819113504243.pdf',30,20);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('023-027','컴퓨터의역사_20200819142234447.pdf',50,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('002-028','인적자원개발론_20200819142540969.pdf',100,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('001-011','해부학 및 실습_20200818181732298.pdf',20,20);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('024-024','유기화학2_20200819121328527.pdf',50,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('024-022','생물통계학_20200819121357634.pdf',30,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('024-023','유기화학i_20200819121407050.pdf',40,0);
Insert into SYLLABUS (OPEN_SUB_CODE,SYLLABUS,THEORY_TIME,TRAINING_TIME) values ('001-017','간호의이해_20200819150615824.pdf',50,0);
REM INSERTING into TIMETABLE
SET DEFINE OFF;
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO1','월요일 1교시','월요일',1,'월1');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO2','월요일 2교시','월요일',2,'월2');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO3','월요일 3교시','월요일',3,'월3');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO4','월요일 4교시','월요일',4,'월4');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO5','월요일 5교시','월요일',5,'월5');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO6','월요일 6교시','월요일',6,'월6');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO7','월요일 7교시','월요일',7,'월7');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('MO8','월요일 8교시','월요일',8,'월8');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU1','화요일 1교시','화요일',1,'화1');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU2','화요일 2교시','화요일',2,'화2');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU3','화요일 3교시','화요일',3,'화3');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU4','화요일 4교시','화요일',4,'화4');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU5','화요일 5교시','화요일',5,'화5');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU6','화요일 6교시','화요일',6,'화6');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU7','화요일 7교시','화요일',7,'화7');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TU8','화요일 8교시','화요일',8,'화8');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE1','수요일 1교시','수요일',1,'수1');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE2','수요일 2교시','수요일',2,'수2');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE3','수요일 3교시','수요일',3,'수3');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE4','수요일 4교시','수요일',4,'수4');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE5','수요일 5교시','수요일',5,'수5');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE6','수요일 6교시','수요일',6,'수6');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE7','수요일 7교시','수요일',7,'수7');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('WE8','수요일 8교시','수요일',8,'수8');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH1','목요일 1교시','목요일',1,'목1');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH2','목요일 2교시','목요일',2,'목2');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH3','목요일 3교시','목요일',3,'목3');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH4','목요일 4교시','목요일',4,'목4');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH5','목요일 5교시','목요일',5,'목5');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH6','목요일 6교시','목요일',6,'목6');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH7','목요일 7교시','목요일',7,'목7');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('TH8','목요일 8교시','목요일',8,'목8');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR1','금요일 1교시','금요일',1,'금1');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR2','금요일 2교시','금요일',2,'금2');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR3','금요일 3교시','금요일',3,'금3');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR4','금요일 4교시','금요일',4,'금4');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR5','금요일 5교시','금요일',5,'금5');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR6','금요일 6교시','금요일',6,'금6');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR7','금요일 7교시','금요일',7,'금7');
Insert into TIMETABLE (TIMETABLE_CODE,TIMETABLE_NAME,DAY,PERIOD,SHORT_NAME) values ('FR8','금요일 8교시','금요일',8,'금8');
REM INSERTING into TUITION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_AWARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AWARD" ON "AWARD" ("NO");
--------------------------------------------------------
--  DDL for Index PK_CLASSROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CLASSROOM" ON "CLASSROOM" ("CLASSROOM_CODE");
--------------------------------------------------------
--  DDL for Index PK_OUTBOX
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OUTBOX" ON "OUTBOX" ("MSG_NO");
--------------------------------------------------------
--  DDL for Index BOOKMARK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOKMARK_PK" ON "BOOKMARK" ("NO");
--------------------------------------------------------
--  DDL for Index CHATMESSAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHATMESSAGE_PK" ON "CHATMESSAGE" ("NO");
--------------------------------------------------------
--  DDL for Index PK_DISTRIBUTE_ASSIGN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DISTRIBUTE_ASSIGN" ON "DISTRIBUTE_ASSIGN" ("ASSIGN_NO");
--------------------------------------------------------
--  DDL for Index PK_PROF_POSITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PROF_POSITION" ON "PROF_POSITION" ("POSITION_NO");
--------------------------------------------------------
--  DDL for Index PK_BUILDING
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BUILDING" ON "BUILDING" ("BUILDING_CODE");
--------------------------------------------------------
--  DDL for Index CHATROOM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CHATROOM_PK" ON "CHATROOM" ("ROOM_ID");
--------------------------------------------------------
--  DDL for Index PK_AUTHORITY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AUTHORITY" ON "AUTHORITY" ("AUTH_CODE");
--------------------------------------------------------
--  DDL for Index PK_BOARD
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOARD" ON "BOARD" ("BD_CODE");
--------------------------------------------------------
--  DDL for Index PK_CERTIFICATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CERTIFICATION" ON "CERTIFICATION" ("NO");
--------------------------------------------------------
--  DDL for Index PK_EMP_POSITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EMP_POSITION" ON "EMP_POSITION" ("POSITION_CODE");
--------------------------------------------------------
--  DDL for Index PK_EMP_DEPART
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EMP_DEPART" ON "EMP_DEPART" ("DEP_CODE");
--------------------------------------------------------
--  DDL for Index PK_OPEN_SUBJ
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OPEN_SUBJ" ON "OPEN_SUBJ" ("OPEN_SUB_CODE");
--------------------------------------------------------
--  DDL for Index PROFESSOR
--------------------------------------------------------

  CREATE UNIQUE INDEX "PROFESSOR" ON "PROFESSOR" ("PROF_NO");
--------------------------------------------------------
--  DDL for Index PK_SUBJ_TYPE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SUBJ_TYPE" ON "SUBJ_TYPE" ("TYPE_CODE");
--------------------------------------------------------
--  DDL for Index PK_EVALUATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EVALUATION" ON "EVALUATION" ("SUB_CODE", "STU_NO", "CLASSIFICATION");
--------------------------------------------------------
--  DDL for Index PK_STUDENT_STATE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STUDENT_STATE" ON "STUDENT_STATE" ("STATE");
--------------------------------------------------------
--  DDL for Index PK_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REPLY" ON "REPLY" ("REPLY_NO");
--------------------------------------------------------
--  DDL for Index PK_SCHOLARSHIP
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SCHOLARSHIP" ON "SCHOLARSHIP" ("SCHOLARSHIP_NO");
--------------------------------------------------------
--  DDL for Index PK_EMPLOYEE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_EMPLOYEE" ON "EMPLOYEE" ("EMP_NO");
--------------------------------------------------------
--  DDL for Index PK_TUITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TUITION" ON "TUITION" ("NO");
--------------------------------------------------------
--  DDL for Index PK_SUBJECT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SUBJECT" ON "SUBJECT" ("SUBJ_CODE");
--------------------------------------------------------
--  DDL for Index PK_SUBJ_TIME
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SUBJ_TIME" ON "SUBJ_TIME" ("LECTURE_TIME_NO");
--------------------------------------------------------
--  DDL for Index PK_REGISTRATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REGISTRATION" ON "REGISTRATION" ("SUB_CODE", "STU_NO", "CLASSIFICATION");
--------------------------------------------------------
--  DDL for Index PK_BANK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BANK" ON "BANK" ("BANK_CODE");
--------------------------------------------------------
--  DDL for Index PK_FILES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FILES" ON "FILES" ("NO");
--------------------------------------------------------
--  DDL for Index PK_STUDENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_STUDENT" ON "STUDENT" ("STU_NO");
--------------------------------------------------------
--  DDL for Index PK_OFFICIAL_INFO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OFFICIAL_INFO" ON "OFFICIAL_INFO" ("OFFICIAL_NO");
--------------------------------------------------------
--  DDL for Index PK_FACULTY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FACULTY" ON "FACULTY" ("FACULTY_NO");
--------------------------------------------------------
--  DDL for Index REREPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REREPLY_PK" ON "REREPLY" ("REREPLY_NO");
--------------------------------------------------------
--  DDL for Index PK_CATEGORY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CATEGORY" ON "CATEGORY" ("CATEGORY_CODE");
--------------------------------------------------------
--  DDL for Index PK_INBOX
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INBOX" ON "INBOX" ("NO");
--------------------------------------------------------
--  DDL for Index PK_SUBJ_EVAL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SUBJ_EVAL" ON "SUBJ_EVAL" ("SUB_CODE", "STU_NO", "CLASSIFICATION");
--------------------------------------------------------
--  DDL for Index DEPARTMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPARTMENT" ON "DEPARTMENT" ("DEP_NO");
--------------------------------------------------------
--  DDL for Index POSTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "POSTS" ON "POSTS" ("POST_NO");
--------------------------------------------------------
--  DDL for Index PK_TIMETABLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIMETABLE" ON "TIMETABLE" ("TIMETABLE_CODE");
--------------------------------------------------------
--  DDL for Procedure DELETEPOSTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DELETEPOSTS" 
(
  p_POST_NO number 
, p_STEP number 
, p_GROUP_NO number 
) 
iS 
     cnt number;
BEGIN
   if p_step = 0 then
        select count(*) into cnt from posts
        where group_no = p_group_no;
        --답변이 존재하면 update
        if cnt > 1 then
            update posts
            set del_Flag='Y'
            where POST_NO = p_POST_NO;
        else
        --존재하지 않으면 delete
            delete from posts
            where POST_NO = p_POST_NO;
        end if;
    else
    -- 답변인 경우 delete
        delete from posts
        where POST_NO = p_POST_NO;
    end if;
    
    commit;
EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, '글 삭제 실패!');
        ROLLBACK;
END DELETEPOSTS;
--------------------------------------------------------
--  Constraints for Table ASSIGNMENT
--------------------------------------------------------

  ALTER TABLE "ASSIGNMENT" MODIFY ("ASSIGN_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BANK
--------------------------------------------------------

  ALTER TABLE "BANK" ADD CONSTRAINT "PK_BANK" PRIMARY KEY ("BANK_CODE") ENABLE;
  ALTER TABLE "BANK" MODIFY ("BANK_NAME" NOT NULL ENABLE);
  ALTER TABLE "BANK" MODIFY ("BANK_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJ_TYPE
--------------------------------------------------------

  ALTER TABLE "SUBJ_TYPE" ADD CONSTRAINT "PK_SUBJ_TYPE" PRIMARY KEY ("TYPE_CODE") ENABLE;
  ALTER TABLE "SUBJ_TYPE" MODIFY ("TYPE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY ("BD_CODE") ENABLE;
  ALTER TABLE "BOARD" MODIFY ("CATEGORY_CODE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BD_NAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BD_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OFFICIAL_INFO
--------------------------------------------------------

  ALTER TABLE "OFFICIAL_INFO" ADD CONSTRAINT "PK_OFFICIAL_INFO" PRIMARY KEY ("OFFICIAL_NO") ENABLE;
  ALTER TABLE "OFFICIAL_INFO" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NO") ENABLE;
  ALTER TABLE "REPLY" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE);
  ALTER TABLE "REPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CERTIFICATION
--------------------------------------------------------

  ALTER TABLE "CERTIFICATION" ADD CONSTRAINT "PK_CERTIFICATION" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "CERTIFICATION" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENT_STATE
--------------------------------------------------------

  ALTER TABLE "STUDENT_STATE" ADD CONSTRAINT "PK_STUDENT_STATE" PRIMARY KEY ("STATE") ENABLE;
  ALTER TABLE "STUDENT_STATE" MODIFY ("STATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY ("EMP_NO") ENABLE;
  ALTER TABLE "EMPLOYEE" MODIFY ("EMP_NAME" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("PWD" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEE" MODIFY ("EMP_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY ("CATEGORY_CODE") ENABLE;
  ALTER TABLE "CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" MODIFY ("CATEGORY_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLASSROOM
--------------------------------------------------------

  ALTER TABLE "CLASSROOM" ADD CONSTRAINT "PK_CLASSROOM" PRIMARY KEY ("CLASSROOM_CODE") ENABLE;
  ALTER TABLE "CLASSROOM" MODIFY ("BUILDING_CODE" NOT NULL ENABLE);
  ALTER TABLE "CLASSROOM" MODIFY ("CLASSROOM_NAME" NOT NULL ENABLE);
  ALTER TABLE "CLASSROOM" MODIFY ("CLASSROOM_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROF_POSITION
--------------------------------------------------------

  ALTER TABLE "PROF_POSITION" ADD CONSTRAINT "PK_PROF_POSITION" PRIMARY KEY ("POSITION_NO") ENABLE;
  ALTER TABLE "PROF_POSITION" MODIFY ("POSITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROF_POSITION" MODIFY ("POSITION_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AWARD
--------------------------------------------------------

  ALTER TABLE "AWARD" ADD CONSTRAINT "PK_AWARD" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "AWARD" MODIFY ("SCHOLARSHIP_NO" NOT NULL ENABLE);
  ALTER TABLE "AWARD" MODIFY ("STU_NO" NOT NULL ENABLE);
  ALTER TABLE "AWARD" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHATMESSAGE
--------------------------------------------------------

  ALTER TABLE "CHATMESSAGE" ADD CONSTRAINT "CHATMESSAGE_PK" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "CHATMESSAGE" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUILDING
--------------------------------------------------------

  ALTER TABLE "BUILDING" ADD CONSTRAINT "PK_BUILDING" PRIMARY KEY ("BUILDING_CODE") ENABLE;
  ALTER TABLE "BUILDING" MODIFY ("BUILDING_NAME" NOT NULL ENABLE);
  ALTER TABLE "BUILDING" MODIFY ("BUILDING_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILES
--------------------------------------------------------

  ALTER TABLE "FILES" ADD CONSTRAINT "PK_FILES" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "FILES" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FACULTY
--------------------------------------------------------

  ALTER TABLE "FACULTY" ADD CONSTRAINT "PK_FACULTY" PRIMARY KEY ("FACULTY_NO") ENABLE;
  ALTER TABLE "FACULTY" MODIFY ("FACULTY_NAME" NOT NULL ENABLE);
  ALTER TABLE "FACULTY" MODIFY ("FACULTY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROFESSOR
--------------------------------------------------------

  ALTER TABLE "PROFESSOR" ADD CONSTRAINT "PROFESSOR" PRIMARY KEY ("PROF_NO") ENABLE;
  ALTER TABLE "PROFESSOR" MODIFY ("POSITION_NO" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR" MODIFY ("PROF_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR" MODIFY ("PWD" NOT NULL ENABLE);
  ALTER TABLE "PROFESSOR" MODIFY ("PROF_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SYLLABUS
--------------------------------------------------------

  ALTER TABLE "SYLLABUS" MODIFY ("SYLLABUS" NOT NULL ENABLE);
  ALTER TABLE "SYLLABUS" MODIFY ("OPEN_SUB_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OPEN_SUBJ
--------------------------------------------------------

  ALTER TABLE "OPEN_SUBJ" ADD CONSTRAINT "PK_OPEN_SUBJ" PRIMARY KEY ("OPEN_SUB_CODE") ENABLE;
  ALTER TABLE "OPEN_SUBJ" MODIFY ("PROF_NO" NOT NULL ENABLE);
  ALTER TABLE "OPEN_SUBJ" MODIFY ("SUBJ_CODE" NOT NULL ENABLE);
  ALTER TABLE "OPEN_SUBJ" MODIFY ("OPEN_SUB_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGISTRATION
--------------------------------------------------------

  ALTER TABLE "REGISTRATION" ADD CONSTRAINT "PK_REGISTRATION" PRIMARY KEY ("SUB_CODE", "STU_NO", "CLASSIFICATION") ENABLE;
  ALTER TABLE "REGISTRATION" MODIFY ("CLASSIFICATION" NOT NULL ENABLE);
  ALTER TABLE "REGISTRATION" MODIFY ("STU_NO" NOT NULL ENABLE);
  ALTER TABLE "REGISTRATION" MODIFY ("SUB_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TUITION
--------------------------------------------------------

  ALTER TABLE "TUITION" ADD CONSTRAINT "PK_TUITION" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "TUITION" MODIFY ("STU_NO" NOT NULL ENABLE);
  ALTER TABLE "TUITION" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "PK_EVALUATION" PRIMARY KEY ("SUB_CODE", "STU_NO", "CLASSIFICATION") ENABLE;
  ALTER TABLE "EVALUATION" MODIFY ("CLASSIFICATION" NOT NULL ENABLE);
  ALTER TABLE "EVALUATION" MODIFY ("STU_NO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATION" MODIFY ("SUB_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" MODIFY ("PERSONNEL" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" ADD CONSTRAINT "PK_SUBJECT" PRIMARY KEY ("SUBJ_CODE") ENABLE;
  ALTER TABLE "SUBJECT" MODIFY ("SUBJ_NAME" NOT NULL ENABLE);
  ALTER TABLE "SUBJECT" MODIFY ("SUBJ_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REREPLY
--------------------------------------------------------

  ALTER TABLE "REREPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE);
  ALTER TABLE "REREPLY" ADD CONSTRAINT "REREPLY_PK" PRIMARY KEY ("REREPLY_NO") ENABLE;
  ALTER TABLE "REREPLY" MODIFY ("REREPLY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOKMARK
--------------------------------------------------------

  ALTER TABLE "BOOKMARK" MODIFY ("NO" NOT NULL ENABLE);
  ALTER TABLE "BOOKMARK" ADD CONSTRAINT "BOOKMARK_PK" PRIMARY KEY ("NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "PK_STUDENT" PRIMARY KEY ("STU_NO") ENABLE;
  ALTER TABLE "STUDENT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("PWD" NOT NULL ENABLE);
  ALTER TABLE "STUDENT" MODIFY ("STU_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SCHOLARSHIP
--------------------------------------------------------

  ALTER TABLE "SCHOLARSHIP" ADD CONSTRAINT "PK_SCHOLARSHIP" PRIMARY KEY ("SCHOLARSHIP_NO") ENABLE;
  ALTER TABLE "SCHOLARSHIP" MODIFY ("SCHOLARSHIP_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INBOX
--------------------------------------------------------

  ALTER TABLE "INBOX" ADD CONSTRAINT "PK_INBOX" PRIMARY KEY ("NO") ENABLE;
  ALTER TABLE "INBOX" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE);
  ALTER TABLE "INBOX" MODIFY ("MSG_NO" NOT NULL ENABLE);
  ALTER TABLE "INBOX" MODIFY ("NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIMETABLE
--------------------------------------------------------

  ALTER TABLE "TIMETABLE" ADD CONSTRAINT "PK_TIMETABLE" PRIMARY KEY ("TIMETABLE_CODE") ENABLE;
  ALTER TABLE "TIMETABLE" MODIFY ("PERIOD" NOT NULL ENABLE);
  ALTER TABLE "TIMETABLE" MODIFY ("DAY" NOT NULL ENABLE);
  ALTER TABLE "TIMETABLE" MODIFY ("TIMETABLE_NAME" NOT NULL ENABLE);
  ALTER TABLE "TIMETABLE" MODIFY ("TIMETABLE_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CHATROOM
--------------------------------------------------------

  ALTER TABLE "CHATROOM" ADD CONSTRAINT "CHATROOM_PK" PRIMARY KEY ("ROOM_ID") ENABLE;
  ALTER TABLE "CHATROOM" MODIFY ("ROOM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTHORITY
--------------------------------------------------------

  ALTER TABLE "AUTHORITY" ADD CONSTRAINT "PK_AUTHORITY" PRIMARY KEY ("AUTH_CODE") ENABLE;
  ALTER TABLE "AUTHORITY" MODIFY ("AUTH_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "AUTHORITY" MODIFY ("AUTH_NAME" NOT NULL ENABLE);
  ALTER TABLE "AUTHORITY" MODIFY ("AUTH_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DISTRIBUTE_ASSIGN
--------------------------------------------------------

  ALTER TABLE "DISTRIBUTE_ASSIGN" ADD CONSTRAINT "PK_DISTRIBUTE_ASSIGN" PRIMARY KEY ("ASSIGN_NO") ENABLE;
  ALTER TABLE "DISTRIBUTE_ASSIGN" MODIFY ("OPEN_SUB_CODE" NOT NULL ENABLE);
  ALTER TABLE "DISTRIBUTE_ASSIGN" MODIFY ("ASSIGN_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMP_DEPART
--------------------------------------------------------

  ALTER TABLE "EMP_DEPART" ADD CONSTRAINT "PK_EMP_DEPART" PRIMARY KEY ("DEP_CODE") ENABLE;
  ALTER TABLE "EMP_DEPART" MODIFY ("DEP_NAME" NOT NULL ENABLE);
  ALTER TABLE "EMP_DEPART" MODIFY ("DEP_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJ_EVAL
--------------------------------------------------------

  ALTER TABLE "SUBJ_EVAL" ADD CONSTRAINT "PK_SUBJ_EVAL" PRIMARY KEY ("SUB_CODE", "STU_NO", "CLASSIFICATION") ENABLE;
  ALTER TABLE "SUBJ_EVAL" MODIFY ("CLASSIFICATION" NOT NULL ENABLE);
  ALTER TABLE "SUBJ_EVAL" MODIFY ("STU_NO" NOT NULL ENABLE);
  ALTER TABLE "SUBJ_EVAL" MODIFY ("SUB_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OUTBOX
--------------------------------------------------------

  ALTER TABLE "OUTBOX" ADD CONSTRAINT "PK_OUTBOX" PRIMARY KEY ("MSG_NO") ENABLE;
  ALTER TABLE "OUTBOX" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE);
  ALTER TABLE "OUTBOX" MODIFY ("MSG_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBJ_TIME
--------------------------------------------------------

  ALTER TABLE "SUBJ_TIME" ADD CONSTRAINT "PK_SUBJ_TIME" PRIMARY KEY ("LECTURE_TIME_NO") ENABLE;
  ALTER TABLE "SUBJ_TIME" MODIFY ("TIMETABLE_CODE" NOT NULL ENABLE);
  ALTER TABLE "SUBJ_TIME" MODIFY ("OPEN_SUB_CODE" NOT NULL ENABLE);
  ALTER TABLE "SUBJ_TIME" MODIFY ("LECTURE_TIME_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "DEPARTMENT" PRIMARY KEY ("DEP_NO") ENABLE;
  ALTER TABLE "DEPARTMENT" MODIFY ("DEP_NAME" NOT NULL ENABLE);
  ALTER TABLE "DEPARTMENT" MODIFY ("DEP_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMP_POSITION
--------------------------------------------------------

  ALTER TABLE "EMP_POSITION" ADD CONSTRAINT "PK_EMP_POSITION" PRIMARY KEY ("POSITION_CODE") ENABLE;
  ALTER TABLE "EMP_POSITION" MODIFY ("POSITION_NAME" NOT NULL ENABLE);
  ALTER TABLE "EMP_POSITION" MODIFY ("POSITION_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POSTS
--------------------------------------------------------

  ALTER TABLE "POSTS" ADD CONSTRAINT "POSTS" PRIMARY KEY ("POST_NO") ENABLE;
  ALTER TABLE "POSTS" MODIFY ("POST_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ACCOUNT_INFO
--------------------------------------------------------

  ALTER TABLE "ACCOUNT_INFO" ADD CONSTRAINT "FK_BANK_TO_ACCOUNT_INFO" FOREIGN KEY ("BANK_CODE")
	  REFERENCES "BANK" ("BANK_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ASSIGNMENT
--------------------------------------------------------

  ALTER TABLE "ASSIGNMENT" ADD CONSTRAINT "ASSIGNMENT_FK1" FOREIGN KEY ("ASSIGN_NO")
	  REFERENCES "DISTRIBUTE_ASSIGN" ("ASSIGN_NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ASSIGNMENT" ADD CONSTRAINT "FK_STUDENT_TO_ASSIGNMENT" FOREIGN KEY ("STU_NO")
	  REFERENCES "STUDENT" ("STU_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AWARD
--------------------------------------------------------

  ALTER TABLE "AWARD" ADD CONSTRAINT "FK_SCHOLARSHIP_TO_AWARD" FOREIGN KEY ("SCHOLARSHIP_NO")
	  REFERENCES "SCHOLARSHIP" ("SCHOLARSHIP_NO") ENABLE;
  ALTER TABLE "AWARD" ADD CONSTRAINT "FK_STUDENT_TO_AWARD" FOREIGN KEY ("STU_NO")
	  REFERENCES "STUDENT" ("STU_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("AUTH_CODE")
	  REFERENCES "AUTHORITY" ("AUTH_CODE") ENABLE;
  ALTER TABLE "BOARD" ADD CONSTRAINT "FK_CATEGORY_TO_BOARD" FOREIGN KEY ("CATEGORY_CODE")
	  REFERENCES "CATEGORY" ("CATEGORY_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CERTIFICATION
--------------------------------------------------------

  ALTER TABLE "CERTIFICATION" ADD CONSTRAINT "FK_STUDENT_" FOREIGN KEY ("STU_NO")
	  REFERENCES "STUDENT" ("STU_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CHATMESSAGE
--------------------------------------------------------

  ALTER TABLE "CHATMESSAGE" ADD CONSTRAINT "CHATMESSAGE_FK1" FOREIGN KEY ("ROOM_ID")
	  REFERENCES "CHATROOM" ("ROOM_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLASSROOM
--------------------------------------------------------

  ALTER TABLE "CLASSROOM" ADD CONSTRAINT "FK_BUILDING_TO_CLASSROOM" FOREIGN KEY ("BUILDING_CODE")
	  REFERENCES "BUILDING" ("BUILDING_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "FK_BUILDING_TO_DEPARTMENT" FOREIGN KEY ("BUILDING_CODE")
	  REFERENCES "BUILDING" ("BUILDING_CODE") ENABLE;
  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "FK_FACULTY_TO_DEPARTMENT" FOREIGN KEY ("FACULTY_NO")
	  REFERENCES "FACULTY" ("FACULTY_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DISTRIBUTE_ASSIGN
--------------------------------------------------------

  ALTER TABLE "DISTRIBUTE_ASSIGN" ADD CONSTRAINT "FK_OPEN_SUBJ_TO_DISTR_ASSIGN" FOREIGN KEY ("OPEN_SUB_CODE")
	  REFERENCES "OPEN_SUBJ" ("OPEN_SUB_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_FK1" FOREIGN KEY ("POSITION_CODE")
	  REFERENCES "EMP_POSITION" ("POSITION_CODE") ENABLE;
  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_AUTHORITY_TO_EMPLOYEE" FOREIGN KEY ("AUTH_CODE")
	  REFERENCES "AUTHORITY" ("AUTH_CODE") ENABLE;
  ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_EMP_DEPART_TO_EMPLOYEE" FOREIGN KEY ("DEP_CODE")
	  REFERENCES "EMP_DEPART" ("DEP_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVALUATION
--------------------------------------------------------

  ALTER TABLE "EVALUATION" ADD CONSTRAINT "FK_REGISTRATION_TO_EVALUATION" FOREIGN KEY ("SUB_CODE", "STU_NO", "CLASSIFICATION")
	  REFERENCES "REGISTRATION" ("SUB_CODE", "STU_NO", "CLASSIFICATION") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILES
--------------------------------------------------------

  ALTER TABLE "FILES" ADD CONSTRAINT "FILES_FK1" FOREIGN KEY ("POST_NO")
	  REFERENCES "POSTS" ("POST_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INBOX
--------------------------------------------------------

  ALTER TABLE "INBOX" ADD CONSTRAINT "FK_OUTBOX_TO_INBOX" FOREIGN KEY ("MSG_NO")
	  REFERENCES "OUTBOX" ("MSG_NO") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OPEN_SUBJ
--------------------------------------------------------

  ALTER TABLE "OPEN_SUBJ" ADD CONSTRAINT "FK_PROFESSOR_" FOREIGN KEY ("PROF_NO")
	  REFERENCES "PROFESSOR" ("PROF_NO") ENABLE;
  ALTER TABLE "OPEN_SUBJ" ADD CONSTRAINT "FK_SUBJECT_" FOREIGN KEY ("SUBJ_CODE")
	  REFERENCES "SUBJECT" ("SUBJ_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POSTS
--------------------------------------------------------

  ALTER TABLE "POSTS" ADD CONSTRAINT "POSTS_FK1" FOREIGN KEY ("BD_CODE")
	  REFERENCES "BOARD" ("BD_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROFESSOR
--------------------------------------------------------

  ALTER TABLE "PROFESSOR" ADD CONSTRAINT "FK_DEPARTMENT_TO_PROFESSOR" FOREIGN KEY ("DEP_NO")
	  REFERENCES "DEPARTMENT" ("DEP_NO") ENABLE;
  ALTER TABLE "PROFESSOR" ADD CONSTRAINT "FK_PROF_POSITION_TO_PROFESSOR" FOREIGN KEY ("POSITION_NO")
	  REFERENCES "PROF_POSITION" ("POSITION_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REGISTRATION
--------------------------------------------------------

  ALTER TABLE "REGISTRATION" ADD CONSTRAINT "FK_OPEN_SUBJ_" FOREIGN KEY ("SUB_CODE")
	  REFERENCES "OPEN_SUBJ" ("OPEN_SUB_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REGISTRATION" ADD CONSTRAINT "FK_STUDENT_TO_REGISTRATION" FOREIGN KEY ("STU_NO")
	  REFERENCES "STUDENT" ("STU_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REGI_TIMETABLE
--------------------------------------------------------

  ALTER TABLE "REGI_TIMETABLE" ADD CONSTRAINT "REGI_TIMETABLE_FK1" FOREIGN KEY ("OPEN_SUB_CODE")
	  REFERENCES "OPEN_SUBJ" ("OPEN_SUB_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "REPLY_FK1" FOREIGN KEY ("POST_NO")
	  REFERENCES "POSTS" ("POST_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REREPLY
--------------------------------------------------------

  ALTER TABLE "REREPLY" ADD CONSTRAINT "REREPLY_FK1" FOREIGN KEY ("REPLY_NO")
	  REFERENCES "REPLY" ("REPLY_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "FK_DEPARTMENT_TO_STUDENT" FOREIGN KEY ("MAJOR")
	  REFERENCES "DEPARTMENT" ("DEP_NO") ENABLE;
  ALTER TABLE "STUDENT" ADD CONSTRAINT "FK_STUDENT_STATE_TO_STUDENT" FOREIGN KEY ("STATE")
	  REFERENCES "STUDENT_STATE" ("STATE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBJECT
--------------------------------------------------------

  ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_PROFESSOR_TO_SUBJECT" FOREIGN KEY ("PROF_NO")
	  REFERENCES "PROFESSOR" ("PROF_NO") ENABLE;
  ALTER TABLE "SUBJECT" ADD CONSTRAINT "FK_SUBJ_TYPE_TO_SUBJECT" FOREIGN KEY ("TYPE_CODE")
	  REFERENCES "SUBJ_TYPE" ("TYPE_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBJ_EVAL
--------------------------------------------------------

  ALTER TABLE "SUBJ_EVAL" ADD CONSTRAINT "FK_REGISTRATION_" FOREIGN KEY ("SUB_CODE", "STU_NO", "CLASSIFICATION")
	  REFERENCES "REGISTRATION" ("SUB_CODE", "STU_NO", "CLASSIFICATION") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBJ_TIME
--------------------------------------------------------

  ALTER TABLE "SUBJ_TIME" ADD CONSTRAINT "FK_CLASSROOM_" FOREIGN KEY ("CLASSROOM_CODE")
	  REFERENCES "CLASSROOM" ("CLASSROOM_CODE") ENABLE;
  ALTER TABLE "SUBJ_TIME" ADD CONSTRAINT "FK_OPEN_SUBJ_2" FOREIGN KEY ("OPEN_SUB_CODE")
	  REFERENCES "OPEN_SUBJ" ("OPEN_SUB_CODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SUBJ_TIME" ADD CONSTRAINT "FK_TIMETABLE_" FOREIGN KEY ("TIMETABLE_CODE")
	  REFERENCES "TIMETABLE" ("TIMETABLE_CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SYLLABUS
--------------------------------------------------------

  ALTER TABLE "SYLLABUS" ADD CONSTRAINT "FK_OPEN_SUBJ_3" FOREIGN KEY ("OPEN_SUB_CODE")
	  REFERENCES "OPEN_SUBJ" ("OPEN_SUB_CODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TUITION
--------------------------------------------------------

  ALTER TABLE "TUITION" ADD CONSTRAINT "FK_STUDENT_TO_TUITION" FOREIGN KEY ("STU_NO")
	  REFERENCES "STUDENT" ("STU_NO") ENABLE;
