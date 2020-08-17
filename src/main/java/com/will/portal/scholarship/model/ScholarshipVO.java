package com.will.portal.scholarship.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ScholarshipVO {
	private int  scholarshipNo; // 장학금 번호  pk
	private String scholarshipType; // 장학금 종류
	private int scholarship; // 장학금 금액 
	private String scholarshipName; // 장학금명
	
}
