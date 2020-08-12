package com.will.portal.board.model;

import java.util.List;

import com.will.portal.posts.model.PostsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BoardMainVO {
	private String bdCode;
	private String bdName;
	private List<PostsVO> postsList;
}
