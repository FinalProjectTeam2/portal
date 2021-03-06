package com.will.portal.posts.model;

import java.util.List;
import java.util.Map;

import com.will.portal.board.model.BoardMainVO;
import com.will.portal.board.model.BoardSearchVO;

public interface PostsDAO {
	List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo);
	int selectPostsCount(BoardSearchVO bdSearchVo);
	int insertPosts(PostsVO vo);
	int insertComment(PostsVO vo);
	PostsAllVO SelectByCodeE(int postNo);
	PostsAllVO SelectByCodeS(int postNo);
	PostsAllVO SelectByCodeP(int postNo);
	int upReadCount(int postNo);
	String selectBdCodeByPostNo(int postNo);
	int deletePostByPostNo(Map<String, String> map);
	int updatePost(PostsVO vo);
	PostsVO selectPostByPostNo(int postNo);
	List<PostsVO> selectByBdcode(String bdCode);
	List<BoardMainVO> selectBdcodeBycategory(String categoryCode);
	List<PostsVO> selectPostsPrev(PostsVO vo);
	List<PostsVO> selectPostsNext(PostsVO vo);
}
