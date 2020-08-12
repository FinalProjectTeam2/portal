package com.will.portal.department.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.will.portal.common.SearchVO;

@Repository
public class DepartmentDAOMybatis implements DepartmentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.department.";
	
	@Override
	public List<DepartmentVO> selectDepartment() {
		return sqlSession.selectList(namespace+"selectDepartment");
	}

	@Override
	public List<DepartmentVO> selectDepartmentByFaculty(int facultyNo) {
		return sqlSession.selectList(namespace+"selectDepartmentByFaculty",facultyNo);
	}

	@Override
	public List<Map<String, Object>> selectDepartmentView(SearchVO searchVo) {
		return sqlSession.selectList(namespace + "selectDepartmentView", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace + "selectTotalRecord", searchVo);
	}
	
}
