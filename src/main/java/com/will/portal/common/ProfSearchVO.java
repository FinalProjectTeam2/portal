package com.will.portal.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ProfSearchVO extends SearchVO {

	private String profName;
	private String facultyNo;
	private String depNo;
	private String positionNo1;
	private String positionNo2;
	private String positionNo3;
	private String positionNo4;
	private String positionNo5;
	private String startNo;
	private String endNo;
}