package com.will.portal.tuition.model;

import com.will.portal.account_info.model.Account_infoVO;
import com.will.portal.bank.model.BankVO;
import com.will.portal.department.model.DepartmentVO;
import com.will.portal.faculty.model.FacultyVO;
import com.will.portal.student.model.StudentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter @Setter @ToString
public class TuitionStuVO {
	private TuitionVO tuitionVo; // 등록금 테이블
	private FacultyVO facultyVo; // 학부 faculty 테이블 - 학부명 가져오기
	private DepartmentVO departmentVo; // 학과 department 테이블 - 학과명 가져오기
	private StudentVO studentVo; // 학번 student 테이블 - 학번, 학기, 이름 가져오기
	private BankVO bankVo; // 은행 bank 테이블 - 은행명 가져오기
	private Account_infoVO accountVo; // 계좌번호 account 테이블 - 계좌번호 가져오기	
}