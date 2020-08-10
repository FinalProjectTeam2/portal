package com.will.portal.bookmark.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BookmarkVO {
	private int no;
	private String officialNo;
	private String name;
	private String url;
}
