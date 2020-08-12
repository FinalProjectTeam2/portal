package com.will.portal.official_info.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.common.MessageVO;
import com.will.portal.message.SendMmsMessage;
import com.will.portal.official_info.model.Official_infoService;
import com.will.portal.official_info.model.Official_infoVO;
import com.will.portal.professor.model.ProfessorVO;
import com.will.portal.student.model.StudentVO;

@Controller
public class IdentifyController {
	private static final Logger logger = LoggerFactory.getLogger(IdentifyController.class);
	@Autowired
	private Official_infoService infoService;
	/**
	 * 최초 비밀번호 변경
	 * @param officialNo
	 * @param identState
	 */
	@RequestMapping("/member/changePwd")
	public void changePwd(HttpSession session) {
		//추후 세션으로 대체예정 지금은 파라미터로 시험중
		logger.info("최초 비밀번호 변경 화면으로 이동");
		
	}
	
	@RequestMapping(value = "/member/identify", method = RequestMethod.GET)
	public void identify_get(@RequestParam String officialNo, @RequestParam(defaultValue = "N") String identState) {
		logger.info("본인인증 화면 ");
	}
	
	@RequestMapping(value = "/member/sendCode", produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendSms(@RequestParam String officialNo, @RequestParam(defaultValue = "N") String identState) {
		String userid = "fe5882";           // [필수] 뿌리오 아이디
		String callback = "01038225882";    // [필수] 발신번호 - 숫자만
		
		Official_infoVO vo = infoService.selectByNo(officialNo);
		String phone = vo.getHp1()+vo.getHp2()+vo.getHp3();       // [필수] 수신번호 - 여러명일 경우 |로 구분 "010********|010********|010********"
	
		
		
		String code = ""; 
		//6자리 인증코드 만들기
		for(int i = 0; i< 6; i++) {
			code += Integer.toString((int)(Math.random()*10));
		}
		
		String msg = "인증번호는 [" + code + "] 입니다.";   // [필수] 문자내용 - 이름(names)값이 있다면 [*이름*]가 치환되서 발송됨
		String names = "";            // [선택] 이름 - 여러명일 경우 |로 구분 "홍길동|이순신|김철수"
		String appdate = "";  // [선택] 예약발송 (현재시간 기준 10분이후 예약가능)
		String subject = "테스트";          // [선택] 제목 (30byte)
		String file1Path = "";    // [선택]  포토발송 (jpg, jpeg만 지원  300 K  이하)
		
		logger.info("문자메세지 발송 전화번호 ={}, 인증번호={}", phone, code);
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
				result = "인증번호를 발송했습니다.";
				if(officialNo.substring(4, 5).equals("3")) {
					StudentVO sVo = new StudentVO();
					sVo.setStuNo(officialNo);
					sVo.setIdentifyCode(code);
					int cnt = infoService.updateCode(sVo);
					logger.info("인증번호 업데이트 매개변수 학생code={}", sVo.getIdentifyCode());
				}else if(officialNo.substring(4, 5).equals("2")){
					ProfessorVO pVo = new ProfessorVO();
					pVo.setProfNo(officialNo);
					pVo.setIdentifyCode(code);
					int cnt = infoService.updateCodeP(pVo);
				}
			}else {
				result = "인증번호 발송 실패";
			}
			
			logger.info("인증번호 발송 상태 result={}", result);
			
			
							 

		
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
	
	
	@RequestMapping(value = "/member/identify", method = RequestMethod.POST)
	@ResponseBody
	public MessageVO identify_post(@RequestParam String inputCode, @RequestParam String officialNo, 
			@RequestParam(defaultValue = "N") String identState, Model model) {
		String dbCode ="";
		String message="";
		if(officialNo.substring(4, 5).equals("3")) {
			logger.info("인증번호 확인 페이지 파라미터 code={}, 학번={}", inputCode, officialNo);
			dbCode = infoService.selectCode(officialNo);
			message="인증 실패 인증번호를 확인하세요";
			logger.info("파라미터 인증번호={}, db인증번호={}", inputCode, dbCode);
		}else if(officialNo.substring(4, 5).equals("2")) {
			logger.info("인증번호 확인 페이지 파라미터 code={}, 교수번호={}", inputCode, officialNo);
			dbCode = infoService.selectCodeP(officialNo);
			message="인증 실패 인증번호를 확인하세요";
		}
		
		if(inputCode.equals(dbCode)) {
			message="인증 성공 비밀번호 변경 페이지로 이동합니다.";
			identState="Y";
			if(officialNo.substring(4, 5).equals("3")) {
				infoService.updateIdentState(officialNo);
			}else if(officialNo.substring(4, 5).equals("2")) {
				infoService.updateChangeDate(officialNo);
				infoService.updateIdentStateP(officialNo);
			}
		}
		
		MessageVO mVo = new MessageVO();
		mVo.setIdentState(identState);
		mVo.setMessage(message);
		
		
		return mVo;
		
		
	}
	
	@RequestMapping("/member/identSsn")
	@ResponseBody
	public MessageVO identSsn(@RequestParam String officialNo, @RequestParam String ssn1,
				@RequestParam String ssn2, @RequestParam(defaultValue = "N") String identSsn) {
		Official_infoVO vo = infoService.selectByNo(officialNo);
		String ssn = vo.getSsn();
		String dbSsn = "";
		if(ssn.indexOf('-') != -1) {
			String [] sArr = ssn.split("-");
			dbSsn = sArr[0] + sArr[1].substring(0, 1);
		}else {
			dbSsn = ssn.substring(0,7);
		}
		
		String inputSsn = ssn1 + ssn2;
		logger.info("db와 입력한 주민번호 확인 dbSsn={}, inputSsn={}", dbSsn, inputSsn);
		String message = "";
		identSsn = "Y";
		
		if(!inputSsn.equals(dbSsn)) {
			message = "학생처에 저장된 주민번호와 다릅니다. \r\n ☎ 02-1234-0114로 문의해주세요.";
			identSsn = "N";
		}
		
		logger.info("identSsn={}, message={}", identSsn, message);
		
		
		MessageVO mVo = new MessageVO();
		mVo.setIdentSsn(identSsn);
		mVo.setOfficialNo(officialNo);
		mVo.setMessage(message);
		
		return mVo;
		
	}
	
	
	
	
	
	
}
