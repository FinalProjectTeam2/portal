package com.will.portal.reply.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReplyAllVO {
	private ReplyVO replyVo;
	private List<RereplyVO> rereplyList;
}
