package com.will.portal.posts.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PostsVO {
	private int postNo;
	private String officialNo;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int readCount;
	private String delFlag;
	private String bdCode;
	private int groupNo;
	private int sortNo;
	private int step;
	private Timestamp editDate;
	private String isPrivate;

	private int newImgTerm;
	private int fileCount;
	private String name;
	private int reCount;

	
}
