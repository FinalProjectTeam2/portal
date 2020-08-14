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

/* 계좌정보 */
CREATE TABLE account_info (
	official_no VARCHAR2(100), /* 관계자 번호 */
	bank_code VARCHAR2(20), /* 은행코드 */
	account_no VARCHAR2(30), /* 계좌번호 */
	account_name VARCHAR2(50) /* 예금주명 */
);

/* 과제 */
CREATE TABLE assignment (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	stu_no VARCHAR2(100), /* 학번 */
	file_name VARCHAR2(100), /* 파일이름 */
	file_size NUMBER, /* 파일사이즈 */
	original_file_name VARCHAR2(100), /* 원본파일이름 */
	apply_date DATE DEFAULT sysdate /* 제출일 */
);

/* 권한 */
CREATE TABLE authority (
	auth_code VARCHAR2(50) NOT NULL, /* 권한코드 */
	auth_name VARCHAR2(30) NOT NULL, /* 권한명 */
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

/* 게시판 */
CREATE TABLE board (
	bd_code VARCHAR2(10) NOT NULL, /* 게시판코드 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	bd_name VARCHAR2(150) NOT NULL, /* 게시판 이름 */
	reg_date DATE DEFAULT sysdate, /* 게시판 등록일 */
	edit_date DATE, /* 게시판 수정일 */
	bd_order NUMBER, /* 게시판 순서 */
	usage CHAR(1) DEFAULT 'Y', /* 사용 여부 */
	is_reply CHAR(1) DEFAULT 'N', /* 댓글여부 */
	is_comment CHAR(1) DEFAULT 'N', /* 답글여부 */
	is_private CHAR(1) DEFAULT 'N', /* 비공개여부 */
	is_upload CHAR(1) DEFAULT 'N', /* 업로드 가능 여부 */
	max_upfile NUMBER DEFAULT 1, /* 업로드 가능 개수 */
	max_filesize NUMBER DEFAULT 1024*1024, /* 업로드 가능 파일사이즈 */
	category_code VARCHAR2(10) NOT NULL, /* 카테고리코드 */
	auth_code VARCHAR2(50) /* 권한코드 */
);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bd_code
		);

/* 즐겨찾기 */
CREATE TABLE bookmark (
	no <지정 되지 않음> NOT NULL, /* 번호 */
	official_no <지정 되지 않음>, /* 관계자번호 */
	name <지정 되지 않음>, /* 북마크명 */
	url <지정 되지 않음> /* 북마크주소 */
);

