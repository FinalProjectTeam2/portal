package com.will.portal.message.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class InboxVO {
	private int no;
	private int msgNo;
	private String officialNo;
	private Timestamp readDate;
	private String keepFlag;
}
