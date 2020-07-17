--sys나 system 계정으로 로그인해서 사용자 생성, 테이블스페이스 생성하기
--sqlplus / as sysdba  ==>시스템dba접속

--테이블 스페이스 생성
create tablespace portal
datafile 'C:\oraclexe\mydata\portal.dbf' size 48m
autoextend on next 10m;

/*
--테이블 스페이스 삭제
drop tablespace javatest including contents and datafiles;
*/

--사용자 계정 생성
create user portal
identified by portal123
default tablespace portal;

--사용자 권한부여
grant connect,resource to portal;

--뷰 생성 권한 부여하기
grant create view to portal;



/* 교수 */
CREATE TABLE professor (
	prof_no VARCHAR2(100) NOT NULL, /* 교수번호 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	prof_name VARCHAR2(50) NOT NULL, /* 교수명 */
	dep_no NUMBER, /* 학과번호 */
	position_no NUMBER NOT NULL, /* 직책번호 */
	start_date DATE DEFAULT sysdate, /* 임용일 */
	resignation_date DATE, /* 퇴직일 */
	identity_state CHAR(4) DEFAULT 'N' /* 본인인증상태 */
);

ALTER TABLE professor
	ADD
		CONSTRAINT professor
		PRIMARY KEY (
			prof_no
		);

/* 학과 */
CREATE TABLE department (
	dep_no NUMBER NOT NULL, /* 학과번호 */
	dep_name VARCHAR2(100) NOT NULL, /* 학과명 */
	tel VARCHAR2(30), /* 전화번호 */
	building_code VARCHAR2(30), /* 건물코드 */
	faculty_no NUMBER, /* 학부번호 */
	total_credit NUMBER /* 졸업이수학점 */
);

ALTER TABLE department
	ADD
		CONSTRAINT department
		PRIMARY KEY (
			dep_no
		);

/* 학부 */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* 학부번호 */
	faculty_name VARCHAR2(100) NOT NULL /* 학부이름 */
);

ALTER TABLE faculty
	ADD
		CONSTRAINT PK_faculty
		PRIMARY KEY (
			faculty_no
		);

/* 학부생 */
CREATE TABLE student (
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	name VARCHAR2(50) NOT NULL, /* 성명 */
	major NUMBER, /* 전공 */
	semester NUMBER DEFAULT 1, /* 학기 */
	credits NUMBER DEFAULT 0, /* 이수학점 */
	state VARCHAR2(100) DEFAULT '신입생', /* 학적상태 */
	admission_date DATE DEFAULT sysdate, /* 입학일 */
	graduation_date DATE, /* 졸업일 */
	identity_state CHAR(5) DEFAULT 'N', /* 본인인증상태 */
	minor NUMBER /* 부전공 */
);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			stu_no
		);

/* 임직원 */
CREATE TABLE employee (
	emp_no VARCHAR2(100) NOT NULL, /* 임직원번호 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	start_date DATE DEFAULT sysdate, /* 입사일 */
	dep_code VARCHAR2(50), /* 부서코드 */
	auth_code VARCHAR2(50), /* 관리코드 */
	emp_name VARCHAR2(50) NOT NULL, /* 임직원명 */
	resignation_date DATE, /* 퇴사일 */
	Identity_state CHAR(5) DEFAULT 'N' /* 본인인증상태 */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			emp_no
		);

/* 교수 직책 */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* 직책번호 */
	position_name VARCHAR2(50) NOT NULL /* 직책명 */
);

ALTER TABLE prof_position
	ADD
		CONSTRAINT PK_prof_position
		PRIMARY KEY (
			position_no
		);

/* 관계자 상세정보 */
CREATE TABLE official_info (
	official_no VARCHAR2(100), /* 관계자 번호 */
	hp1 VARCHAR2(10), /* 핸드폰1 */
	hp2 VARCHAR2(10), /* 핸드폰2 */
	hp3 VARCHAR2(10), /* 핸드폰3 */
	email1 VARCHAR2(50), /* 이메일1 */
	email2 VARCHAR2(50), /* 이메일2 */
	zipcode VARCHAR2(50), /* 우편번호 */
	address VARCHAR2(100), /* 주소 */
	addr_detail VARCHAR2(100), /* 주소상세 */
	ssn VARCHAR2(100), /* 주민번호 */
	gender VARCHAR2(20), /* 성별 */
	certi_code VARCHAR2(30) /* 인증코드 */
);

