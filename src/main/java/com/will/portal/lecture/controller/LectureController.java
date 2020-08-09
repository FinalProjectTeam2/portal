package com.will.portal.lecture.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.security.Principal;
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
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.http.HttpResponse;
import com.will.portal.common.MemberDetails;
import com.will.portal.evaluation.model.EvaluationAllVO;
import com.will.portal.evaluation.model.EvaluationService;
import com.will.portal.professor.model.ProfessorService;
import com.will.portal.regi_timetable.model.Regi_timetableVO;
import com.will.portal.subj_time.model.Subj_timeVO;
import com.will.portal.subject.model.SubjectAllVO;

@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	@Autowired
	private ProfessorService profService;
	@Autowired
	private EvaluationService evaluationServ;
	
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
	public String addSubject(@RequestParam String subject, @RequestParam String time, 
			@RequestParam String classroom, HttpSession session, Model model) {
		logger.info("입력한 과목 처리 페이지 파라미터 subject={}, time={}", subject, time);
		logger.info("추가 파라미터 classroom={}", classroom);
		//교수번호 session에서 확인
		String profNo = (String)session.getAttribute("officialNo");
		String openSubCode = subject.substring(4);
		String timetableCode = time;
		Subj_timeVO vo = new Subj_timeVO();
		vo.setOpenSubCode(openSubCode);
		vo.setClassroomCode(classroom);
		vo.setTimetableCode(time);
		
		Regi_timetableVO rVo = new Regi_timetableVO();
		rVo.setOpenSubCode(openSubCode);
		rVo.setShortNames(profService.selectShortName(timetableCode));
		
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
		//학생list
		List<EvaluationAllVO> list = evaluationServ.selectAllListforEval(subCode);
		logger.info("학생평가 페이지 list.size()={}, selectList.size={}", list.size(), sList.size());
		model.addAttribute("list", list);
		model.addAttribute("sList", sList);
		
		
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
	public void downloadScore(HttpServletResponse response, @RequestParam String subjCode, Model model) {
		
		logger.info("엑셀 다운처리 페이지 파라미터 subjCode={}", subjCode);
		String fileName = "test";
		
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
           
    	   os = new FileOutputStream("D:\\"+fileName+".xls");
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
		
	}
	
	
}
