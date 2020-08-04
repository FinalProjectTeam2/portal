package com.will.portal.student.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class StudentListVO {
	private List<StudentVO> stuList;

	public List<StudentVO> getStuList() {
		return stuList;
	}

	public void setStuList(List<StudentVO> stuList) {
		this.stuList = stuList;
	}


	
}