ALTER TABLE bookmark
	ADD
		CONSTRAINT PK_bookmark
		PRIMARY KEY (
			no
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

/* 카테고리 */
CREATE TABLE category (
	category_code VARCHAR2(10) NOT NULL, /* 카테고리코드 */
	category_name VARCHAR2(100) NOT NULL, /* 카테고리명 */
	usage CHAR(1) DEFAULT 'N', /* 사용여부 */
	reg_date DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			category_code
		);

/* 증명서발급 */
CREATE TABLE certification (
	no VARCHAR2(20) NOT NULL, /* 발급번호 */
	cert_code VARCHAR2(20), /* 증명서코드 */
	qty NUMBER, /* 매수 */
	stu_no VARCHAR2(100), /* 학번 */
	reg_date DATE DEFAULT sysdate, /* 발급일 */
	is_print CHAR(1) DEFAULT 'N', /* 출력여부 */
	cert_name VARCHAR2(20) /* 증명서이름 */
);

ALTER TABLE certification
	ADD
		CONSTRAINT PK_certification
		PRIMARY KEY (
			no
		);

/* 채팅메시지 */
CREATE TABLE chatmessage (
	NO NUMBER NOT NULL, /* 번호 */
	ROOM_ID VARCHAR2(100), /* 채팅방아이디 */
	WRITER_ID VARCHAR2(100), /* 관계자번호 */
	WRITER_NAME VARCHAR2(30), /* 작성자이름 */
	MESSAGE VARCHAR2(2000), /* 메세지 */
	REG_DATE DATE, /* 등록일 */
	TYPE VARCHAR(20) /* 타입 */
);

ALTER TABLE chatmessage
	ADD
		CONSTRAINT PK_chatmessage
		PRIMARY KEY (
			NO
		);

/* 채팅방 */
CREATE TABLE chatroom (
	ROOM_ID VARCHAR2(100) NOT NULL, /* 채팅방아이디 */
	NAME VARCHAR2(50), /* 채팅방명 */
	OFFICIAL_NO VARCHAR2(50), /* 관계자번호 */
	REG_DATE DATE /* 등록일 */
);

ALTER TABLE chatroom
	ADD
		CONSTRAINT PK_chatroom
		PRIMARY KEY (
			ROOM_ID
		);

/* 강의실 */
CREATE TABLE classroom (
	classroom_code VARCHAR2(20) NOT NULL, /* 강의실코드 */
	classroom_name VARCHAR2(30) NOT NULL, /* 강의실명 */
	building_code VARCHAR2(30) NOT NULL /* 건물코드 */
);

ALTER TABLE classroom
	ADD
		CONSTRAINT PK_classroom
		PRIMARY KEY (
			classroom_code
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

/* 과제 등록 */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	assign_name VARCHAR2(100), /* 과제명 */
	reg_date DATE DEFAULT sysdate /* 등록일 */
);

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT PK_distribute_assign
		PRIMARY KEY (
			assign_no
		);

/* 부서 */
CREATE TABLE emp_depart (
	dep_code VARCHAR2(50) NOT NULL, /* 부서코드 */
	dep_name VARCHAR2(100) NOT NULL /* 부서명 */
);

ALTER TABLE emp_depart
	ADD
		CONSTRAINT PK_emp_depart
		PRIMARY KEY (
			dep_code
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

/* 임직원 */
CREATE TABLE employee (
	emp_no VARCHAR2(100) NOT NULL, /* 임직원번호 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	start_date DATE DEFAULT sysdate, /* 입사일 */
	dep_code VARCHAR2(50), /* 부서코드 */
	position_code VARCHAR2(50), /* 직책코드 */
	auth_code VARCHAR2(50), /* 권한코드 */
	emp_name VARCHAR2(50) NOT NULL, /* 임직원명 */
	resignation_date DATE, /* 퇴사일 */
	Identity_state CHAR(1) DEFAULT 'N' /* 본인인증상태 */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			emp_no
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

/* 파일 */
CREATE TABLE files (
	no NUMBER NOT NULL, /* 고유번호 */
	post_no NUMBER, /* 게시글번호 */
	file_name VARCHAR2(100), /* 파일명 */
	file_size NUMBER, /* 파일크기 */
	original_file_name VARCHAR2(100), /* 원본파일명 */
	down_count NUMBER DEFAULT 0, /* 다운로드수 */
	upfile_date DATE DEFAULT sysdate /* 업로드 날짜 */
);

ALTER TABLE files
	ADD
		CONSTRAINT PK_files
		PRIMARY KEY (
			no
		);

/* 하단정보 */
CREATE TABLE footer (
	company_name VARCHAR2(100), /* 회사명 */
	tel VARCHAR2(100), /* 전화번호 */
	zipcode VARCHAR2(100), /* 우편번호 */
	address1 VARCHAR2(100), /* 주소1 */
	address2 VARCHAR2(100), /* 주소2 */
	policy CLOB, /* 개인정보처리방침 */
	start_year VARCHAR2(100) /* 설립연도 */
);

/* 쪽지 수신함 */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* 번호 */
	msg_no NUMBER NOT NULL, /* 족지번호 */
	official_no VARCHAR2(100) NOT NULL, /* 수신인번호 */
	read_date DATE, /* 읽은날짜 */
	keep_flag CHAR(1) DEFAULT 'N' /* 보관여부 */
);

ALTER TABLE inbox
	ADD
		CONSTRAINT PK_inbox
		PRIMARY KEY (
			no
		);

/* 관계자 상세정보 */
CREATE TABLE official_info (
	official_no VARCHAR2(100) NOT NULL, /* 관계자 번호 */
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
	image_url VARCHAR2(150) DEFAULT 'default.jpg' /* 사진 */
);

ALTER TABLE official_info
	ADD
		CONSTRAINT PK_official_info
		PRIMARY KEY (
			official_no
		);

/* 개설교과과정 */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	subj_code VARCHAR2(30) NOT NULL, /* 과목코드 */
	open_date DATE DEFAULT sysdate, /* 개설일자 */
	close_date DATE, /* 폐지일자 */
	prof_no VARCHAR2(100) NOT NULL /* 교수번호 */
);

ALTER TABLE open_subj
	ADD
		CONSTRAINT PK_open_subj
		PRIMARY KEY (
			open_sub_code
		);

/* 쪽지 발신함 */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* 족지번호 */
	official_no VARCHAR2(100) NOT NULL, /* 발신인번호 */
	contents CLOB, /* 내용 */
	send_date DATE DEFAULT sysdate, /* 발송일 */
	official_name VARCHAR2(20), /* 발신인명 */
	del_flag CHAR(1) DEFAULT 'N' /* 삭제여부 */
);

