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
	public List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo) {
		return postsDao.selectPostsList(bdSearchVo);
	}

	@Override
	public int selectPostsCount(BoardSearchVO bdSearchVo) {
		return postsDao.selectPostsCount(bdSearchVo);
	}

	@Override
	public int insertPosts(PostsVO vo) {
		return postsDao.insertPosts(vo);
	}

	@Override
	public PostsAllVO SelectByCodeE(int postNo) {
		return postsDao.SelectByCodeE(postNo);
	}

	@Override
	public PostsAllVO SelectByCodeS(int postNo) {
		return postsDao.SelectByCodeS(postNo);
	}

	@Override
	public PostsAllVO SelectByCodeP(int postNo) {
		return postsDao.SelectByCodeP(postNo);
	}
	
	
}
