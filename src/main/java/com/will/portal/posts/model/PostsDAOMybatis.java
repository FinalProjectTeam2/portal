package com.will.portal.posts.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.board.model.BoardSearchVO;

@Repository
public class PostsDAOMybatis implements PostsDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.posts.";

	@Override
	public List<PostsVO> selectPostsList(BoardSearchVO bdSearchVo) {
		return sqlSession.selectList(namespace + "selectPostsList", bdSearchVo);
	}

	@Override
	public int selectPostsCount(BoardSearchVO bdSearchVo) {
		return sqlSession.selectOne(namespace + "selectPostsCount", bdSearchVo);
	}

	@Override
	public int insertPosts(PostsVO vo) {
		return sqlSession.insert(namespace+"insertPosts", vo);
	}

	@Override
	public PostsAllVO SelectByCodeE(int postNo) {
		return sqlSession.selectOne(namespace+"SelectByCodeE", postNo);
	}

	@Override
	public PostsAllVO SelectByCodeS(int postNo) {
		return sqlSession.selectOne(namespace+"SelectByCodeS", postNo);
	}
	
	@Override
	public PostsAllVO SelectByCodeP(int postNo) {
		return sqlSession.selectOne(namespace+"SelectByCodeP", postNo);
	}

	@Override
	public int upReadCount(int postNo) {
		return sqlSession.update(namespace+"upReadCount", postNo);
	}

	@Override
	public String selectBdCodeByPostNo(int postNo) {
		return sqlSession.selectOne(namespace+"selectBdCodeByPostNo", postNo);
	}

	@Override
	public int deletePostByPostNo(int postNo) {
		return sqlSession.delete(namespace+"deletePostByPostNo", postNo);
	}

	@Override
	public int updatePost(PostsVO vo) {
		return sqlSession.update(namespace+"updatePost", vo);
	}
}
