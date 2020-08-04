package com.will.portal.posts.model;

import java.util.List;

import com.will.portal.board.model.BoardSearchVO;

public interface PostsDAO {
	List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo);
	int selectPostsCount(BoardSearchVO bdSearchVo);
	int insertPosts(PostsVO vo);
	PostsAllVO SelectByCodeE(int postNo);
	PostsAllVO SelectByCodeS(int postNo);
	PostsAllVO SelectByCodeP(int postNo);
	int upReadCount(int postNo);
	String selectBdCodeByPostNo(int postNo);
	int deletePostByPostNo(int postNo);
	int updatePost(PostsVO vo);
}
