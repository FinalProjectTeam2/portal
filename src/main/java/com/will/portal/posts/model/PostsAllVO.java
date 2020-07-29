package com.will.portal.posts.model;

import java.util.List;

import com.will.portal.files.model.FilesVO;

public class PostsAllVO {

	// type 변수
	private static final int STUDENT = 1;
	private static final int PROFESSOR = 2;
	private static final int EMPLOYEE = 3;
	
	private PostsVO postsVo;
	private String userName;
	private int type;
	private List<FilesVO> fileList;

	public PostsVO getPostsVo() {
		return postsVo;
	}

	public void setPostsVo(PostsVO postsVo) {
		this.postsVo = postsVo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<FilesVO> getFileList() {
		return fileList;
	}

	public void setFileList(List<FilesVO> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "PostsAllVO [postsVo=" + postsVo + ", userName=" + userName + ", type=" + type + ", fileList=" + fileList
				+ "]";
	}

}
