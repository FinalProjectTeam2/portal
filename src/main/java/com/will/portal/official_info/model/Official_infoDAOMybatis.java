package com.will.portal.official_info.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;
import com.will.portal.test.model.ForPwdVO;

@Repository
public class Official_infoDAOMybatis implements Official_infoDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.member.";
	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";
	
	
	@Override
	public Official_infoVO selectByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectOfficialByNo", officialNo);
	}

	@Override
	public int insertOfficial(Official_infoVO officialVo) {
		return sqlSession.insert(namespaceAdmin+"insertOfficial",officialVo);
	}

	@Override
	public int countStuByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"countStuByNo", officialNo);
	}

	@Override
	public int countProfByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"countProfByNo", officialNo);
	}

	@Override
	public StudentVO selectStuByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectStuByNo", officialNo);
	}

	@Override
	public ProfessorVO selectProfByNo(String officialNo) {
		return sqlSession.selectOne(namespace+"selectProfByNo", officialNo);
	}

	@Override
	public int updateCode(StudentVO vo) {
		return sqlSession.update(namespace+"updateCode", vo);
	}

	@Override
	public String selectCode(String stuNo) {
		return sqlSession.selectOne(namespace+"selectCode", stuNo);
	}

	@Override
	public int updateIdentState(String stuNo) {
		return sqlSession.update(namespace+"updateIdentState", stuNo);
	}

	@Override
	public int findPwd(ForPwdVO vo) {
		return sqlSession.selectOne(namespace + "findPwd",vo);
	}

	@Override
	public int updateAnyPwd(ForPwdVO vo) {
		return sqlSession.update(namespace +"updateAnyPwd",vo);
	}

	@Override
	public String selectSsn(String officialNo) {
		return sqlSession.selectOne(namespace+"selectSsn", officialNo);
	}

	@Override
	public int updateCodeP(ProfessorVO vo) {
		return sqlSession.update(namespace + "updateCodeP", vo);
	}

	@Override
	public String selectCodeP(String profNo) {
		return sqlSession.selectOne(namespace + "selectCodeP", profNo);
	}

	@Override
	public int updateIdentStateP(String profNo) {
		return sqlSession.update(namespace+"updateIdentStateP", profNo);
	}
	
	public int updateOfficialInfo(Official_infoVO offiVo) {
		return sqlSession.update(namespace +"updateOfficialInfo", offiVo);
	}

	@Override
	public int updateChangeDate(String profNo) {
		return sqlSession.update(namespace+"updateChangeDate", profNo);
	}
	
	
	
	

	
}
