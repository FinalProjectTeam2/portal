package com.will.portal.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ExcelRead {
	private static Logger logger = LoggerFactory.getLogger(ExcelRead.class);
	public static List<Map<String, Object>> read(ExcelReadOption excelReadOption){
		
		//엑셀 파일 자체를 읽어들인다
		//FileType.getWorkbook() <-- 파일의 확장자에 따라서 적절하게 가져온다
		
		Workbook wb = ExcelFileType.getWorkbook(excelReadOption.getFilePath());
		//첫번째 시트를 가져온다
		Sheet sheet = wb.getSheetAt(0);
		
		logger.info("sheet이름 = {}, 데이터가 있는 sheet의 수={}", wb.getSheetName(0), wb.getNumberOfSheets());
		
		//sheet에서 유효한(데이터가 있는) 행의 개수를 가져온다.
		
		int numOfRows = sheet.getPhysicalNumberOfRows();
		int numOfCells = 0;
		
		Row row = null;
		Cell cell = null;
		
		String cellName = "";
		
		//각 row마다 값을 저장할 map객체 생성
		//put("A", "내용")형식으로 들어가게 함
		Map<String, Object> map = null;
		
		
		//각 row를 list에 담는다
		//하나의 row는 하나의 map으로 표현 (일단 vo로 안하고 map으로 받은 후에 서비스나 컨트롤러에서 vo로 바꿀수 있게 진행해보죠) 이게 잘되는지 보고
		
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		//각 row만큼 반복합니다
		for(int rowIndex = excelReadOption.getStartRow() - 1; rowIndex < numOfRows; rowIndex++) {
			//워크북에서 가져온 시트에서 rowIndex에 해당하는 row를 가져옴
			//하나의 row에는 여러개의 cell이 있다
			
			row = sheet.getRow(rowIndex);
			
			if(row!=null) {
				//가져온 row의 cell개수 구함
				//이건 비어있는 cell의 개수는 세지 못한다고 함
				//numOfCells = row.getPhysicalNumberOfCells();
				//이걸로바꿈
				numOfCells = row.getLastCellNum();
				
				
				//데이터를 담을 map객체 초기화
				map = new HashedMap<String, Object>();
				
				//cell의 개수만큼 반복
				for(int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
					
					//row에서 cellIndex에 해당하는 cell을 가져온다
					cell = row.getCell(cellIndex);
					
					//현재 cell의 이름을 가져온다 A, B, C, D,...
					
					cellName = ExcelCellRef.getName(cell, cellIndex);
					
					//추출대상인지 확인 후 아니면 다음 for로(excelreadoption은 매개변수) 
					if(!excelReadOption.getOutputColumns().contains(cellName)) {
						continue;
					}
					
					//map객체의 cell이름을 key로 데이터를 담는다
					map.put(cellName, ExcelCellRef.getValue(cell));
					
					
				}
				
				//만들어진 객체를 list에 담는다
				result.add(map);
			}
			
			
			
		}
		
		
		return result;
	}
}
