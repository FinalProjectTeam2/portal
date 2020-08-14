/* 등록금 테이블 */
/* 첫번째 테이블 (학생정보관련) : 학부, 학과, 학번, 이름, 학기 - 학부생 테이블, 학부 테이블, 학과 테이블 */ 
/* 두번째 테이블 (수납정보) : 수납구분, 납부기간, 가상계좌, 수납금액, 수납여부 - 계좌 테이블, 은행 테이블 */  
/* 세번째 테이블 (수납상세정보) : 등록금, 입학금, 수업료, 실습비, 학생회비, 감면액, 납부한 날짜, 납부 날짜, 수납여부  -등록금 테이블, 징학금테이블 */

/* 학부생 student */
--  stu_no VARCHAR2(100) NOT NULL, /* 학번 */
--	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
--	name VARCHAR2(50) NOT NULL, /* 성명 */
--	major NUMBER, /* 전공 */
--	semester NUMBER DEFAULT 1, /* 학기 */
--	credits NUMBER DEFAULT 0, /* 이수학점 */
--	state VARCHAR2(100) DEFAULT '신입생', /* 학적상태 */
--	admission_date DATE DEFAULT sysdate, /* 입학일 */
--	graduation_date DATE, /* 졸업일 */
--	identity_state CHAR(1) DEFAULT 'N', /* 본인인증상태 */
--	minor NUMBER, /* 부전공 */
--	identify_code VARCHAR2(30) /*인증코드*/


/* 학부 faculty */
--  faculty_no NUMBER NOT NULL, /* 학부번호  pk*/
--	faculty_name VARCHAR2(100) NOT NULL /* 학부이름 */


/* 학과 department */
--  dep_no NUMBER NOT NULL, /* 학과번호 pk */
--	dep_name VARCHAR2(100) NOT NULL, /* 학과명 */
--	tel VARCHAR2(30), /* 전화번호 */
--	building_code VARCHAR2(30), /* 건물코드 */
--	faculty_no NUMBER, /* 학부번호 */
--	total_credit NUMBER /* 졸업이수학점 */


/* 계좌정보 account_info */
--	official_no VARCHAR2(100), /* 관계자 번호 : 학생 stu_no*/
--	bank_code VARCHAR2(20), /* 은행코드 */
--	account_no VARCHAR2(30), /* 계좌번호 */
--	account_name VARCHAR2(50) /* 예금주명 */


/* 은행 bank*/
--	bank_code VARCHAR2(20) NOT NULL, /* 은행코드 pk */
--	bank_name VARCHAR2(50) NOT NULL /* 은행명 */


/* 등록금 tuition */
--	no NUMBER NOT NULL, /* 번호  pk*/
--	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
--	semester NUMBER, /* 학기 */
--	tuition NUMBER, /* 등록금액 */	
--  admissionfee NUMBER, /* 입학금 */
--  practicecost NUMBER,/* 실습비 */
--  studentfee NUMBER,/* 학생회비 */
--  reduction NUMBER, /* 감면액 */
--	deposit_state CHAR(1) DEFAULT 'N', /* 납부여부 */
--	deposit_date DATE, /* 납부일 */
--	datepaid DATE, /* 납부한 날짜 */ 
--	total NUMBER, /* 총금액 */
--	remark clob /* 비고 */ 

/* 장학금 수여 award */
--	no NUMBER NOT NULL, /* 번호 */
--	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
--	scholarship_no NUMBER NOT NULL, /* 장학금 번호 */
--	awarding_date DATE DEFAULT sysdate /* 수여일 */


/* 장학금 scholarship */
--  scholarship_no NUMBER NOT NULL, /* 장학금 번호  pk*/
--	scholarship_type VARCHAR2(50), /* 장학금 종류 */
--	scholarship NUMBER /* 장학금 금액 */


/* 등록금 시퀀스 */
CREATE SEQUENCE tuition_seq
INCREMENT BY 1
START WITH 1
NOCACHE;



/* insert*/
-- student 테이블
insert into student(stu_no, pwd, name, major, semester, credits, state, admission_date)  
values('20200029999', 'h1234', '홍길동', '2', '1', '18', '신입생', sysdate);

-- account_info 테이블
insert into account_info(bank_code, account_no, account_name)
values('004', '111111-01-101010', '척척학사');

-- bank 테이블
insert into bank
values('004', '국민은행');

-- tuition 테이블
insert into tuition(no, stu_no, semester, admissionfee, tuition, practicecost, studentfee, reduction, total, datepaid, deposit_state)
values(tuition_seq.nextval, '20200029999', '1', '0', '1000000000', '300000', '150000', '0', '1450000', sysdate, 'N');



/*뷰 생성*/
-- student_view2 - 학부, 학과, 학번, 이름, 학기 */
create or replace view student_view2 as
select d.dep_name, f.faculty_name, s.stu_no, s.name, s.semester
from department d join faculty f
on  d.faculty_no = f.faculty_no
join student s
on d.dep_no=s.major;

select * from student_view2;

-- 등록금 view
create or replace view tuition_view as
select t.deposit_date, b.bank_name, a.account_no, t.total, t.deposit_state
from bank b join account_info a
on b.bank_code = a.bank_code
join student s
on s.stu_no = a.official_no
join tuition t
on s.stu_no = t.stu_no;

select * from tuition_view;

-- 장학금만 가져오기
create or replace view scholarship_view as
select s.scholarship
from scholarship s join award a 
on s.scholarship_no = a.scholarship_no
join student stu
on stu.stu_no = a.stu_no;

select * from scholarship_view;

-- 등록금 상세 view
create or replace view tuitionD_view as
select t.admissionfee, t.tuition, t.practicecost, t.studentfee, s.scholarship, t.reduction, t.total, t.remark 
from scholarship s join award a 
on s.scholarship_no = a.scholarship_no
join student stu
on stu.stu_no = a.stu_no
join tuition t
on t.stu_no = stu.stu_no;

select * from scholarshipD_view;


--
select * from student;
select * from faculty;
select * from department;
select * from bank;
select * from account_info;
select * from tuition;

select * from student_view2;
select * from scholarship_view;
select * from tuition_view;
select * from tuitionD_view



