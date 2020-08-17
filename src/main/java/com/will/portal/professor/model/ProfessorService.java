package com.will.portal.professor.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.ProfSearchVO;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.phoneBook.model.PhoneBookVO;
import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;

public interface ProfessorService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;

	public int loginCheck(String officicalNo, String pwd);
	public boolean loginCheckSec(String loginPwd, String password, String officicalNo);
	public ProfessorVO selectByProfNo(String profNo);
	int insertProfessor(ProfessorVO profVo, Official_infoVO officialVo, int sort);
	List<SubjectAllVO> loadByProfNo(String profNo);
	List<Subj_timeVO> timeByProfNo(String profNo);
	int insertSubjTime(Subj_timeVO vo);
	List<Map<String, Object>> classroomByDepNo(String depNo);
	public Map<String, Object> selectViewByProfNo(String profNo);

	int countByOpenCode(String openSubCode);
	String selectShortName(String timetableCode);
	int insertTimetable(Regi_timetableVO vo);
	int updateTimetable(Regi_timetableVO vo);
	List<Map<String, Object>> selectProfessorView(ProfSearchVO profSearchVo);
	int getTotalRecord(ProfSearchVO profSearchVo);
	int mutiUpdatePosition(List<ProfessorVO> list,int positionNo);
	int deleteProfessor(String profNo);
	int multiDelete(List<ProfessorVO> list);
	List<PhoneBookVO> phoneBook(String subCode);
	
	public int updateProfessor(ProfessorVO profVo);

	List<ProfessorVO> selectListByName(String name);
}
