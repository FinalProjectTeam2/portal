--직책
insert into emp_position
values('1','부장');
insert into emp_position
values('2','주임');
insert into emp_position
values('3','사원');

--부서
insert into emp_depart
values('1','교학처');
insert into emp_depart
values('2','기획처');
insert into emp_depart
values('3','학생처');
insert into emp_depart
values('4','입학홍보처');
insert into emp_depart
values('5','사무처');

select * from authority;
--권한
INSERT INTO authority VALUES ('ADMIN','관리자', 'manager',1, SYSDATE);
INSERT INTO authority VALUES ('ASSISTANT','부관리자', 'assistant manager',2, SYSDATE);
INSERT INTO authority VALUES ('STAFF','스태프', 'staff',3, SYSDATE);

--DROP TABLE "EMPLOYEE" CASCADE CONSTRAINTS;
CREATE TABLE employee (
   emp_no VARCHAR2(100) NOT NULL, /* 임직원번호 */
   pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
   start_date DATE DEFAULT sysdate, /* 입사일 */
   dep_code VARCHAR2(50), /* 부서코드 */
   auth_code VARCHAR2(50), /* 관리코드 */
   emp_name VARCHAR2(50) NOT NULL, /* 임직원명 */
   resignation_date DATE, /* 퇴사일 */
   Identity_state CHAR(5) DEFAULT 'N', /* 본인인증상태 */
   position_code varchar2(50)
);
select * from employee;

CREATE SEQUENCE employee_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE PROFESSOR_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE STUDENT_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

