--��å
insert into emp_position
values('1','����');
insert into emp_position
values('2','����');
insert into emp_position
values('3','���');

--�μ�
insert into emp_depart
values('1','����ó');
insert into emp_depart
values('2','��ȹó');
insert into emp_depart
values('3','�л�ó');
insert into emp_depart
values('4','����ȫ��ó');
insert into emp_depart
values('5','�繫ó');

select * from authority;
--����
INSERT INTO authority VALUES ('ADMIN','������', 'manager',1, SYSDATE);
INSERT INTO authority VALUES ('ASSISTANT','�ΰ�����', 'assistant manager',2, SYSDATE);
INSERT INTO authority VALUES ('STAFF','������', 'staff',3, SYSDATE);

--DROP TABLE "EMPLOYEE" CASCADE CONSTRAINTS;
CREATE TABLE employee (
   emp_no VARCHAR2(100) NOT NULL, /* ��������ȣ */
   pwd VARCHAR2(150) NOT NULL, /* ��й�ȣ */
   start_date DATE DEFAULT sysdate, /* �Ի��� */
   dep_code VARCHAR2(50), /* �μ��ڵ� */
   auth_code VARCHAR2(50), /* �����ڵ� */
   emp_name VARCHAR2(50) NOT NULL, /* �������� */
   resignation_date DATE, /* ����� */
   Identity_state CHAR(5) DEFAULT 'N', /* ������������ */
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

