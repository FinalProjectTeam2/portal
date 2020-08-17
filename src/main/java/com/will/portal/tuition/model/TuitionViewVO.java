package com.will.portal.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class TuitionViewVO {
	private String stuNo; // 학번
	private Timestamp depositDate; // 납부일
	private String bankName; // 은행명
	private String accountNo; // 계좌번호
	private int total; // 총액
	private String depositState; // 납부여부
}
