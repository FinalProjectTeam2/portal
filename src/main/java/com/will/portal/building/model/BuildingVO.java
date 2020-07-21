package com.will.portal.building.model;

public class BuildingVO {
	private String buildingCode;
	private String buildingName;
	private String detail;
	private String tel;
	public String getBuildingCode() {
		return buildingCode;
	}
	public void setBuildingCode(String buildingCode) {
		this.buildingCode = buildingCode;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "BuildingVO [buildingCode=" + buildingCode + ", buildingName=" + buildingName + ", detail=" + detail
				+ ", tel=" + tel + "]";
	}
	
	
}
