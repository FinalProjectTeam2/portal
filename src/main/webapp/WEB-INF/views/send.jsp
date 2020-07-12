<%@page import="com.daou.ppurio.SendMmsMessage"%>
<%@page language="java" import="java.io.*" contentType="text/html;charset=euc-kr" %>
<%


/*
 * ��û��
 */
String userid = "******";           // [�ʼ�] �Ѹ��� ���̵�
String callback = "010********";    // [�ʼ�] �߽Ź�ȣ - ���ڸ�
String phone = "010********";       // [�ʼ�] ���Ź�ȣ - �������� ���� |�� ���� "010********|010********|010********"
String msg = "[*�̸�*] �׽�Ʈ �߼��Դϴ�";   // [�ʼ�] ���ڳ��� - �̸�(names)���� �ִٸ� [*�̸�*]�� ġȯ�Ǽ� �߼۵�
String names = "ȫ�浿";            // [����] �̸� - �������� ���� |�� ���� "ȫ�浿|�̼���|��ö��"
String appdate = "20190502093000";  // [����] �����߼� (�����ð� ���� 10������ ���డ��)
String subject = "�׽�Ʈ";          // [����] ���� (30byte)
String file1Path = "C:\\test.jpg"    // [����]  �����߼� (jpg, jpeg�� ����  300 K  ����)

try {

    SendMmsMessage sendMmsMessage = new SendMmsMessage();

    // filePath�� null Ȥ�� blank("")�� ���� �Ϲ� ��/�幮 �߼�.
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
 * ���䰪
 *
 *  <������>
 *    "ok|sms|123456789|1"           - ���۰���|�߼�����(�ܹ��� sms �幮�� lms ���乮�ڴ� mms)|�߼� msgid (�������ҽ� �ʿ�)|�߼۰Ǽ�
 *
 *  <���н�>
 *    "invalid_member"               - ���������� ��û�� �� �ưų� ���� ���̵�
 *    "under_maintenance"            - ��û�ð��� ������������ ����
 *    "allow_https_only"             - http ��û�� ����
 *    "invalid_ip"                   - ���ϵ� ���Ӱ��� IP�� �ƴ� ����
 *    "invalid_msg"                  - ���ڳ��뿡 ������ �ִ� ����
 *    "invalid_names"                - �̸��� ������ �ִ� ����
 *    "invalid_subject"              - ������ ������ �ִ� ����
 *    "invalid_sendtime"             - �����߼� �ð��� ������ �ִ� ���� (10�����ĺ��� �����ظ����� ����)
 *    "invalid_sendtime_maintenance" - �����߼� �ð��� �������� ������ ����
 *    "invalid_phone"                - ���Ź�ȣ�� ������ �ִ� ����
 *    "invalid_msg_over_max"         - ���ڳ����� �ʹ� �� ����
 *    "invalid_callback"             - �߽Ź�ȣ�� ������ �ִ� ����
 *    "once_limit_over"              - 1ȸ �ִ� �߼۰Ǽ� �ʰ��� ����
 *    "daily_limit_over"             - 1�� �ִ� �߼۰Ǽ� �ʰ��� ����
 *    "not_enough_point"             - �ܾ��� ������ ����
 *    "over_use_limit"               - �Ѵ� �����ݾ��� �ʰ��� ����
 *    "server_error"                 - ��Ÿ ���� ����
 */

%>
