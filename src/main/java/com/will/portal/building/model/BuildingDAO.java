package com.will.portal.building.model;

import java.util.List;

import com.will.portal.account_info.model.Account_infoVO;

public interface BuildingDAO {
	List<BuildingVO> selectAllBuilding();
}
