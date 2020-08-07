package com.will.portal.posts.model;

import java.util.List;

import com.will.portal.board.model.BoardVO;
import com.will.portal.files.model.FilesVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PostsAllVO {

	// type 변수
	public static final int STUDENT = 1;
	public static final int PROFESSOR = 2;
	public static final int EMPLOYEE = 3;
	
	private PostsVO postsVo;
	private String userName;
	private int type;
	private List<FilesVO> fileList;
	private BoardVO boardVo;

}
