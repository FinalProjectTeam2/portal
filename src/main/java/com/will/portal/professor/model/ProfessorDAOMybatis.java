package com.will.portal.professor.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;
import com.will.portal.subject.model.SubjectVO;

@Repository
public class ProfessorDAOMybatis implements ProfessorDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;

	private String namespace="config.mybatis.mapper.oracle.professor.";

	private String namespaceAdmin="config.mybatis.mapper.oracle.admin.";

	@Override
	public int insertProfessor(ProfessorVO profVo) {
		return sqlsession.insert(namespaceAdmin+"insertProfessor",profVo);
	}

	public String selectPwd(String profNo) {
		return sqlsession.selectOne(namespace + "selectPwd", profNo);
	}

	public ProfessorVO selectByProfNo(String profNo) {
		return sqlsession.selectOne(namespace + "selectByProfNo", profNo);
	}
	
	public String selectSsn(String officialNo) {
		return sqlsession.selectOne(namespace+"selectSsn", officialNo);
	}

	@Override
	public List<SubjectAllVO> loadByProfNo(String profNo) {
		return sqlsession.selectList(namespace+"loadByProfNo", profNo);
	}

	
	@Override
	public List<Subj_timeVO> timeByCode(List<String> codeList) {
		return sqlsession.selectList(namespace+"timeByCode", codeList);
	}

	@Override
	public List<String> codeByProfNo(String profNo) {
		return sqlsession.selectList(namespace+"codeByProfNo", profNo);
	}

	@Override
	public int insertSubjTime(Subj_timeVO vo) {
		return sqlsession.insert(namespace+"insertSubjTime", vo);
	}

	@Override
	public List<Map<String, Object>> classroomByDepNo(String depNo) {
		return sqlsession.selectList(namespace+"classroomByDepNo", depNo);
	}


	
	
	
	
	
}
