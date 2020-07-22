package com.will.portal.subj_type.model;

public class Subj_typeVO {
	private String typeCode;
	private String type;
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Subj_typeVO [typeCode=" + typeCode + ", type=" + type + "]";
	}
	
	
}
