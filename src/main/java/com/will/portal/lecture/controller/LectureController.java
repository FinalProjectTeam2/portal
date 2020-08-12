package com.will.portal.lecture.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.will.portal.common.ExcelRead;
import com.will.portal.common.ExcelReadOption;
import com.will.portal.common.MemberDetails;
import com.will.portal.evaluation.model.EvaluationAllVO;
import com.will.portal.evaluation.model.EvaluationService;
import com.will.portal.evaluation.model.EvaluationVO;
import com.will.portal.message.SendMmsMessage;
import com.will.portal.open_subj.model.Open_subjVO;
import com.will.portal.phoneBook.model.PhoneBookVO;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.student.model.StudentVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subj_type.model.Subj_typeVO;
import com.will.portal.subject.model.SubjectAllVO;
import com.will.portal.subject.model.SubjectService;
import com.will.portal.subject.model.SubjectVO;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	@Autowired
	private ProfessorService profService;
	@Autowired
	private EvaluationService evaluationServ;
	@Autowired
	private SubjectService subjectServ;
	
	@RequestMapping("/lecture/openLecture_bak")
	public void openLecture_bak() {
		logger.info("교수 과목 등록 페이지");
	}
	
	@RequestMapping("/lecture/openLecture")
	public String openLecture(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		logger.info("교수 과목 등록 페이지 파라미터 profNo={}", profNo);
		
		String depNo = profNo.substring(5, 8);
		logger.info("교수 과목 확인 처리 페이지 profNo={}, depNo={}", profNo, depNo);
		
		List<SubjectAllVO> list = profService.loadByProfNo(profNo);
		
		
		List<Map<String, Object>> classList = profService.classroomByDepNo(depNo);
		
		logger.info("list.size={}, classList.size={}", list.size(), classList.size());
		
		
		
		
		
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("cList", classList);
		
		
		return "/lecture/openLecture";
	}
	
	@RequestMapping(value = "/lecture/addSubject", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addSubject(Principal principal ,@RequestParam String subject, @RequestParam String time, 
			@RequestParam String classroom, HttpSession session, Model model) {
		logger.info("입력한 과목 처리 페이지 파라미터 subject={}, time={}", subject, time);
		logger.info("추가 파라미터 classroom={}", classroom);
		//교수번호 session에서 확인
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		
		String openSubCode = subject.substring(4);
		String timetableCode = time;
		Subj_timeVO vo = new Subj_timeVO();
		vo.setOpenSubCode(openSubCode);
		vo.setClassroomCode(classroom);
		vo.setTimetableCode(time);
		
		Regi_timetableVO rVo = new Regi_timetableVO();
		rVo.setOpenSubCode(openSubCode);
		rVo.setShortNames(profService.selectShortName(time));
		
		int codeCount = profService.countByOpenCode(openSubCode);
		logger.info("해당 코드에 등록된 수 codeCount={}", codeCount);
		
		int regiCount = 0;
		
		if(codeCount == 0) {
			//등록이 되지 않았을경우 insert
			regiCount=profService.insertTimetable(rVo);
			logger.info("insert 결과 regiCount={}", regiCount);
		}else {
			//이미 등록된경우 update
			regiCount=profService.updateTimetable(rVo);
			logger.info("update 결과 regiCount={}", regiCount);
		}
		
		
		
		int cnt = profService.insertSubjTime(vo);
		String message="";
		if(cnt>0)	message="해당 시간에 입력되었습니다.";
		logger.info("입력 확인 cnt={}", cnt);
		return message;
	}
	
	
	
	
	@RequestMapping("/lecture/timeByProfNo")
	@ResponseBody
	public List<Subj_timeVO> timeByProfNo(@RequestParam String profNo){
		logger.info("교수 시간표 읽은 후  리턴 페이지 파라미터 profNo={}", profNo);
		
		List<Subj_timeVO> timeList = profService.timeByProfNo(profNo); 
		logger.info("시간표 읽어옴 list.size={}", timeList.size());
		
		return timeList;
	}
	
	
	@RequestMapping("/lecture/updateTable")
	@ResponseBody
	public List<SubjectAllVO> updateTable(Principal principal){
		logger.info("입력 후 테이블 업데이트");
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		List<SubjectAllVO> tList = profService.loadByProfNo(profNo);
		return tList;
		
	}
	
	@RequestMapping(value = "/lecture/professorView", method = RequestMethod.GET)
	public String profView(Principal principal, @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//select option에 들어갈 list
		List<Map<String, Object>> sList = evaluationServ.subjectByProfNo(profNo);
		Map<String, Object> map = sList.get(0);
		String openSubCode = (String)map.get("OPEN_SUB_CODE");
		
		logger.info("openSubCode={}", openSubCode);
		//학생list
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(openSubCode);
		logger.info("학생평가 페이지 list.size()={}, selectList.size={}", list.size(), sList.size());
		model.addAttribute("list", list);
		model.addAttribute("sList", sList);
		model.addAttribute("openSubCode", openSubCode);
		
		
		return "lecture/professorView";
	}
	
	
	@RequestMapping(value = "/lecture/evaluation", method = RequestMethod.POST)
	@ResponseBody
	public List<EvaluationAllVO> profView_post(Principal principal, @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//학생list
		
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(subCode);
		
		logger.info("학생평가 페이지 list.size()={}, 매개변수 subCode={}", list.size(), subCode);
		
		
		
		return list;
	}
	
	
	@RequestMapping(value = "/lecture/downloadScore", produces="text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String downloadScore(Principal principal, HttpServletResponse response, @RequestParam String subjCode, 
			@RequestParam String subjName, Model model) {
		
		logger.info("엑셀 다운처리 페이지 파라미터 subjCode={}, subjName={}", subjCode, subjName);
		
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		
		
		String fileName = profNo+"-"+subjName;
		String filePath = "d:\\"+fileName+".xls";
		
		
		//excel 파일 틀 설
		XSSFWorkbook xlsWb = new XSSFWorkbook(); //xlsx 엑셀 2007 이상
		//HSSFWorkbook xlsWb = new HSSFWorkbook(); //xls 엑셀 97~03
	
		
		//시트 생성 및 시트명 설정 - 매개변수를 비우면 default 형태로 입력된다.
		Sheet sheet1 = xlsWb.createSheet("성적표"); //시트명 설정
		
		//엑셀 가운데, 중앙 정렬 - 4.10 버전 기준
		CellStyle cellStyle = xlsWb.createCellStyle();
		cellStyle.setAlignment(HorizontalAlignment.CENTER); //가운데 정렬
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER); //중앙 정렬
		
		Row headerRow = null;
		Cell headerCell = null;
		
		headerRow = sheet1.createRow(0); //0행 열을 생성 후
		headerCell = headerRow.createCell(0); //0열 셀을 생성
		headerCell.setCellValue("수강신청 코드"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(1); //0열 셀을 생성
		headerCell.setCellValue("학번"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(2); //0열 셀을 생성
		headerCell.setCellValue("이름"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(3); //0열 셀을 생성
		headerCell.setCellValue("수강구분"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(4); //0열 셀을 생성
		headerCell.setCellValue("중간고사"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(5); //0열 셀을 생성
		headerCell.setCellValue("기말고사"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(6); //0열 셀을 생성
		headerCell.setCellValue("과제"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
	
		headerCell = headerRow.createCell(7); //0열 셀을 생성
		headerCell.setCellValue("출석"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(8); //0열 셀을 생성
		headerCell.setCellValue("기타"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		headerCell = headerRow.createCell(9); //0열 셀을 생성
		headerCell.setCellValue("총점"); //엑셀 셀에 데이터 삽입 > 0행 0열에 "데이터"라는 문자열이 삽입된다.
		headerCell.setCellStyle(cellStyle); //위에서 만들어놓은 셀 스타일 적용
		
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(subjCode);
		int rowCnt = 1;
		for(EvaluationAllVO vo : list) {
			//스타일 적용 및 셀 데이터 삽입
			Row row = null;
			Cell cell = null;

			row = sheet1.createRow(rowCnt); //0행 열을 생성 후
			
			cell = row.createCell(0); //0열 셀을 생성
			cell.setCellValue(vo.getSubCode()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(1); //1열 셀을 생성
			cell.setCellValue(vo.getStuNo()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(2); //2열 셀을 생성
			cell.setCellValue(vo.getName()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(3); //3열 셀을 생성
			cell.setCellValue(vo.getClassification()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(4); //4열 셀을 생성
			cell.setCellValue(vo.getMidterm()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(5); //5열 셀을 생성
			cell.setCellValue(vo.getFinals()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(6); //6열 셀을 생성
			cell.setCellValue(vo.getAssignment()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(7); //7열 셀을 생성
			cell.setCellValue(vo.getAttendance()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(8); //8열 셀을 생성
			cell.setCellValue(vo.getEtc()); //
			cell.setCellStyle(cellStyle); //
			
			cell = row.createCell(9); //9열 셀을 생성
			cell.setCellValue(vo.getTotalGrade()); //
			cell.setCellStyle(cellStyle); //
			
			
			
			
			rowCnt++;
		}
		
		/*
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
		 */
		OutputStream os = null;
		
		 response.reset();
         response.setHeader("Content-Disposition", "attachment;filename=stbcs_history.xls");
         response.setContentType("application/vnd.ms-excel;charset=utf-8");
       
       try {
    	   //xlsWb = (SXSSFWorkbook)model.get("workbook");
           
    	   os = new FileOutputStream(filePath);
    	   //os = response.getOutputStream();
           
           
           // 파일생성
           //workbook.write(os);
           xlsWb.write(os);
           os.flush();
       }catch (Exception e) {
           e.printStackTrace();
       } finally {
           if(xlsWb != null) {
               try {
                   xlsWb.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
           }
           
           if(os != null) {
               try {
                   os.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
           }
       }
       
       return filePath;
	}
	
	
	@RequestMapping("/lecture/createLecture")
	public void createLecture(Principal principal, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		logger.info("교수 수업등록 페이지 교수번호 profNo={}", profNo);
		
		List<Subj_typeVO> list = subjectServ.selectType();
		logger.info("list.size={}", list.size());
		model.addAttribute("list", list);
		
		
	}
	
	@RequestMapping(value = "/lecture/insertSubject", produces="text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String insertSubject(Principal principal, @ModelAttribute SubjectVO vo, Model model) {
		logger.info("수업등록 처리 페이지 vo={}", vo);
		String seq=Integer.toString(subjectServ.subjectSeq());
		//subject_seq에서 받아온 값으로 3자리가 안될경우 0으로 채운다
		if(seq.length() == 1) {
			seq = "00"+seq;
		}else if(seq.length() == 2) {
			seq = "0"+seq;
		}
		String result = "강의 등록 실패";
		
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		String typeCode = vo.getTypeCode()+"-"+profNo.substring(5, 8)+"-"+seq;
		vo.setProfNo(profNo);
		vo.setSubjCode(typeCode);
		
		//subject에 insert한다
		int cnt = subjectServ.insertSubject(vo);
		
		//opensubj역시 insert한다
		Open_subjVO oVo = new Open_subjVO();
		oVo.setOpenSubCode(typeCode.substring(4));
		oVo.setSubjCode(typeCode);
		oVo.setProfNo(profNo);
		
		cnt = subjectServ.insertOpenSubj(oVo);
		
		if(cnt > 0) {
			result = "강의가 개설되었습니다.";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/lecture/inputScore", produces="text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String inputScore(@RequestParam String subCode, @RequestParam String stuNo, @RequestParam(defaultValue = "0") int midterm, 
			@RequestParam(defaultValue = "0") int finals, @RequestParam(defaultValue = "0") int assignment, 
			@RequestParam(defaultValue = "0") int attendance,@RequestParam(defaultValue = "0") int etc, Model model) {
		
		logger.info("한줄 성적입력 처리 subCode={}, stuNo={}", subCode, stuNo);
		logger.info("한줄 성적입력 처리 midterm={}, finals={}", midterm, finals);
		logger.info("한줄 성적입력 처리 assignment={}, etc={}", assignment, etc);
		
		int total = 0;
		int count = 0;
		
		if(midterm != 0) {
			total+=midterm;
			count++;
		}else if(finals != 0) {
			total+=finals;
			count++;
		}else if(assignment != 0) {
			total+=assignment;
			count++;
		}else if(attendance != 0) {
			total+=attendance;
			count++;
		}else if(etc != 0) {
			total+=etc;
			count++;
		}
		String result = "성적입력 실패";
		int totalGrade=0;
		try{
		totalGrade = (int)Math.round((total/count)*10F)/10;
        }catch(ArithmeticException e){
            System.out.println("0으로 나눌 수 없습니다. : " + e.toString());
        }
		
		
		
		
		EvaluationVO vo = new EvaluationVO();
		vo.setSubCode(subCode);
		vo.setStuNo(stuNo);
		vo.setMidterm(midterm);
		vo.setFinals(finals);
		vo.setAssignment(assignment);
		vo.setAttendance(attendance);
		vo.setEtc(etc);
		vo.setTotalGrade(totalGrade);
		
		int cnt = evaluationServ.inputScore(vo);
		
		if(cnt > 0) {
			result="성적이 입력되었습니다.";
		}
		
		return result;
	}
	
	@RequestMapping(value = "/lecture/phoneBook", method = RequestMethod.GET)
	public String phoneBook(Principal principal,  @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//select option에 들어갈 list
		List<Map<String, Object>> sList = evaluationServ.subjectByProfNo(profNo);
		//학생list
		List<PhoneBookVO> list = profService.phoneBook(subCode);
		logger.info("연락처 페이지 list.size()={}, selectList.size={}", list.size(), sList.size());
		model.addAttribute("list", list);
		model.addAttribute("sList", sList);
		
		
		return "lecture/phoneBook";
	}
	
	@RequestMapping(value = "/lecture/selectPhoneBook", method = RequestMethod.POST)
	@ResponseBody
	public List<PhoneBookVO> phonebook_post(Principal principal, @RequestParam(required = false) String subCode, Model model) {
		MemberDetails user = (MemberDetails)((Authentication)principal).getPrincipal();
		String profNo = user.getOfficialNo();
		//학생list
		
		List<PhoneBookVO> list = profService.phoneBook(subCode);
		
		logger.info("학생평가 페이지 list.size()={}, 매개변수 subCode={}", list.size(), subCode);
		
		return list;
	}
	
	
	
	@RequestMapping(value = "/lecture/inputScoreByExcel", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> inputScoreByExcel(MultipartHttpServletRequest request)throws Exception{
		
		MultipartFile excelFile  = request.getFile("excelFile");
		logger.info("엑셀로 성적 일괄입력");
		
		if(excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택해주세요");
		}
		
		File destFile = new File(excelFile.getOriginalFilename());
		
		try{
			excelFile.transferTo(destFile);
		}catch(IllegalStateException | IOException e){
			throw new RuntimeException(e.getMessage(),e);
		}
		
		
		List<Map<String, Object>> list = excelUpload(destFile);
		
		boolean bool = destFile.delete();
		
		logger.info("file삭제 결과 bool={}", bool);
		return list;
		
	}
	
	public List<Map<String, Object>> excelUpload(File destFile) throws Exception{
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J");
		excelReadOption.setStartRow(2);
		
		
		List<Map<String, Object>> excelContent = ExcelRead.read(excelReadOption);
		
		/**
		 * 원래는 vo로 받아서 처리하려고 했으나 도저히 안되서 그대로 list에 map을 담아서 처리했습니다.
		 * 추후 excel로 한번에 입력할때 참고하세여
		 * 
		 */
		
		
		/*
		List<EvaluationAllVO> list = new ArrayList<EvaluationAllVO>();
		EvaluationAllVO vo = new EvaluationAllVO();
		for(Map<String, Object> map : excelContent) {
			if(map.get("A")!=null) {
				logger.info("A={}, B={}", map.get("A"), map.get("B"));
				logger.info("C={}, D={}", map.get("C"), map.get("D"));
				logger.info("E={}, F={}", map.get("E"), map.get("F"));
				logger.info("G={}, H={}", map.get("G"), map.get("H"));
				logger.info("I={}, J={}", map.get("I"), map.get("J"));
				vo.setSubCode((String)map.get("A"));
				vo.setStuNo((String)map.get("B"));
				vo.setName((String)map.get("C"));
				vo.setClassification((String)map.get("D"));
				if(map.get("E")==null) {
					vo.setMidterm(0);
				}else {
					vo.setMidterm(Integer.valueOf((String)map.get("E")));
				}
				if(map.get("F")==null) {
					vo.setFinals(0);
				}else {
					vo.setFinals(Integer.valueOf((String)map.get("F")));
				}
				if(map.get("G")==null) {
					vo.setAssignment(0);
				}else {
					vo.setAssignment(Integer.valueOf((String)map.get("G")));
				}
				if(map.get("H")==null) {
					vo.setAttendance(0);
				}else {
					vo.setAttendance(Integer.valueOf((String)map.get("H")));
				}
				if(map.get("I")==null) {
					vo.setEtc(0);
				}else {
					vo.setEtc(Integer.valueOf((String)map.get("I")));
				}
				if(map.get("J")==null) {
					vo.setTotalGrade(0);
				}else {
					vo.setTotalGrade(Integer.valueOf((String)map.get("J")));
				}
			
				list.add(vo);
			
		}
		
		logger.info("list.size()={}", list.size());}*/
		
		
		return excelContent;
	}
	
	@RequestMapping(value = "/lecture/updateAllScore", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateAllScore(@RequestParam(value = "tdArr[]") List<String> arrList, Model model) {
		logger.info("list.size()={}", arrList.size());
		List<EvaluationVO> list = new ArrayList<EvaluationVO>();
		String result = "성적입력 실패";
		for(int i = 0; i < arrList.size(); i++) {
			
			EvaluationVO vo = new EvaluationVO();
			logger.info("\narrList.get({})={}",i,arrList.get(i));
			String[] arr= arrList.get(i).split(",");
			
			vo.setSubCode(arr[0]);
			vo.setStuNo(arr[1]);
			vo.setClassification(arr[2]);
			vo.setMidterm(Integer.parseInt(arr[3]));
			vo.setFinals(Integer.parseInt(arr[4]));
			vo.setAssignment(Integer.parseInt(arr[5]));
			vo.setAttendance(Integer.parseInt(arr[6]));
			vo.setEtc(Integer.parseInt(arr[7]));
			vo.setTotalGrade(Integer.parseInt(arr[8]));
			
			list.add(vo);
			
		}
		
		int cnt = evaluationServ.updateAllScore(list);
		
		if(cnt > 0) {
			result="성적입력 성공";
		}
		
		
		return result;
		
	}
	
	@RequestMapping(value = "/lecture/sendSms", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendSms(@RequestParam(value = "pbArr[]") List<String> pbList, @RequestParam String content) {
		
		String userid = "fe5882";           // [필수] 뿌리오 아이디
		String callback = "01038225882";    // [필수] 발신번호 - 숫자만
		
		String phone = "";       // [필수] 수신번호 - 여러명일 경우 |로 구분 "010********|010********|010********"
		for(int i=0; i<pbList.size();i++) {
			if(i==pbList.size()-1) {
				phone+=pbList.get(i);
			}else {
				phone+=pbList.get(i)+"|";
			}
		}
		
		
			
		String msg = content;   // [필수] 문자내용 - 이름(names)값이 있다면 [*이름*]가 치환되서 발송됨
		String names = "";            // [선택] 이름 - 여러명일 경우 |로 구분 "홍길동|이순신|김철수"
		String appdate = "";  // [선택] 예약발송 (현재시간 기준 10분이후 예약가능)
		String subject = "";          // [선택] 제목 (30byte)
		String file1Path = "";    // [선택]  포토발송 (jpg, jpeg만 지원  300 K  이하)
		
		logger.info("문자메세지 발송 전화번호개수  list.size={}, 문자메세지 내용={}", pbList.size(), content);
		String result ="";
		try {
			
		    SendMmsMessage sendMmsMessage = new SendMmsMessage();

		    // filePath가 null 혹은 blank("")인 경우 일반 단/장문 발송. 
			String response_str = sendMmsMessage.send( userid,  callback,  phone,  msg, names, appdate, subject, file1Path );
			
			
			//response 
			System.out.println("=============================");
			System.out.println(response_str);
			System.out.println("=============================");
			
			String str = response_str.substring(0, 6);
			if(str.equals("ok|sms")) {
				result = "문자메세지 발송 성공";
			}else {
				result = "문자메세지 발송 실패";
			}
			
			logger.info("문자메세지 발송 상태 result={}", result);
			
			
							 

		
		/*	"invalid_member"               - 연동서비스 신청이 안 됐거나 없는 아이디
		    "under_maintenance"            - 요청시간에 서버점검중인 경우
		    "allow_https_only"             - http 요청인 경우
		    "invalid_ip"                   - 등록된 접속가능 IP가 아닌 경우
		    "invalid_msg"                  - 문자내용에 오류가 있는 경우
		    "invalid_names"                - 이름에 오류가 있는 경우
		    "invalid_subject"              - 제목에 오류가 있는 경우
		    "invalid_sendtime"             - 예약발송 시간에 오류가 있는 경우 (10분이후부터 다음해말까지 가능)
		    "invalid_sendtime_maintenance" - 예약발송 시간에 서버점검 예정인 경우
		    "invalid_phone"                - 수신번호에 오류가 있는 경우
		    "invalid_msg_over_max"         - 문자내용이 너무 긴 경우
		    "invalid_callback"             - 발신번호에 오류가 있는 경우
		    "once_limit_over"              - 1회 최대 발송건수 초과한 경우
		    "daily_limit_over"             - 1일 최대 발송건수 초과한 경우
		    "not_enough_point"             - 잔액이 부족한 경우
		    "over_use_limit"               - 한달 사용금액을 초과한 경우
		    "server_error"                 - 기타 서버 오류 */
			
		} catch (IOException localIOException) {
		    System.out.println(localIOException.toString());
		} catch (Exception ex ){
			ex.printStackTrace();
		}
		
		return result;
		
	}
	
}