/* 계좌정보 */
CREATE TABLE account_info (
	official_no VARCHAR2(100), /* 관계자 번호 */
	bank_code VARCHAR2(20), /* 은행코드 */
	account_no VARCHAR2(30), /* 계좌번호 */
	account_name VARCHAR2(50) /* 예금주명 */
);

/* 임직원 직책 */
CREATE TABLE emp_position (
	position_code VARCHAR2(50) NOT NULL, /* 직책코드 */
	position_name VARCHAR2(50) NOT NULL /* 직책명 */
);

ALTER TABLE emp_position
	ADD
		CONSTRAINT PK_emp_position
		PRIMARY KEY (
			position_code
		);

/* 과목 */
CREATE TABLE subject (
	subj_code VARCHAR2(30) NOT NULL, /* 과목코드 */
	subj_name VARCHAR2(100) NOT NULL, /* 과목명 */
	explanation CLOB, /* 과목설명 */
	type_code VARCHAR2(30), /* 구분코드 */
	credit NUMBER, /* 이수학점 */
	prof_no VARCHAR2(100) /* 교수번호 */
);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			subj_code
		);

/* 이수구분 */
CREATE TABLE subj_type (
	type_code VARCHAR2(30) NOT NULL, /* 구분코드 */
	type VARCHAR2(30) /* 이수구분 */
);

ALTER TABLE subj_type
	ADD
		CONSTRAINT PK_subj_type
		PRIMARY KEY (
			type_code
		);

/* 기본 시간표 */
CREATE TABLE timetable (
	timetable_code VARCHAR2(10) NOT NULL, /* 시간기준코드 */
	timetable_name VARCHAR2(50) NOT NULL, /* 표시교시명 */
	day VARCHAR2(10) NOT NULL, /* 요일 */
	period NUMBER NOT NULL /* 교시 */
);

ALTER TABLE timetable
	ADD
		CONSTRAINT PK_timetable
		PRIMARY KEY (
			timetable_code
		);

/* 개설교과과정 */
CREATE TABLE open_subject (
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	subj_code VARCHAR2(30) NOT NULL, /* 과목코드 */
	open_date DATE DEFAULT sysdate, /* 개설일자 */
	close_date DATE, /* 폐지일자 */
	prof_no VARCHAR2(100) NOT NULL /* 교수번호 */
);

ALTER TABLE open_subject
	ADD
		CONSTRAINT PK_open_subject
		PRIMARY KEY (
			open_sub_code
		);

/* 강의시간표 */
CREATE TABLE subj_timetable (
	lecture_time_code VARCHAR2(10) NOT NULL, /* 강의시간표코드 */
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	timetable_code VARCHAR2(10) NOT NULL, /* 시간기준코드 */
	classroom_code VARCHAR2(10) /* 강의실코드 */
);

ALTER TABLE subj_timetable
	ADD
		CONSTRAINT PK_subj_timetable
		PRIMARY KEY (
			lecture_time_code
		);

/* 강의실 */
CREATE TABLE classroom (
	classroom_code VARCHAR2(10) NOT NULL, /* 강의실코드 */
	classroom_name VARCHAR2(30) NOT NULL, /* 강의실명 */
	building_code VARCHAR2(30) NOT NULL /* 건물코드 */
);

ALTER TABLE classroom
	ADD
		CONSTRAINT PK_classroom
		PRIMARY KEY (
			classroom_code
		);

/* 건물 */
CREATE TABLE building (
	building_code VARCHAR2(30) NOT NULL, /* 건물코드 */
	building_name VARCHAR2(100) NOT NULL, /* 건물명 */
	detail VARCHAR2(150), /* 상세위치 */
	tel VARCHAR2(20) /* 전화번호 */
);

