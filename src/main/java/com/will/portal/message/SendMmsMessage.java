package com.will.portal.message;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class SendMmsMessage {

    /*
     * 뿌리오 발송 API 경로 - 서버측 인코딩과 응답형태에 따라 선택
     */
//    final String SEND_API_URL = "https://message.ppurio.com/api/send_euckr_text.php"; // EUC-KR 인코딩과 TEXT 응답용 호출 페이지
//    final String SEND_API_URL = "https://message.ppurio.com/api/send_euckr_json.php"; // EUC-KR 인코딩과 JSON 응답용 호출 페이지
//    final String SEND_API_URL = "https://message.ppurio.com/api/send_euckr_xml.php";  // EUC-KR 인코딩과 XML 응답용 호출 페이지
    final String SEND_API_URL = "https://message.ppurio.com/api/send_utf8_text.php";  // UTF-8 인코딩과 TEXT 응답용 호출 페이지
//    final String SEND_API_URL = "https://message.ppurio.com/api/send_utf8_json.php";  // UTF-8 인코딩과 JSON 응답용 호출 페이지
//    final String SEND_API_URL = "https://message.ppurio.com/api/send_utf8_xml.php";   // UTF-8 인코딩과 XML 응답용 호출 페이지

    /*
     * 뿌리오 예약취소 API 경로 - 서버측 인코딩과 응답형태에 따라 선택
     */
//    String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_euckr_text.php";    // EUC-KR 인코딩과 TEXT 응답용 호출 페이지
// String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_euckr_json.php"; // EUC-KR 인코딩과 JSON 응답용 호출 페이지
// String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_euckr_xml.php";  // EUC-KR 인코딩과 XML 응답용 호출 페이지
 String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_utf8_text.php";  // UTF-8 인코딩과 TEXT 응답용 호출 페이지
// String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_utf8_json.php";  // UTF-8 인코딩과 JSON 응답용 호출 페이지
// String CANCEL_API_URL = "https://message.ppurio.com/api/cancel_utf8_xml.php";   // UTF-8 인코딩과 XML 응답용 호출 페이지

    // application이 사용하는 character set에 따라 변경 ex> EUC-KR, UTF-8
    private String charset = "UTF-8";
    private final String boundary;
    private static final String LINE_FEED = "\r\n";



    public SendMmsMessage() throws IOException {
        boundary = "===" + System.currentTimeMillis() + "===";
    }

	public String cancel(String userid, String msgid) throws Exception{
        HttpURLConnection httpConn = initHttpConnection(CANCEL_API_URL);
        OutputStream outputStream = httpConn.getOutputStream();
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, charset),true);

        addParameter(writer, "userid", userid);
        addParameter(writer, "msgid", msgid);
        sendFinish(writer);

        return closeHttpConnection(httpConn);
    }

    public String send(String userid, String callback, String phone, String msg
            , String names, String appdate,  String subject, String filePath) throws Exception {
        HttpURLConnection httpConn = initHttpConnection(SEND_API_URL);
        OutputStream outputStream = httpConn.getOutputStream();
        PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, charset),true);
        File file1 = null;

        // filePath가 있는 경우 포토 발송
        if(filePath != null && !"".equals(filePath.trim())) file1 =  new File(filePath);

        addParameter(writer, "userid", userid);
        addParameter(writer, "callback", callback);
        addParameter(writer, "phone", phone);
        addParameter(writer, "msg", msg);
        addParameter(writer, "names", names);
        addParameter(writer, "appdate", appdate);
        addParameter(writer, "subject", subject);

        if(file1 != null) addFile(writer, outputStream, "file1", file1);

        sendFinish(writer);

        return closeHttpConnection(httpConn);
    }

    private HttpURLConnection initHttpConnection(String requestUrl) throws IOException {
        URL url = new URL(requestUrl);
        HttpURLConnection httpConn;

        httpConn = (HttpURLConnection) url.openConnection();
        httpConn.setUseCaches(false);
        httpConn.setDoOutput(true);
        httpConn.setDoInput(true);
        httpConn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        httpConn.setRequestProperty("User-Agent", "CodeJava Agent");

        return httpConn;
    }

    private void addParameter(PrintWriter writer, String name, String value) {
        writer.append("--" + boundary).append(LINE_FEED);
        writer.append("Content-Disposition: form-data; name=\"" + name + "\"").append(LINE_FEED);
        writer.append("Content-Type: text/plain; charset=" + charset).append(LINE_FEED);
        writer.append(LINE_FEED);
        writer.append(value).append(LINE_FEED);
        writer.flush();
    }

    private void addFile(PrintWriter writer, OutputStream outputStream, String name, File uploadFile) throws IOException {
        String fileName = uploadFile.getName();
        writer.append("--" + boundary).append(LINE_FEED);
        writer.append("Content-Disposition: form-data; name=\"" + name+ "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
        writer.append("Content-Type: "+ URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
        writer.append("Content-Transfer-Encoding: binary").append(LINE_FEED);
        writer.append(LINE_FEED);
        writer.flush();

        FileInputStream inputStream = new FileInputStream(uploadFile);
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        outputStream.flush();
        inputStream.close();
        writer.append(LINE_FEED);
        writer.flush();
    }

    private void sendFinish(PrintWriter writer)  throws IOException {
        writer.append(LINE_FEED).flush();
        writer.append("--" + boundary + "--").append(LINE_FEED);
        writer.close();
    }

    private String closeHttpConnection(HttpURLConnection httpConn) throws IOException {
        StringBuffer response = new StringBuffer();

        int status = httpConn.getResponseCode();
        if (status == HttpURLConnection.HTTP_OK) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();
            httpConn.disconnect();
        } else {
            throw new IOException("Server returned non-OK status: " + status);
        }
        return response.toString();
    }
}
