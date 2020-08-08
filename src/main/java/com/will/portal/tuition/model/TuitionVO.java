package com.will.portal.tuition.model;

import java.sql.Timestamp;

public class TuitionVO {
	private int no;  /* 번호  pk*/
	private String stu_no;  /* 학번 */
	private int semester; /* 학기 */
	private int	tuition; /* 등록금액 */	
	private int admissionfee; /* 입학금 */
	private int practicecost; /* 실습비 */
	private int studentfee; /* 학생회비 */
	private int total; /*총금액 */
	private String	deposit_state; /* 납부여부 */
	private Timestamp deposit_date; /* 납부일 */
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getTuition() {
		return tuition;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public int getAdmissionfee() {
		return admissionfee;
	}
	public void setAdmissionfee(int admissionfee) {
		this.admissionfee = admissionfee;
	}
	public int getPracticecost() {
		return practicecost;
	}
	public void setPracticecost(int practicecost) {
		this.practicecost = practicecost;
	}
	public int getStudentfee() {
		return studentfee;
	}
	public void setStudentfee(int studentfee) {
		this.studentfee = studentfee;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getDeposit_state() {
		return deposit_state;
	}
	public void setDeposit_state(String deposit_state) {
		this.deposit_state = deposit_state;
	}
	public Timestamp getDeposit_date() {
		return deposit_date;
	}
	public void setDeposit_date(Timestamp deposit_date) {
		this.deposit_date = deposit_date;
	}
	
	@Override
	public String toString() {
		return "TuitionVO [no=" + no + ", stu_no=" + stu_no + ", semester=" + semester + ", tuition=" + tuition
				+ ", admissionfee=" + admissionfee + ", practicecost=" + practicecost + ", studentfee=" + studentfee
				+ ", total=" + total + ", deposit_state=" + deposit_state + ", deposit_date=" + deposit_date + "]";
	}
}  
	
	