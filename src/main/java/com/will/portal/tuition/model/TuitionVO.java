package com.will.portal.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter @Setter @ToString
public class TuitionVO {
	private int no;  /* 번호  pk*/
	private String stu_no;  /* 학번 */
	private int semester; /* 학기 */
	private int	tuition; /* 등록금액 */	
	private int admissionfee; /* 입학금 */
	private int practicecost; /* 실습비 */
	private int studentfee; /* 학생회비 */
	private int total; /*총금액 */
	private String	depositState; /* 납부여부 */
	private Timestamp depositDate; /* 납부일 */
}  