ALTER TABLE outbox
	ADD
		CONSTRAINT PK_outbox
		PRIMARY KEY (
			msg_no
		);

/* 게시글 */
CREATE TABLE posts (
	post_no NUMBER NOT NULL, /* 게시글번호 */
	official_no VARCHAR2(150), /* 관계자번호 */
	title VARCHAR2(150), /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE DEFAULT sysdate, /* 등록일 */
	read_count NUMBER DEFAULT 0, /* 조회수 */
	del_flag CHAR(1) DEFAULT 'N', /* 삭제여부 */
	group_no NUMBER, /* 원본글번호 */
	sort_no NUMBER, /* 정렬번호 */
	step NUMBER, /* 차수 */
	bd_code VARCHAR2(10), /* 게시판코드 */
	edit_date DATE DEFAULT sysdate, /* 수정일 */
	is_private CHAR(1) DEFAULT 'N' /* 비밀글여부 */
);

ALTER TABLE posts
	ADD
		CONSTRAINT posts
		PRIMARY KEY (
			post_no
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

/* 교수 */
CREATE TABLE professor (
	prof_no VARCHAR2(100) NOT NULL, /* 교수번호 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	prof_name VARCHAR2(50) NOT NULL, /* 교수명 */
	dep_no NUMBER, /* 학과번호 */
	position_no NUMBER NOT NULL, /* 직책번호 */
	start_date DATE DEFAULT sysdate, /* 임용일 */
	resignation_date DATE, /* 퇴직일 */
	identity_state CHAR(1) DEFAULT 'N', /* 본인인증상태 */
	identity_code VARCHAR2(20), /* 본인인증코드 */
	change_date DATE /* 비밀번호변경일 */
);

ALTER TABLE professor
	ADD
		CONSTRAINT professor
		PRIMARY KEY (
			prof_no
		);

/* 요약시간표 */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(10), /* 개설교과과목코드 */
	short_name VARCHAR2(50) /* 요약명 */
);

/* 수강신청 */
CREATE TABLE registration (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	reg_date DATE DEFAULT sysdate, /* 수강신청일자 */
	score NUMBER, /* 성적 */
	lecture_eval_flag CHAR(1) DEFAULT 'N' /* 강의평가완료여부 */
);

ALTER TABLE registration
	ADD
		CONSTRAINT PK_registration
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 댓글 */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	reg_date DATE DEFAULT sysdate, /* 등록일 */
	contents CLOB, /* 내용 */
	del_flag CHAR(1) DEFAULT 'N', /* 삭제여부 */
	post_no NUMBER, /* 게시글번호 */
	official_name VARCHAR2(20) /* 관계자이름 */
);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);

/* 대댓글 */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* 대댓글번호 */
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	official_no VARCHAR2(100) NOT NULL, /* 관계자번호 */
	reg_date DATE DEFAULT sysdate, /* 등록일 */
	contents CLOB, /* 내용 */
	del_flag CHAR(1) DEFAULT 'N', /* 삭제여부 */
	official_name <지정 되지 않음> /* 관계자이름 */
);

ALTER TABLE rereply
	ADD
		CONSTRAINT PK_rereply
		PRIMARY KEY (
			rereply_no
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

/* 학부생 */
CREATE TABLE student (
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	pwd VARCHAR2(150) NOT NULL, /* 비밀번호 */
	name VARCHAR2(50) NOT NULL, /* 성명 */
	major NUMBER, /* 전공 */
	semester NUMBER DEFAULT 1, /* 학기 */
	credits NUMBER DEFAULT 0, /* 이수학점 */
	state VARCHAR2(100) DEFAULT '신입생', /* 학적상태번호 */
	admission_date DATE DEFAULT sysdate, /* 입학일 */
	graduation_date DATE, /* 졸업일 */
	identity_state CHAR(1) DEFAULT 'N', /* 본인인증상태 */
	minor NUMBER, /* 부전공 */
	identity_code VARCHAR2(20), /* 본인인증코드 */
	change_date DATE /* 비밀번호변경일 */
);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			stu_no
		);

