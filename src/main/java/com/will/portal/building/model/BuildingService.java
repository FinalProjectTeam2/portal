package com.will.portal.building.model;

import java.util.List;

public interface BuildingService {
	public List<BuildingVO> selectAllBuilding();
	public List<BuildingVO> selectDong(String dong);
	public List<BuildingVO> selectBuildingName();
}
