package com.will.portal.posts.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.will.portal.board.model.BoardMainVO;
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
	public int insertComment(PostsVO vo) {
		return postsDao.insertComment(vo);
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

	@Override
	public int upReadCount(int postNo) {
		return postsDao.upReadCount(postNo);
	}

	@Override
	public String selectBdCodeByPostNo(int postNo) {
		return postsDao.selectBdCodeByPostNo(postNo);
	}

	@Override
	public int deletePostByPostNo(Map<String, String> map) {
		return postsDao.deletePostByPostNo(map);
	}

	@Override
	public int updatePost(PostsVO vo) {
		return postsDao.updatePost(vo);
	}

	@Override
	public PostsVO selectPostByPostNo(int postNo) {
		return postsDao.selectPostByPostNo(postNo);
	}

	@Override
	public List<PostsVO> selectByBdcode(String bdCode) {
		return postsDao.selectByBdcode(bdCode);
	}

	@Override
	public List<BoardMainVO> selectBdcodeBycategory(String categoryCode) {
		return postsDao.selectBdcodeBycategory(categoryCode);
	}

	@Override
	public List<PostsVO> selectPostsPrev(PostsVO vo) {
		return postsDao.selectPostsPrev(vo);
	}
	@Override
	public List<PostsVO> selectPostsNext(PostsVO vo) {
		return postsDao.selectPostsNext(vo);
	}
	
	
}
