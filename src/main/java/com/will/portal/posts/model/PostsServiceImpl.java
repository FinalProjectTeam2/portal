package com.will.portal.posts.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.board.model.BoardSearchVO;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired
	private PostsDAO postsDao;

	@Override
	public PostsAllVO SelectByCode(String postCode) {
		return postsDao.SelectByCode(postCode);
	}

	@Override
	public List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo) {
		return postsDao.selectPostsList(bdSearchVo);
	}

	@Override
	public int selectPostsCount(BoardSearchVO bdSearchVo) {
		return postsDao.selectPostsCount(bdSearchVo);
	}
	
	
}
