/* ��ϱ� ���̺� */
/* ù��° ���̺� (�л���������) : �к�, �а�, �й�, �̸�, �б� - �кλ� ���̺�, �к� ���̺�, �а� ���̺� */ 
/* �ι�° ���̺� (��������) : ��������, ���αⰣ, �������, �����ݾ�, �������� - ���� ���̺�, ���� ���̺� */  
/* ����° ���̺� (����������) : ��ϱ�, ���б�, ������, �ǽ���, �л�ȸ��, �����, ������ ��¥, ���� ��¥, ��������  -��ϱ� ���̺�, ¡�б����̺� */

/* �кλ� student */
--  stu_no VARCHAR2(100) NOT NULL, /* �й� */
--	pwd VARCHAR2(150) NOT NULL, /* ��й�ȣ */
--	name VARCHAR2(50) NOT NULL, /* ���� */
--	major NUMBER, /* ���� */
--	semester NUMBER DEFAULT 1, /* �б� */
--	credits NUMBER DEFAULT 0, /* �̼����� */
--	state VARCHAR2(100) DEFAULT '���Ի�', /* �������� */
--	admission_date DATE DEFAULT sysdate, /* ������ */
--	graduation_date DATE, /* ������ */
--	identity_state CHAR(1) DEFAULT 'N', /* ������������ */
--	minor NUMBER, /* ������ */
--	identify_code VARCHAR2(30) /*�����ڵ�*/


/* �к� faculty */
--  faculty_no NUMBER NOT NULL, /* �кι�ȣ  pk*/
--	faculty_name VARCHAR2(100) NOT NULL /* �к��̸� */


/* �а� department */
--  dep_no NUMBER NOT NULL, /* �а���ȣ pk */
--	dep_name VARCHAR2(100) NOT NULL, /* �а��� */
--	tel VARCHAR2(30), /* ��ȭ��ȣ */
--	building_code VARCHAR2(30), /* �ǹ��ڵ� */
--	faculty_no NUMBER, /* �кι�ȣ */
--	total_credit NUMBER /* �����̼����� */


/* �������� account_info */
--	official_no VARCHAR2(100), /* ������ ��ȣ : �л� stu_no*/
--	bank_code VARCHAR2(20), /* �����ڵ� */
--	account_no VARCHAR2(30), /* ���¹�ȣ */
--	account_name VARCHAR2(50) /* �����ָ� */


/* ���� bank*/
--	bank_code VARCHAR2(20) NOT NULL, /* �����ڵ� pk */
--	bank_name VARCHAR2(50) NOT NULL /* ����� */


/* ��ϱ� tuition */
--	no NUMBER NOT NULL, /* ��ȣ  pk*/
--	stu_no VARCHAR2(100) NOT NULL, /* �й� */
--	semester NUMBER, /* �б� */
--	tuition NUMBER, /* ��ϱݾ� */	
--  admissionfee NUMBER, /* ���б� */
--  practicecost NUMBER,/* �ǽ��� */
--  studentfee NUMBER,/* �л�ȸ�� */
--  reduction NUMBER, /* ����� */
--	deposit_state CHAR(1) DEFAULT 'N', /* ���ο��� */
--	deposit_date DATE, /* ������ */
--	datepaid DATE, /* ������ ��¥ */ 
--	total NUMBER, /* �ѱݾ� */
--	remark clob /* ��� */ 

/* ���б� ���� award */
--	no NUMBER NOT NULL, /* ��ȣ */
--	stu_no VARCHAR2(100) NOT NULL, /* �й� */
--	scholarship_no NUMBER NOT NULL, /* ���б� ��ȣ */
--	awarding_date DATE DEFAULT sysdate /* ������ */


/* ���б� scholarship */
--  scholarship_no NUMBER NOT NULL, /* ���б� ��ȣ  pk*/
--	scholarship_type VARCHAR2(50), /* ���б� ���� */
--	scholarship NUMBER /* ���б� �ݾ� */


/* ��ϱ� ������ */
CREATE SEQUENCE tuition_seq
INCREMENT BY 1
START WITH 1
NOCACHE;



/* insert*/
-- student ���̺�
insert into student(stu_no, pwd, name, major, semester, credits, state, admission_date)  
values('20200029999', 'h1234', 'ȫ�浿', '2', '1', '18', '���Ի�', sysdate);

-- account_info ���̺�
insert into account_info(bank_code, account_no, account_name)
values('004', '111111-01-101010', 'ôô�л�');

-- bank ���̺�
insert into bank
values('004', '��������');

-- tuition ���̺�
insert into tuition(no, stu_no, semester, admissionfee, tuition, practicecost, studentfee, reduction, total, datepaid, deposit_state)
values(tuition_seq.nextval, '20200029999', '1', '0', '1000000000', '300000', '150000', '0', '1450000', sysdate, 'N');



/*�� ����*/
-- student_view2 - �к�, �а�, �й�, �̸�, �б� */
create or replace view student_view2 as
select d.dep_name, f.faculty_name, s.stu_no, s.name, s.semester
from department d join faculty f
on  d.faculty_no = f.faculty_no
join student s
on d.dep_no=s.major;

select * from student_view2;

-- ��ϱ� view
create or replace view tuition_view as
select t.deposit_date, b.bank_name, a.account_no, t.total, t.deposit_state
from bank b join account_info a
on b.bank_code = a.bank_code
join student s
on s.stu_no = a.official_no
join tuition t
on s.stu_no = t.stu_no;

select * from tuition_view;

-- ���бݸ� ��������
create or replace view scholarship_view as
select s.scholarship
from scholarship s join award a 
on s.scholarship_no = a.scholarship_no
join student stu
on stu.stu_no = a.stu_no;

select * from scholarship_view;

-- ��ϱ� �� view
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