ALTER TABLE building
	ADD
		CONSTRAINT PK_building
		PRIMARY KEY (
			building_code
		);

/* 강의계획 */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	syllabus CLOB NOT NULL, /* 강의계획서 */
	theory_time NUMBER, /* 이론시간 */
	training_time NUMBER /* 실습시간 */
);

/* 수강신청 */
CREATE TABLE registration (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	reg_date DATE DEFAULT sysdate, /* 수강신청일자 */
	score NUMBER, /* 성적 */
	lecture_eval_flag CHAR(4) DEFAULT 'N' /* 강의평가완료여부 */
);

ALTER TABLE registration
	ADD
		CONSTRAINT PK_registration
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 성적 */
CREATE TABLE evaluation (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	midterm NUMBER, /* 중간고사 */
	finals NUMBER, /* 기말고사 */
	assignment NUMBER, /* 과제 */
	attendance NUMBER, /* 출석 */
	etc NUMBER, /* 기타 */
	total_grade NUMBER, /* 총점 */
	reg_date DATE DEFAULT sysdate, /* 입력날짜 */
	edit_date DATE /* 수정날짜 */
);

ALTER TABLE evaluation
	ADD
		CONSTRAINT PK_evaluation
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 강의평가 */
CREATE TABLE subj_evaluation (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	contents CLOB /* 평가내용 */
);

ALTER TABLE subj_evaluation
	ADD
		CONSTRAINT PK_subj_evaluation
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 게시판 */
CREATE TABLE board (
	board_no NUMBER NOT NULL, /* 게시판번호 */
	category_code VARCHAR2(10) NOT NULL, /* 카테고리코드 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	title VARCHAR2(150) NOT NULL, /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE DEFAULT sysdate, /* 작성일 */
	file_name VARCHAR2(100), /* 파일이름 */
	file_size NUMBER, /* 파일크기 */
	original_file_name VARCHAR2(100), /* 원본파일이름 */
	read_count NUMBER DEFAULT 0, /* 조회수 */
	down_count NUMBER DEFAULT 0 /* 다운로드수 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			board_no
		);

/* 카테고리 */
CREATE TABLE category (
	category_code VARCHAR2(10) NOT NULL, /* 카테고리코드 */
	category_name VARCHAR2(100) NOT NULL /* 카테고리명 */
);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			category_code
		);

/* 댓글 */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	board_no NUMBER NOT NULL, /* 게시판번호 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	reg_date DATE DEFAULT sysdate, /* 등록일 */
	contents CLOB, /* 내용 */
	group_no NUMBER, /* 원본글번호 */
	sort_no NUMBER, /* 정렬번호 */
	step NUMBER, /* 차수 */
	del_flag CHAR(5) DEFAULT 'N' /* 삭제여부 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);

/* 질문답변 */
CREATE TABLE qna (
	qna_no NUMBER NOT NULL, /* 질문답변번호 */
	category_code VARCHAR2(10) NOT NULL, /* 카테고리코드 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	title VARCHAR2(150), /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE, /* 작성일 */
	read_count NUMBER DEFAULT 0, /* 조회수 */
	group_no NUMBER, /* 원본글번호 */
	sort_no NUMBER, /* 정렬번호 */
	step NUMBER, /* 차수 */
	private_flag CHAR(5) DEFAULT 'N', /* 비공개여부 */
	del_flag CHAR(5) DEFAULT 'N' /* 삭제여부 */
);

ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna
		PRIMARY KEY (
			qna_no
		);

/* 과제 */
CREATE TABLE assignment (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	file_name VARCHAR2(100), /* 파일이름 */
	file_size NUMBER, /* 파일사이즈 */
	original_file_name VARCHAR2(100) /* 원본파일이름 */
);

ALTER TABLE assignment
	ADD
		CONSTRAINT PK_assignment
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 쪽지 */
CREATE TABLE message (
	msg_no NUMBER NOT NULL, /* 족지번호 */
	sender VARCHAR2(100) NOT NULL, /* 발신인번호 */
	title VARCHAR2(150) NOT NULL, /* 제목 */
	contents CLOB, /* 내용 */
	addressee VARCHAR2(100) NOT NULL, /* 수신인번호 */
	send_date DATE DEFAULT sysdate, /* 발송일 */
	read_date DATE, /* 읽은날짜 */
	keep_flag CHAR(5) DEFAULT 'N' /* 보관여부 */
);

