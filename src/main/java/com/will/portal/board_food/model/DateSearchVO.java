package com.will.portal.board_food.model;

public class DateSearchVO extends SearchVO{
	private String startDay;  //시작일
	private String endDay; //종료일
	private String customerId; //고객 아이디
	
	private String year;
	private String month;
	
	//getter/setter
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", customerId=" + customerId + ", year="
				+ year + ", month=" + month + ", toString()=" + super.toString() + "]";
	}
}
