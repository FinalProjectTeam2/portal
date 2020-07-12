<%@page import="com.daou.ppurio.SendMmsMessage"%>
<%@page language="java" import="java.io.*" contentType="text/html;charset=euc-kr" %>
<%


/*
 * 요청값
 */
String userid = "******";           // [필수] 뿌리오 아이디
String callback = "010********";    // [필수] 발신번호 - 숫자만
String phone = "010********";       // [필수] 수신번호 - 여러명일 경우 |로 구분 "010********|010********|010********"
String msg = "[*이름*] 테스트 발송입니다";   // [필수] 문자내용 - 이름(names)값이 있다면 [*이름*]가 치환되서 발송됨
String names = "홍길동";            // [선택] 이름 - 여러명일 경우 |로 구분 "홍길동|이순신|김철수"
String appdate = "20190502093000";  // [선택] 예약발송 (현재시간 기준 10분이후 예약가능)
String subject = "테스트";          // [선택] 제목 (30byte)
String file1Path = "C:\\test.jpg";    // [선택]  포토발송 (jpg, jpeg만 지원  300 K  이하)

try {
	
    SendMmsMessage sendMmsMessage = new SendMmsMessage();

    // filePath가 null 혹은 blank("")인 경우 일반 단/장문 발송. 
	String response_str = sendMmsMessage.send( userid,  callback,  phone,  msg, names, appdate, subject, file1Path );
	
	
	//response 
	System.out.println("=============================");
	System.out.println(response_str);
	System.out.println("=============================");

} catch (IOException localIOException) {
    out.println(localIOException.toString());
} catch (Exception ex ){
	ex.printStackTrace();
}


/*
 * 응답값
 *
 *  <성공시>
 *    "ok|sms|123456789|1"           - 전송결과|발송형태(단문은 sms 장문은 lms 포토문자는 mms)|발송 msgid (예약취소시 필요)|발송건수
 *
 *  <실패시>
 *    "invalid_member"               - 연동서비스 신청이 안 됐거나 없는 아이디
 *    "under_maintenance"            - 요청시간에 서버점검중인 경우
 *    "allow_https_only"             - http 요청인 경우
 *    "invalid_ip"                   - 등록된 접속가능 IP가 아닌 경우
 *    "invalid_msg"                  - 문자내용에 오류가 있는 경우
 *    "invalid_names"                - 이름에 오류가 있는 경우
 *    "invalid_subject"              - 제목에 오류가 있는 경우
 *    "invalid_sendtime"             - 예약발송 시간에 오류가 있는 경우 (10분이후부터 다음해말까지 가능)
 *    "invalid_sendtime_maintenance" - 예약발송 시간에 서버점검 예정인 경우
 *    "invalid_phone"                - 수신번호에 오류가 있는 경우
 *    "invalid_msg_over_max"         - 문자내용이 너무 긴 경우
 *    "invalid_callback"             - 발신번호에 오류가 있는 경우
 *    "once_limit_over"              - 1회 최대 발송건수 초과한 경우
 *    "daily_limit_over"             - 1일 최대 발송건수 초과한 경우
 *    "not_enough_point"             - 잔액이 부족한 경우
 *    "over_use_limit"               - 한달 사용금액을 초과한 경우
 *    "server_error"                 - 기타 서버 오류
 */

%>