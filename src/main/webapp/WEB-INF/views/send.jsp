<%@page import="com.daou.ppurio.SendMmsMessage"%>
<%@page language="java" import="java.io.*" contentType="text/html;charset=UTF-8" %>
<%


/*
 * 占쏙옙청占쏙옙
 */
String userid = "******";           // [占십쇽옙] 占싼몌옙占쏙옙 占쏙옙占싱듸옙
String callback = "010********";    // [占십쇽옙] 占쌩신뱄옙호 - 占쏙옙占쌘몌옙
String phone = "010********";       // [占십쇽옙] 占쏙옙占신뱄옙호 - 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 |占쏙옙 占쏙옙占쏙옙 "010********|010********|010********"
String msg = "[*占싱몌옙*] 占쌓쏙옙트 占쌩쇽옙占쌉니댐옙";   // [占십쇽옙] 占쏙옙占쌘놂옙占쏙옙 - 占싱몌옙(names)占쏙옙占쏙옙 占쌍다몌옙 [*占싱몌옙*]占쏙옙 치환占실쇽옙 占쌩송듸옙
String names = "홍占썸동";            // [占쏙옙占쏙옙] 占싱몌옙 - 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 |占쏙옙 占쏙옙占쏙옙 "홍占썸동|占싱쇽옙占쏙옙|占쏙옙철占쏙옙"
String appdate = "20190502093000";  // [占쏙옙占쏙옙] 占쏙옙占쏙옙占쌩쇽옙 (占쏙옙占쏙옙占시곤옙 占쏙옙占쏙옙 10占쏙옙占쏙옙占쏙옙 占쏙옙占썅가占쏙옙)
String subject = "占쌓쏙옙트";          // [占쏙옙占쏙옙] 占쏙옙占쏙옙 (30byte)
String file1Path = "C:\\test.jpg";   // [占쏙옙占쏙옙]  占쏙옙占쏙옙占쌩쇽옙 (jpg, jpeg占쏙옙 占쏙옙占쏙옙  300 K  占쏙옙占쏙옙)

try {

    SendMmsMessage sendMmsMessage = new SendMmsMessage();

    // filePath占쏙옙 null 혹占쏙옙 blank("")占쏙옙 占쏙옙占쏙옙 占싹뱄옙 占쏙옙/占썲문 占쌩쇽옙.
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
 * 占쏙옙占썰값
 *
 *  <占쏙옙占쏙옙占쏙옙>
 *    "ok|sms|123456789|1"           - 占쏙옙占쌜곤옙占쏙옙|占쌩쇽옙占쏙옙占쏙옙(占쌤뱄옙占쏙옙 sms 占썲문占쏙옙 lms 占쏙옙占썰문占쌘댐옙 mms)|占쌩쇽옙 msgid (占쏙옙占쏙옙占쏙옙占쌀쏙옙 占십울옙)|占쌩송건쇽옙
 *
 *  <占쏙옙占싻쏙옙>
 *    "invalid_member"               - 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙청占쏙옙 占쏙옙 占싣거놂옙 占쏙옙占쏙옙 占쏙옙占싱듸옙
 *    "under_maintenance"            - 占쏙옙청占시곤옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
 *    "allow_https_only"             - http 占쏙옙청占쏙옙 占쏙옙占쏙옙
 *    "invalid_ip"                   - 占쏙옙占싹듸옙 占쏙옙占쌈곤옙占쏙옙 IP占쏙옙 占싣댐옙 占쏙옙占쏙옙
 *    "invalid_msg"                  - 占쏙옙占쌘놂옙占쎈에 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
 *    "invalid_names"                - 占싱몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
 *    "invalid_subject"              - 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
 *    "invalid_sendtime"             - 占쏙옙占쏙옙占쌩쇽옙 占시곤옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙 (10占쏙옙占쏙옙占식븝옙占쏙옙 占쏙옙占쏙옙占쌔몌옙占쏙옙占쏙옙 占쏙옙占쏙옙)
 *    "invalid_sendtime_maintenance" - 占쏙옙占쏙옙占쌩쇽옙 占시곤옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
 *    "invalid_phone"                - 占쏙옙占신뱄옙호占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
 *    "invalid_msg_over_max"         - 占쏙옙占쌘놂옙占쏙옙占쏙옙 占십뱄옙 占쏙옙 占쏙옙占쏙옙
 *    "invalid_callback"             - 占쌩신뱄옙호占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙占쏙옙
 *    "once_limit_over"              - 1회 占쌍댐옙 占쌩송건쇽옙 占십곤옙占쏙옙 占쏙옙占쏙옙
 *    "daily_limit_over"             - 1占쏙옙 占쌍댐옙 占쌩송건쇽옙 占십곤옙占쏙옙 占쏙옙占쏙옙
 *    "not_enough_point"             - 占쌤억옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
 *    "over_use_limit"               - 占싼댐옙 占쏙옙占쏙옙占쌥억옙占쏙옙 占십곤옙占쏙옙 占쏙옙占쏙옙
 *    "server_error"                 - 占쏙옙타 占쏙옙占쏙옙 占쏙옙占쏙옙
 */

%>
