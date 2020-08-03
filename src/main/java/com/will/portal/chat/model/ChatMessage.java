package com.will.portal.chat.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ChatMessage {
	private int no;
    private String roomId;
    private String writerId;
    private String writerName;
    private String message;
    private String type;
    private Timestamp regDate;
}