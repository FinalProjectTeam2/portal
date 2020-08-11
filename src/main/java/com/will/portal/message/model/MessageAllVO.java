package com.will.portal.message.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MessageAllVO {
	private int msgNo;
	private String officialNo;
	private String contents;
	private Timestamp sendDate;
	private String officialName;
	private int no;
	private String inOffi;
	private Timestamp readDate;
}
