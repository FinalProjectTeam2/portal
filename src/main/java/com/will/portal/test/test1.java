package com.will.portal.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class test1 {
	public void xisWiter(List<test1VO> list) {
		HSSFWorkbook workbook = new HSSFWorkbook(); // 워크북 생성
		HSSFSheet sheet = workbook.createSheet(); // 워크시트 생성
		HSSFRow row = sheet.createRow(0); // 행 생성
		HSSFCell cell; // 셀 생성
		
		cell=row.createCell(0);
		cell.setCellValue("아이디");
		
		cell=row.createCell(1);
		cell.setCellValue("이름");
		
		cell=row.createCell(2);
		cell.setCellValue("나이");
		
		cell=row.createCell(3);
		cell.setCellValue("이메일");
		
		test1VO vo;
		for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
			vo = list.get(rowIdx);
			
			// 행 생성
			row = sheet.createRow(rowIdx+1);
			
			cell=row.createCell(0);
			cell.setCellValue(vo.getCustId());
		
			cell=row.createCell(1);
			cell.setCellValue(vo.getCustName());
			
			cell=row.createCell(2);
			cell.setCellValue(vo.getCustAge());
			
			cell=row.createCell(3);
			cell.setCellValue(vo.getCustEmail());
		
		}
		
		
		// 입력된 내용 파일로 쓰기
		File file = new File("test.xls");
		FileOutputStream fos = null;
		
		try {
			fos = new FileOutputStream(file);
			workbook.write(fos);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				
				if(fos!=null) fos.close();
				if(workbook!=null) workbook.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
