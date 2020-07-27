package com.will.portal.board.model;

import com.will.portal.common.SearchVO;

public class BoardSearchVO extends SearchVO{
	private String bdCode;

	public String getBdCode() {
		return bdCode;
	}

	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
	}

	@Override
	public String toString() {
		return "BoardSerchVO [bdCode=" + bdCode + ", toString()=" + super.toString() + "]";
	}
}
