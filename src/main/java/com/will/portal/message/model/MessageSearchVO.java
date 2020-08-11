package com.will.portal.message.model;

import com.will.portal.common.SearchVO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MessageSearchVO extends SearchVO{
	private String type;
	private String searchCondition;
	private String searchKeyword;
	private String officialNo;
	
	@Override
	public String toString() {
		return "MessageSearchVO [type=" + type + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", officialNo=" + officialNo + ", toString()=" + super.toString() + "]";
	}
	
	
}