ALTER TABLE message
	ADD
		CONSTRAINT PK_message
		PRIMARY KEY (
			msg_no
		);

/* 공지게시판 */
CREATE TABLE notice (
	notice_no NUMBER NOT NULL, /* 게시판번호 */
	notice_code VARCHAR2(10) NOT NULL, /* 구분코드 */
	title VARCHAR2(150) NOT NULL, /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE DEFAULT sysdate, /* 작성일 */
	file_name VARCHAR2(100), /* 파일이름 */
	file_size NUMBER, /* 파일크기 */
	original_file_name VARCHAR2(100), /* 원본파일이름 */
	read_count NUMBER DEFAULT 0, /* 조회수 */
	down_count NUMBER /* 다운로드수 */
);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			notice_no
		);

/* 공지구분 */
CREATE TABLE notice_cate (
	notice_code VARCHAR2(10) NOT NULL, /* 구분코드 */
	notice_name VARCHAR2(100) NOT NULL /* 구분이름 */
);

ALTER TABLE notice_cate
	ADD
		CONSTRAINT PK_notice_cate
		PRIMARY KEY (
			notice_code
		);

/* 등록금 */
CREATE TABLE tuition (
	no NUMBER NOT NULL, /* 번호 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	semester NUMBER, /* 학기 */
	tuition NUMBER, /* 등록금액 */
	deposit_state CHAR(5) DEFAULT 'N', /* 납부여부 */
	deposit_date DATE /* 납부일 */
);

ALTER TABLE tuition
	ADD
		CONSTRAINT PK_tuition
		PRIMARY KEY (
			no
		);

/* 장학금 */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* 장학금 번호 */
	scholarship_type VARCHAR2(50), /* 장학금 종류 */
	scholarship NUMBER /* 장학금 금액 */
);

ALTER TABLE scholarship
	ADD
		CONSTRAINT PK_scholarship
		PRIMARY KEY (
			scholarship_no
		);

/* 장학금 수여 */
CREATE TABLE award (
	no NUMBER NOT NULL, /* 번호 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	scholarship_no NUMBER NOT NULL, /* 장학금 번호 */
	awarding_date DATE DEFAULT sysdate /* 수여일 */
);

ALTER TABLE award
	ADD
		CONSTRAINT PK_award
		PRIMARY KEY (
			no
		);

/* 부서 */
CREATE TABLE emp_depart (
	dep_code VARCHAR2(50) NOT NULL, /* 부서코드 */
	dep_name VARCHAR2(100) NOT NULL, /* 부서명 */
	position_code VARCHAR2(50) NOT NULL /* 직책코드 */
);

ALTER TABLE emp_depart
	ADD
		CONSTRAINT PK_emp_depart
		PRIMARY KEY (
			dep_code
		);

/* 은행 */
CREATE TABLE bank (
	bank_code VARCHAR2(20) NOT NULL, /* 은행코드 */
	bank_name VARCHAR2(50) NOT NULL /* 은행명 */
);

ALTER TABLE bank
	ADD
		CONSTRAINT PK_bank
		PRIMARY KEY (
			bank_code
		);

