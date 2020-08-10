package com.will.portal.message.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OutboxVO {
	private int msgNo;
	private String officialNo;
	private String contents;
	private Timestamp sendDate;
	private String officialName;
}
