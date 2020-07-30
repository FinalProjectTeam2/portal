package com.will.portal.tuition.model;


public class TuitionStuVO {
	private String faculty_name; // 학부명
	private String dep_name; // 학과명
	private String stu_no; // 학번
	private int semester; // 학기
	private String name; // 이름
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
	@Override
	public String toString() {
		return "TuitionStuVO [faculty_name=" + faculty_name + ", dep_name=" + dep_name + ", stu_no=" + stu_no
				+ ", semester=" + semester + ", name=" + name + "]";
	}
	
	
}