/* 학적상태 */
CREATE TABLE student_state (
	state VARCHAR2(100) NOT NULL, /* 학적상태번호 */
	state_name VARCHAR2(100) /* 학적상태이름 */
);

ALTER TABLE student_state
	ADD
		CONSTRAINT PK_student_state
		PRIMARY KEY (
			state
		);

/* 강의평가 */
CREATE TABLE subj_eval (
	sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	classification VARCHAR2(30) NOT NULL, /* 수강구분 */
	q1 NUMBER, /* 문항1 */
	q2 NUMBER, /* 문항2 */
	q3 NUMBER, /* 문항3 */
	q4 NUMBER, /* 문항4 */
	q5 NUMBER, /* 문항5 */
	q6 NUMBER, /* 문항6 */
	q7 NUMBER, /* 문항7 */
	q8 NUMBER, /* 문항8 */
	content CLOB /* 평가내용 */
);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT PK_subj_eval
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 강의시간표 */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* 강의시간표코드 */
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	timetable_code VARCHAR2(10) NOT NULL, /* 시간기준코드 */
	classroom_code VARCHAR2(20) /* 강의실코드 */
);

ALTER TABLE subj_time
	ADD
		CONSTRAINT PK_subj_time
		PRIMARY KEY (
			lecture_time_no
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

/* 과목 */
CREATE TABLE subject (
	subj_code VARCHAR2(30) NOT NULL, /* 과목코드 */
	subj_name VARCHAR2(100) NOT NULL, /* 과목명 */
	explanation CLOB, /* 과목설명 */
	type_code VARCHAR2(30), /* 구분코드 */
	credit NUMBER, /* 이수학점 */
	prof_no VARCHAR2(100), /* 교수번호 */
	PERSONNEL NUMBER NOT NULL /* 인원 */
);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			subj_code
		);

/* 강의계획 */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(10) NOT NULL, /* 개설교과과목코드 */
	syllabus VARCHAR2(100) NOT NULL, /* 강의계획서 */
	theory_time NUMBER, /* 이론시간 */
	training_time NUMBER /* 실습시간 */
);

/* 기본 시간표 */
CREATE TABLE timetable (
	timetable_code VARCHAR2(10) NOT NULL, /* 시간기준코드 */
	timetable_name VARCHAR2(50) NOT NULL, /* 표시교시명 */
	day VARCHAR2(10) NOT NULL, /* 요일 */
	period NUMBER NOT NULL, /* 교시 */
	short_name VARCHAR2(20) NOT NULL /* 요약교시명 */
);

ALTER TABLE timetable
	ADD
		CONSTRAINT PK_timetable
		PRIMARY KEY (
			timetable_code
		);

/* 등록금 */
CREATE TABLE tuition (
	no NUMBER NOT NULL, /* 번호 */
	stu_no VARCHAR2(100) NOT NULL, /* 학번 */
	semester NUMBER, /* 학기 */
	tuition NUMBER, /* 수강료 */
	deposit_state CHAR(1) DEFAULT 'N', /* 납부여부 */
	deposit_date DATE /* 납부일 */
);

