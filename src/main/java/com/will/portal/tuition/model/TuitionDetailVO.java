package com.will.portal.tuition.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class TuitionDetailVO {
	private String stuNo; // 학번
	private int admissionfee; // 입학금
	private int tuition; // 등록금
	private int practicecost; // 실습비
	private int studentfee; // 학생회비
	private int scholarship; // 장학금
	private int reduction; // 감면액
	private int total; // 총액	
}
