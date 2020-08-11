package com.will.portal.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 
 * 엑셀파일을 읽어서 Workbook 객체에 리턴한다.
 * XLS와 XLSX 확장자를 비교한다.
 * 
 * @param filePath
 * @return
 * 
 */

public class ExcelFileType {
	
	public static Workbook getWorkbook(String filePath) {
		FileInputStream fis =null;
		
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		Workbook wb = null;
		
		
			try {
				wb = new XSSFWorkbook(fis);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
	
		
		return wb;
		
		
	}
}
