package com.will.portal.tuition.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter @Setter @ToString
public class TuitionStuVO {
	private String facultyName; // 학부
	private String depName; // 학과
	private String stuNo; // 학번
	private String name; // 이름
	private int semester; // 학기
}