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

	@Override
	public List<BuildingVO> selectDong(String dong) {
		return buildingDao.selectDong(dong);
	}

	@Override
	public List<BuildingVO> selectBuildingName() {
		return buildingDao.selectBuildingName();
	}

}
