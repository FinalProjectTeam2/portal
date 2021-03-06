package com.will.portal.building.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BuildingDAOMybatis implements BuildingDAO {
	private String namespace = "config.mybatis.mapper.oracle.building.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BuildingVO> selectAllBuilding() {
		return sqlSession.selectList(namespace + "selectAllBuilding");
	}

	@Override
	public List<BuildingVO> selectDong(String dong) {
		return sqlSession.selectList(namespace + "selectDong", dong);
	}

	@Override
	public List<BuildingVO> selectBuildingName() {
		return sqlSession.selectList(namespace + "selectBuildingName");
	}

	
	
}
