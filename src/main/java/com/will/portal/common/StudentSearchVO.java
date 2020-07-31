package com.will.portal.common;

public class StudentSearchVO extends SearchVO{

	private String stuNo;	//학부
	private String name;	//이름
	private int facultyNo;	//학부
	private int major;		//학과
	//private String STATE;	//상태(재학, 휴학, 졸업)
	//private String startNo	//범위 시작학번
	//private String endNo		//범위 끝 학번
	
	public StudentSearchVO(String stuNo, String name, int facultyNo, int major) {
		super();
		this.stuNo = stuNo;
		this.name = name;
		this.facultyNo = facultyNo;
		this.major = major;
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
	@Override
	public String toString() {
		return "StudentSearchVO [stuNo=" + stuNo + ", name=" + name + ", facultyNo=" + facultyNo + ", major=" + major
				+ "]";
	}
	
	
	
}