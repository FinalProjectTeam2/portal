<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>엑셀테스트</title>
</head>
<body>
<% 
	String excelfile = "d:\\lecture\\faculty.xlsx";

	try {
		POIFSFileSystem fs = new POIFSFileSystem(excelfile);
		
		HSSFWorkbook workbook = new HSSFWorkbook(fs);
		unt sheetNum = workbook.getNumberOfSheets();
		
		for(int i=0; i<sheetNum; i++) {
%>
	<br><br>
	Sheet Number <%=i %><br>			
	Sheet Name <%=workbook.getSheetName(i) %><br>			

<%
	HSSFSheet sheet = workbook.getSheetAt(i);
	int rows = sheet.getPhysicalNumberOfRows();
	
	for(int r =0; r<rows; r++) {
		HSSFRow row = sheet.getRow(r);
		if(row!=null) {
			int cells = row.getPhysicalNumberOfCells();
%>

	row <%=row.getRowNum() %><%=cells %><br><br>
	
<%
	for(short c=0; c<cells; c++) {
		HSSFCell cell = row.getCell(c);
		if(cell!=null) {
			String value = null;
			
			switch(cell.getCellType()) {
				case HSSFCell.CELL_TYPE_FORMULA:
					value=cell.getCellFormula();
				break;
				
				case HSSFCell.CELL_TYPE_NUMERIC:
					value=cell.getNumericCellValue();
				break;
				
				case HSSFCell.CELL_TYPE_STRING:
					value=cell.getStringCellValue();
				break;
				
				case HSSFCell.CELL_TYPE_BLANK:
					value=null;
				break;
				
				case HSSFCell.CELL_TYPE_BOOLEAN:
					value=cell.getBooleanCellValue();
				break;
				
				case HSSFCell.CELL_TYPE_ERROR:
					value=cell.getErrorCellValue();
				break;
			default:
			}
%>		

	<%=cell.getCellNum()+value %><br>

<%
					}
				}	
			}
		
		}
	}
} catch (Exception e) {
	e.printStackTrace();

}
%>
</body>
</html>