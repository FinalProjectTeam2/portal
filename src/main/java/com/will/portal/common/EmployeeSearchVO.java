package com.will.portal.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class EmployeeSearchVO extends SearchVO {

	private String empName;
	private String depCode;
	private String positionCode;
	private String authCode1;
	private String authCode2;
	private String authCode3;
	private String startNo;
	private String endNo;
}