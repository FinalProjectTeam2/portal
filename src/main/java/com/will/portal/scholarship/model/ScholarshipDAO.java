package com.will.portal.scholarship.model;

import java.util.List;
import com.will.portal.common.SearchVO;

public interface ScholarshipDAO {
	List<ScholarshipAllVO> selectAllScholarship(String officicalNo);
	
	int selectByNo(int no);
	int insertscholarship(ScholarshipAllVO vo);
	int updatescholarship(ScholarshipAllVO vo);
	int deleteScholarship(String officicalNo);
	
	public List<ScholarshipAllVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
}