/* 권한 */
CREATE TABLE authority (
	auth_code VARCHAR2(50) NOT NULL, /* 관리코드 */
	auth_name VARCHAR2(30) NOT NULL, /* 관리명 */
	auth_desc VARCHAR2(30), /* 설명 */
	auth_level NUMBER NOT NULL, /* 레벨 */
	reg_date DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE authority
	ADD
		CONSTRAINT PK_authority
		PRIMARY KEY (
			auth_code
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_prof_position_TO_professor
		FOREIGN KEY (
			position_no
		)
		REFERENCES prof_position (
			position_no
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_department_TO_professor
		FOREIGN KEY (
			dep_no
		)
		REFERENCES department (
			dep_no
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_faculty_TO_department
		FOREIGN KEY (
			faculty_no
		)
		REFERENCES faculty (
			faculty_no
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_building_TO_department
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_department_TO_student
		FOREIGN KEY (
			major
		)
		REFERENCES department (
			dep_no
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_depart_TO_employee
		FOREIGN KEY (
			dep_code
		)
		REFERENCES emp_depart (
			dep_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_authority_TO_employee
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE account_info
	ADD
		CONSTRAINT FK_bank_TO_account_info
		FOREIGN KEY (
			bank_code
		)
		REFERENCES bank (
			bank_code
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_subj_type_TO_subject
		FOREIGN KEY (
			type_code
		)
		REFERENCES subj_type (
			type_code
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_professor_TO_subject
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE open_subject
	ADD
		CONSTRAINT FK_subject_TO_open_subject
		FOREIGN KEY (
			subj_code
		)
		REFERENCES subject (
			subj_code
		);

ALTER TABLE open_subject
	ADD
		CONSTRAINT FK_professor_TO_open_subject
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE subj_timetable
	ADD
		CONSTRAINT FK_timetable_TO_subj_timetable
		FOREIGN KEY (
			timetable_code
		)
		REFERENCES timetable (
			timetable_code
		);

ALTER TABLE subj_timetable
	ADD
		CONSTRAINT FK_open_subject_TO_subj_timetable
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subject (
			open_sub_code
		);

ALTER TABLE subj_timetable
	ADD
		CONSTRAINT FK_classroom_TO_subj_timetable
		FOREIGN KEY (
			classroom_code
		)
		REFERENCES classroom (
			classroom_code
		);

ALTER TABLE classroom
	ADD
		CONSTRAINT FK_building_TO_classroom
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE syllabus
	ADD
		CONSTRAINT FK_open_subject_TO_syllabus
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subject (
			open_sub_code
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_open_subject_TO_registration
		FOREIGN KEY (
			sub_code
		)
		REFERENCES open_subject (
			open_sub_code
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_student_TO_registration
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_registration_TO_evaluation
		FOREIGN KEY (
			sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			sub_code,
			stu_no,
			classification
		);

ALTER TABLE subj_evaluation
	ADD
		CONSTRAINT FK_registration_TO_subj_evaluation
		FOREIGN KEY (
			sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			sub_code,
			stu_no,
			classification
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			category_code
		)
		REFERENCES category (
			category_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);

ALTER TABLE qna
	ADD
		CONSTRAINT FK_category_TO_qna
		FOREIGN KEY (
			category_code
		)
		REFERENCES category (
			category_code
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_registration_TO_assignment
		FOREIGN KEY (
			sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			sub_code,
			stu_no,
			classification
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_notice_cate_TO_notice
		FOREIGN KEY (
			notice_code
		)
		REFERENCES notice_cate (
			notice_code
		);

ALTER TABLE tuition
	ADD
		CONSTRAINT FK_student_TO_tuition
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_student_TO_award
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_scholarship_TO_award
		FOREIGN KEY (
			scholarship_no
		)
		REFERENCES scholarship (
			scholarship_no
		);

ALTER TABLE emp_depart
	ADD
		CONSTRAINT FK_emp_position_TO_emp_depart
		FOREIGN KEY (
			position_code
		)
		REFERENCES emp_position (
			position_code
		);
/* 시퀀스 생성 */

/*
board에 board_no

reply에 reply_no

qna에 qna_no

message에 msg_no

notice에 notice_no

tuition에 no

scholarship에 scholarship_no

award에 no


*/
/*board*/
CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*reply*/
CREATE SEQUENCE reply_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*qna*/
CREATE SEQUENCE qna_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*message*/
CREATE SEQUENCE message_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*notice*/
CREATE SEQUENCE notice_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*tuition*/
CREATE SEQUENCE tuition_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*scholarship*/
CREATE SEQUENCE scholarship_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*award*/
CREATE SEQUENCE award_seq
INCREMENT BY 1
START WITH 1
NOCACHE; 