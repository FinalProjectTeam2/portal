package com.will.portal.posts.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.board.model.BoardMainVO;
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
	public int insertComment(PostsVO vo) {
		return sqlSession.insert(namespace+"insertComment", vo);
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
	public int deletePostByPostNo(Map<String, String> map) {
		return sqlSession.delete(namespace+"deletePostByPostNo", map);
	}

	@Override
	public int updatePost(PostsVO vo) {
		return sqlSession.update(namespace+"updatePost", vo);
	}

	@Override
	public PostsVO selectPostByPostNo(int postNo) {
		return sqlSession.selectOne(namespace+"selectPostByPostNo", postNo);
	}

	@Override
	public List<PostsVO> selectByBdcode(String bdCode) {
		return sqlSession.selectList(namespace + "selectByBdcode",bdCode);
	}

	@Override
	public List<BoardMainVO> selectBdcodeBycategory(String categoryCode) {
		return sqlSession.selectList(namespace+"selectBdcodeBycategory",categoryCode);
	}
}
