package com.will.portal.board.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class BoardVO {
	private String bdCode;
	private String officialNo;
	private String bdName;
	private Timestamp regDate;
	private Timestamp editDate;
	private int bdOrder;
	private String usage;
	private String isReply;
	private String isComment;
	private String isPrivate;
	private String isUpload;
	private int maxUpfile;
	private long maxFilesize;
	private String categoryCode;
	private String authCode;
}
