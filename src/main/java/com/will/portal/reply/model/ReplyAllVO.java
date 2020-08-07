package com.will.portal.reply.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter 
public class ReplyAllVO {
	private ReplyVO replyVo;
	private List<RereplyVO> rereplyList;
	@Override
	public String toString() {
		return "ReplyAllVO [replyVo=" + replyVo + ", rereplyList=" + rereplyList + "]";
	}
	
	
}
