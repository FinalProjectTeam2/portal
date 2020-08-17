package com.will.portal.scholarship.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ScholarshipAllVO {
	private int no; // 번호
	private String stuNo; // 학번
	private int scholarshipNo; // 장학금 번호 
	private	Timestamp awardingDate; //수여일
	private String aymentOrNot; //지급여부
	private Timestamp approvalDate; // 승인날짜
	private String approval; // 승인여부
	private String scholarshipType; // 장학금 종류
	private int scholarship; // 장학금 금액 
	private String scholarshipName; // 장학금명
	
}
