package com.will.portal.board.model;

import com.will.portal.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardSearchVO extends SearchVO {
	private String bdCode;
	private String sort;

	@Override
	public String toString() {
		return "BoardSearchVO [bdCode=" + bdCode + ", sort=" + sort + ", toString()=" + super.toString() + "]";
	}

}
