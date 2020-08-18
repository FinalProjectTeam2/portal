package com.will.portal.professor.model;

import java.util.List;
import java.util.Map;

import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.common.ProfSearchVO;
import com.will.portal.phoneBook.model.PhoneBookVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;

public interface ProfessorDAO {
	int insertProfessor(ProfessorVO profVo);
	public String selectPwd(String profNo);
	public ProfessorVO selectByProfNo(String profNo);
	public String selectSsn(String officialNo);
	List<SubjectAllVO> loadByProfNo(String profNo);
	List<SubjectAllVO> selectUpList(String profNo);
	List<Subj_timeVO> timeByCode(List<String> codeList);
	List<String> codeByProfNo(String profNo);
	int insertSubjTime(Subj_timeVO vo);
	List<Map<String, Object>> classroomByDepNo(String depNo);
	Map<String, Object>selectViewByProfNo(String profNo);

	int countByOpenCode(String openSubCode);
	String selectShortName(String timetableCode);
	int insertTimetable(Regi_timetableVO vo);
	int updateTimetable(Regi_timetableVO vo);
	List<Map<String, Object>> selectProfessorView(ProfSearchVO profSearchVo);
	int getTotalRecord(ProfSearchVO profSearchVo);
	int updatePosition(ProfessorVO professorVo);
	int deleteProfessor(String profNo);
	
	List<PhoneBookVO> phoneBook(String subCode);
	
	int updateProfessor(ProfessorVO profVo);
	
	List<ProfessorVO> selectListByName(String name);
	int classCount(String openSubCode);
	List<Map<String, Object>> loadBySubjCode(String openSubCode);
}
