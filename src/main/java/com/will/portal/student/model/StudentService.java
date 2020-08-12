package com.will.portal.student.model;

import java.util.List;
import java.util.Map;

import com.will.portal.common.StudentSearchVO;
import com.will.portal.official_info.model.Official_infoVO;

public interface StudentService {
	//로그인 처리 관련 상수
	int LOGIN_OK=1;
	int PWD_DISAGREE=2;
	int ID_NONE=3;

	public int loginCheck(String officicalNo, String pwd );
	public boolean loginCheck(String loginPwd, String password, String officicalNo );
	public StudentVO selectByStuNo(String stuNo);
	int insertStudent(StudentVO studentVo, Official_infoVO officialVo, int sort);
	Map<String, Object> selectViewByStuNo(String stuNo);
	List<StudentVO> selectStudent();
	List<Map<String, Object>> selectStudentView(StudentSearchVO studentSearchVo);
	int getTotalRecord(StudentSearchVO studentSearchVo);
	int multiUpdateStudentState(List<StudentVO> studentList,String state);
	public int deleteMulti(List<StudentVO> list);
	int deleteStudent(String stuNo);
	public int updateStudent(StudentVO studentVO);
	int updateMajor(StudentVO studentVo);
}
