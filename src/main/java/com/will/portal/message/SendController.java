package com.will.portal.message;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendController {
	private static final Logger logger = LoggerFactory.getLogger(SendController.class);
	
	@RequestMapping("/send")
	public void sendMsg() {
		String userid = "fe5882";           // [필수] 뿌리오 아이디
		String callback = "01038225882";    // [필수] 발신번호 - 숫자만
		String phone = "01038225882";       // [필수] 수신번호 - 여러명일 경우 |로 구분 "010********|010********|010********"
		String msg = "[*이름*] 테스트 발송입니다";   // [필수] 문자내용 - 이름(names)값이 있다면 [*이름*]가 치환되서 발송됨
		String names = "홍길동";            // [선택] 이름 - 여러명일 경우 |로 구분 "홍길동|이순신|김철수"
		String appdate = "";  // [선택] 예약발송 (현재시간 기준 10분이후 예약가능)
		String subject = "테스트";          // [선택] 제목 (30byte)
		String file1Path = "";    // [선택]  포토발송 (jpg, jpeg만 지원  300 K  이하)
		
		
		
		try {
			
		    SendMmsMessage sendMmsMessage = new SendMmsMessage();

		    // filePath가 null 혹은 blank("")인 경우 일반 단/장문 발송. 
			String response_str = sendMmsMessage.send( userid,  callback,  phone,  msg, names, appdate, subject, file1Path );
			
			
			//response 
			System.out.println("=============================");
			System.out.println(response_str);
			System.out.println("=============================");

		} catch (IOException localIOException) {
		    System.out.println(localIOException.toString());
		} catch (Exception ex ){
			ex.printStackTrace();
		}
		
		
	}
}
