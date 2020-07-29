package com.will.portal.posts.model;

import java.util.List;

import com.will.portal.board.model.BoardSearchVO;

public interface PostsService {
	List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo);
	int selectPostsCount(BoardSearchVO bdSearchVo);
	int insertPosts(PostsVO vo);
	PostsAllVO SelectByCodeE(int postNo);
	PostsAllVO SelectByCodeS(int postNo);
	PostsAllVO SelectByCodeP(int postNo);
}
