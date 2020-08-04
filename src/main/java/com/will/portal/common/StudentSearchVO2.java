package com.will.portal.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class StudentSearchVO2 extends SearchVO {

	private String stuNo2; // 학부
	private String name2; // 이름
	private int facultyNo2; // 학부
	private int major2; // 학과
	private String state12; // 상태(재학, 휴학, 졸업)
	private String state22; // 상태(재학, 휴학, 졸업)
	private String state32; // 상태(재학, 휴학, 졸업)
	private String state42; // 상태(재학, 휴학, 졸업)
	private String state52; // 상태(재학, 휴학, 졸업)
	private String state62; // 상태(재학, 휴학, 졸업)
	private String startNo2; // 범위 시작학번
	private String endNo2; // 범위 끝 학번
}