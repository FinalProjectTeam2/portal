package com.will.portal.tuition.model;

import java.util.List;
import java.util.Map;

public class TuitionStuVO {
	private String faculty_name; // 학부명 - faculty 테이블
	private String dep_name; // 학과명 - department 테이블
	private String stu_no; // 학번 - student 테이블
	private int semester; // 학기 - student 테이블
	private String name; // 이름  - student 테이블
	private String bank_name; // 은행명 - bank 테이블
	private String account_no; // 계좌번호 - account_info 테이블
	
	private TuitionVO tuitionVo; // 등록금 테이블
	private List<Map<String, Object>> tuitionD;
	
	public TuitionStuVO(String faculty_name, String dep_name, String stu_no, int semester, String name,
			String bank_name, String account_no, TuitionVO tuitionVo, List<Map<String, Object>> tuitionD) {
		super();
		this.faculty_name = faculty_name;
		this.dep_name = dep_name;
		this.stu_no = stu_no;
		this.semester = semester;
		this.name = name;
		this.bank_name = bank_name;
		this.account_no = account_no;
		this.tuitionVo = tuitionVo;
		this.tuitionD = tuitionD;
	}

	public String getFaculty_name() {
		return faculty_name;
	}

	public void setFaculty_name(String faculty_name) {
		this.faculty_name = faculty_name;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getStu_no() {
		return stu_no;
	}

	public void setStu_no(String stu_no) {
		this.stu_no = stu_no;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public TuitionVO getTuitionVo() {
		return tuitionVo;
	}

	public void setTuitionVo(TuitionVO tuitionVo) {
		this.tuitionVo = tuitionVo;
	}

	public List<Map<String, Object>> getTuitionD() {
		return tuitionD;
	}

	public void setTuitionD(List<Map<String, Object>> tuitionD) {
		this.tuitionD = tuitionD;
	}

	@Override
	public String toString() {
		return "TuitionStuVO [faculty_name=" + faculty_name + ", dep_name=" + dep_name + ", stu_no=" + stu_no
				+ ", semester=" + semester + ", name=" + name + ", bank_name=" + bank_name + ", account_no="
				+ account_no + ", tuitionVo=" + tuitionVo + ", tuitionD=" + tuitionD + "]";
	}
}
