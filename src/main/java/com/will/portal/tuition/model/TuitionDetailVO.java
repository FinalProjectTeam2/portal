package com.will.portal.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class TuitionDetailVO {
	private int no; // 번호
	private String stuNo; // 학번
	private int admissionfee; // 입학금
	private int tuition; // 등록금
	private int practicecost; // 실습비
	private int studentfee; // 학생회비
	private int scholarship; // 장학금
	private int reduction; // 감면액
	private int total; // 총액
	private int semester; // 학기
	private Timestamp datepaid; // 납부한 날짜
	private String	depositState; // 납부여부
}