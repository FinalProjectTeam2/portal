package com.will.portal.common;


public class ProfSearchVO extends SearchVO {

	private String profName;
	private String facultyNo;
	private String depNo;
	private String positionNo1;
	private String positionNo2;
	private String positionNo3;
	private String positionNo4;
	private String startNo;
	private String endNo;
	
	
	public ProfSearchVO() {
		super();
	}


	public ProfSearchVO(String profName, String facultyNo, String depNo, String positionNo1, String positionNo2,
			String positionNo3, String positionNo4, String startNo, String endNo) {
		super();
		this.profName = profName;
		this.facultyNo = facultyNo;
		this.depNo = depNo;
		this.positionNo1 = positionNo1;
		this.positionNo2 = positionNo2;
		this.positionNo3 = positionNo3;
		this.positionNo4 = positionNo4;
		this.startNo = startNo;
		this.endNo = endNo;
	}

	

	public String getProfName() {
		return profName;
	}


	public void setProfName(String profName) {
		this.profName = profName;
	}


	public String getFacultyNo() {
		return facultyNo;
	}


	public void setFacultyNo(String facultyNo) {
		this.facultyNo = facultyNo;
	}


	public String getDepNo() {
		return depNo;
	}


	public void setDepNo(String depNo) {
		this.depNo = depNo;
	}


	public String getPositionNo1() {
		return positionNo1;
	}


	public void setPositionNo1(String positionNo1) {
		this.positionNo1 = positionNo1;
	}


	public String getPositionNo2() {
		return positionNo2;
	}


	public void setPositionNo2(String positionNo2) {
		this.positionNo2 = positionNo2;
	}


	public String getPositionNo3() {
		return positionNo3;
	}


	public void setPositionNo3(String positionNo3) {
		this.positionNo3 = positionNo3;
	}


	public String getPositionNo4() {
		return positionNo4;
	}


	public void setPositionNo4(String positionNo4) {
		this.positionNo4 = positionNo4;
	}


	public String getStartNo() {
		return startNo;
	}


	public void setStartNo(String startNo) {
		this.startNo = startNo;
	}


	public String getEndNo() {
		return endNo;
	}


	public void setEndNo(String endNo) {
		this.endNo = endNo;
	}


	@Override
	public String toString() {
		return "ProfSearchVO [profName=" + profName + ", facultyNo=" + facultyNo + ", depNo=" + depNo + ", positionNo1="
				+ positionNo1 + ", positionNo2=" + positionNo2 + ", positionNo3=" + positionNo3 + ", positionNo4="
				+ positionNo4 + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}
	
	
}