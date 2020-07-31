package com.will.portal.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class ReBoardDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		File file = (File)model.get("file");
		if(file==null || !file.exists() || !file.canRead()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.print("<script type = 'text/javascript'>");
			out.print("alert('파일이 손상되었거나 존재하지 않습니다.');");
			out.print("histor	y.back();");
			out.print("</script>");
		}
		
		//다운로드 처리
		response.setContentType("application/octet-stream");
		
		String str = new String(file.getName().getBytes("utf-8"), "8859_1");
		response.setHeader("Content-disposition", "attachment;filename="+str);
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
		}finally {
			if(fis != null)	fis.close();
		}
		
	}

}