ALTER TABLE tuition
	ADD
		CONSTRAINT PK_tuition
		PRIMARY KEY (
			no
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

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_distribute_assign_TO_assignment
		FOREIGN KEY (
			assign_no
		)
		REFERENCES distribute_assign (
			assign_no
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_student_TO_assignment
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

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			category_code
		)
		REFERENCES category (
			category_code
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_authority_
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE certification
	ADD
		CONSTRAINT FK_student_
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE chatmessage
	ADD
		CONSTRAINT FK_chatroom_
		FOREIGN KEY (
			ROOM_ID
		)
		REFERENCES chatroom (
			ROOM_ID
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

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT FK_open_subj_TO_distribute_assign
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
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

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_position_
		FOREIGN KEY (
			position_code
		)
		REFERENCES emp_position (
			position_code
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

ALTER TABLE files
	ADD
		CONSTRAINT FK_posts_
		FOREIGN KEY (
			post_no
		)
		REFERENCES posts (
			post_no
		);

ALTER TABLE inbox
	ADD
		CONSTRAINT FK_outbox_TO_inbox
		FOREIGN KEY (
			msg_no
		)
		REFERENCES outbox (
			msg_no
		);

ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_subject_
		FOREIGN KEY (
			subj_code
		)
		REFERENCES subject (
			subj_code
		);

ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_professor_
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE posts
	ADD
		CONSTRAINT FK_board_TO_posts
		FOREIGN KEY (
			bd_code
		)
		REFERENCES board (
			bd_code
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

ALTER TABLE regi_timetable
	ADD
		CONSTRAINT FK_open_subj_4
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_open_subj_
		FOREIGN KEY (
			sub_code
		)
		REFERENCES open_subj (
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

ALTER TABLE reply
	ADD
		CONSTRAINT FK_posts_TO_reply
		FOREIGN KEY (
			post_no
		)
		REFERENCES posts (
			post_no
		);

ALTER TABLE rereply
	ADD
		CONSTRAINT FK_reply_
		FOREIGN KEY (
			reply_no
		)
		REFERENCES reply (
			reply_no
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

ALTER TABLE student
	ADD
		CONSTRAINT FK_student_state_TO_student
		FOREIGN KEY (
			state
		)
		REFERENCES student_state (
			state
		);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT FK_registration_
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

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_timetable_
		FOREIGN KEY (
			timetable_code
		)
		REFERENCES timetable (
			timetable_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_open_subj_2
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_classroom_
		FOREIGN KEY (
			classroom_code
		)
		REFERENCES classroom (
			classroom_code
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

ALTER TABLE syllabus
	ADD
		CONSTRAINT FK_open_subj_3
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
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

/* 시퀀스 생성 */

/*
board 	bd_no
prof_position 	position_no
reply 	reply_no
tuition	no
scholarship	scholarship_no
award	no
outbox	msg_no
inbox	no
files	no

*/
/*board*/
CREATE SEQUENCE board_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

CREATE SEQUENCE reply_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*inbox*/
CREATE SEQUENCE inbox_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*outbox*/
CREATE SEQUENCE outbox_seq
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

/*prof_position*/
CREATE SEQUENCE prof_position_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*files*/
CREATE SEQUENCE files_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*posts*/
CREATE SEQUENCE posts_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*employee*/
CREATE SEQUENCE employee_seq
INCREMENT BY 1
START WITH 1
NOCACHE;

/*professor*/
CREATE SEQUENCE PROFESSOR_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

/*student*/
CREATE SEQUENCE STUDENT_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

/*뷰 생성*/
/*board_view*/
create or replace view board_view as
select p.*, f.no, f.file_name, f.file_size, f.original_file_name, f.down_count, f.upfile_date
from posts p join files f
on p.post_code = f.post_code;

/*student_view*/
CREATE OR REPLACE VIEW
STUDENT_VIEW
AS 
(SELECT S.*,O.*,st.state_name FROM
STUDENT S JOIN OFFICIAL_INFO O 
ON S.STU_NO = O.OFFICIAL_NO
JOIN 
(
SELECT D.*,F.FACULTY_NAME FROM 
DEPARTMENT D JOIN FACULTY F
ON F.FACULTY_NO = D.FACULTY_NO
)A 
ON S.MAJOR = A.DEP_NO
join student_state st
on s.state=st.state);

/*professor_view*/
CREATE OR REPLACE VIEW 
PROFESSOR_VIEW
AS(

SELECT p.*,o.*,a.dep_name,A.FACULTY_NAME,A.FACULTY_NO,bb.*,pp.position_name FROM
professor P JOIN OFFICIAL_INFO O 
ON P.PROF_NO = O.OFFICIAL_NO
JOIN 
(
SELECT D.*,F.FACULTY_NAME FROM 
DEPARTMENT D JOIN FACULTY F
ON F.FACULTY_NO = D.FACULTY_NO
)A 
ON P.DEP_NO = A.DEP_NO
JOIN
(SELECT AI.OFFICIAL_NO AS "DUPPROFNO",AI.BANK_CODE,AI.ACCOUNT_NO,AI.ACCOUNT_NAME,B.BANK_NAME FROM ACCOUNT_INFO AI JOIN BANK B
ON AI.BANK_CODE = B.BANK_CODE
)BB
ON O.OFFICIAL_NO = BB.DUPPROFNO
join 
(select * from prof_position)pp
on pp.POSITION_NO = P.POSITION_NO
);