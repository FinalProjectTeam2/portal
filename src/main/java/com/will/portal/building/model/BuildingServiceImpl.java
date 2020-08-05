package com.will.portal.building.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BuildingServiceImpl implements BuildingService{
	@Autowired
	private BuildingDAO buildingDao;

	@Override
	public List<BuildingVO> selectAllBuilding() {
		return buildingDao.selectAllBuilding();
	}

}
