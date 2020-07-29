package com.will.portal.posts.model;

import java.util.List;

import com.will.portal.board.model.BoardSearchVO;


public interface PostsService {
	PostsAllVO SelectByCode(String postCode);
	List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo);
	int selectPostsCount(BoardSearchVO bdSearchVo);
}
