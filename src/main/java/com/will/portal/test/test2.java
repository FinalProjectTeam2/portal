package com.will.portal.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;

public class test2 {

	@SuppressWarnings("resource")
	public List<test1VO> xlsTocuList(String filePath) {
		List<test1VO> list = new ArrayList<test1VO>();
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		
		try {
			fis = new FileInputStream(filePath);
			workbook = new HSSFWorkbook(fis);
			
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			test1VO vo;
			
			for(int sheetIndex=0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				curSheet = workbook.getSheetAt(sheetIndex);
				
				for (int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					if(rowIndex!=0) {
						curRow = curSheet.getRow(rowIndex);
						vo=new test1VO();
						String value;

						if(!"".equals(curRow.getCell(0).getStringCellValue())) {
							for(int cellIndex=0; cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
								
								if(true) {
									value="";
									switch (curCell.getCellType()) {
										case FORMULA:
											value=curCell.getCellFormula();
											break;
										case NUMERIC:
											value=curCell.getNumericCellValue()+"";
											break;
											
										case STRING:
											value=curCell.getStringCellValue()+"";
											break;	
										case BLANK:
											value=curCell.getBooleanCellValue()+"";
											break;
										case ERROR:
											value=curCell.getErrorCellValue()+"";
											break;	
									

									default:
										value = new String();
										break;
									}
									
									switch (cellIndex) {
									case 0:
										vo.setCustId(value);
										break;
									case 1:
										vo.setCustName(value);
										break;
									case 2:
										vo.setCustAge(value);
										break;	
									case 3:
										vo.setCustEmail(value);
										break;
									default:
										break;
									}
								}
							}
							
							list.add(vo);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis!=null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}
