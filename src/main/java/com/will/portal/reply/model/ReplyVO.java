package com.will.portal.reply.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReplyVO {
	private int replyNo;
	private String officialNo;
	private Timestamp regDate;
	private String contents;
	private int groupNo;
	private int sortNo;
	private String delFlag;
	private String postCode;
	
}
