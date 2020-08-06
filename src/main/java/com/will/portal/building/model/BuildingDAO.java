package com.will.portal.building.model;

import java.util.List;

public interface BuildingDAO {
	List<BuildingVO> selectAllBuilding();
	List<BuildingVO> selectDong(String dong);
	List<BuildingVO> selectBuildingName();
	
}
