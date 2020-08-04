package com.will.portal.common;

public class StudentSearchVO extends SearchVO {

	private String stuNo; // 학부
	private String name; // 이름
	private int facultyNo; // 학부
	private int major; // 학과
	private String state1; // 상태(재학, 휴학, 졸업)
	private String state2; // 상태(재학, 휴학, 졸업)
	private String state3; // 상태(재학, 휴학, 졸업)
	private String state4; // 상태(재학, 휴학, 졸업)
	private String state5; // 상태(재학, 휴학, 졸업)
	private String state6; // 상태(재학, 휴학, 졸업)
	private String startNo; // 범위 시작학번
	private String endNo; // 범위 끝 학번

	

	public StudentSearchVO(String stuNo, String name, int facultyNo, int major, String state1, String state2,
			String state3, String state4, String state5, String state6, String startNo, String endNo) {
		super();
		this.stuNo = stuNo;
		this.name = name;
		this.facultyNo = facultyNo;
		this.major = major;
		this.state1 = state1;
		this.state2 = state2;
		this.state3 = state3;
		this.state4 = state4;
		this.state5 = state5;
		this.state6 = state6;
		this.startNo = startNo;
		this.endNo = endNo;
	}

	public String getState1() {
		return state1;
	}

	public void setState1(String state1) {
		this.state1 = state1;
	}

	public String getState2() {
		return state2;
	}

	public void setState2(String state2) {
		this.state2 = state2;
	}

	public String getState3() {
		return state3;
	}

	public void setState3(String state3) {
		this.state3 = state3;
	}

	public String getState4() {
		return state4;
	}

	public void setState4(String state4) {
		this.state4 = state4;
	}

	public String getState5() {
		return state5;
	}

	public void setState5(String state5) {
		this.state5 = state5;
	}

	public StudentSearchVO() {
		super();
	}

	public String getStuNo() {
		return stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFacultyNo() {
		return facultyNo;
	}

	public void setFacultyNo(int facultyNo) {
		this.facultyNo = facultyNo;
	}

	public int getMajor() {
		return major;
	}

	public void setMajor(int major) {
		this.major = major;
	}

	public String getStartNo() {
		return startNo;
	}

	public void setStartNo(String startNo) {
		this.startNo = startNo;
	}

	public String getState6() {
		return state6;
	}

	public void setState6(String state6) {
		this.state6 = state6;
	}

	public String getEndNo() {
		return endNo;
	}

	public void setEndNo(String endNo) {
		this.endNo = endNo;
	}

	@Override
	public String toString() {
		return "StudentSearchVO [stuNo=" + stuNo + ", name=" + name + ", facultyNo=" + facultyNo + ", major=" + major
				+ ", state1=" + state1 + ", state2=" + state2 + ", state3=" + state3 + ", state4=" + state4
				+ ", state5=" + state5 + ", state6=" + state6 + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}
}