package com.will.portal.board.model;

import com.will.portal.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BoardSearchVO extends SearchVO{
	private String bdCode;
	private String sort;
}
