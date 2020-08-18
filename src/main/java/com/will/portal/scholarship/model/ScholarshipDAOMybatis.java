package com.will.portal.scholarship.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.SearchVO;

@Repository
public class ScholarshipDAOMybatis implements ScholarshipDAO {
	private String namespace = "config.mybatis.mapper.oracle.scholarship.";
	
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public List<ScholarshipAllVO> selectAllScholarship(String officicalNo) {
		return sqlSession.selectList(namespace+"selectAllScholarship", officicalNo);
	}

	@Override
	public int insertscholarship(ScholarshipAllVO vo) {
		return sqlSession.insert(namespace+"insertscholarship", vo);
	}

	@Override
	public int updatescholarship(ScholarshipAllVO vo) {
		return sqlSession.update(namespace+"insertscholarship", vo);
	}

	@Override
	public List<ScholarshipAllVO> selectAll(SearchVO searchVo) {
		return  sqlSession.selectList(namespace+"selectAll", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public ScholarshipAllVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int deleteScholarship(int no) {
		return sqlSession.delete(namespace+"deleteScholarship", no);
	}

	
}
