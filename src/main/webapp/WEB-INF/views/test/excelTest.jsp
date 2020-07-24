<%@page import="org.apache.poi.ss.usermodel.CellType"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.channels.FileChannel"%>
<%@page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>엑셀테스트</title>
</head>
<body>
	<%
		String excelfile = "C:\\myoracle\\product.xlsx";
	XSSFWorkbook workbook = null;
	try {

		workbook = new XSSFWorkbook(new FileInputStream(new File(excelfile)));
		int sheetNum = workbook.getNumberOfSheets();

		for (int i = 0; i < sheetNum; i++) {
			XSSFSheet sheet = workbook.getSheetAt(i);
			%>
			<br>
			<br> Sheet Number
			<%=i%><br> Sheet Name
			<%=workbook.getSheetName(i)%><br>
		
			<%
				
			int rows = sheet.getPhysicalNumberOfRows();
		
			for (int r = 0; r < rows; r++) {
				XSSFRow row = sheet.getRow(r);
				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();
			%>
	
				row
				<%=row.getRowNum()%><%=cells%><br>
				<br>
			
				<%
					for (int c = 0; c < cells; c++) {
						XSSFCell cell = row.getCell(c);
						if (cell != null) {
							String value = null;
							switch (cell.getCellType()) {
							case FORMULA:
								value = cell.getCellFormula();
								break;
						
									case NUMERIC:
								value = cell.getNumericCellValue() + "";
								break;
						
									case STRING:
								value = cell.getStringCellValue();
								break;
						
									case BLANK:
								value = null;
								break;
						
									case BOOLEAN:
								value = cell.getBooleanCellValue() + "";
								break;
						
									case ERROR:
								value = cell.getErrorCellValue() + "";
								break;
									default:
							}
				%>
	
					<%=cell.getColumnIndex() + value%><br>
		
			<%
						}
					}
				}
			}
			
		}
	} catch (Exception e) {
		e.printStackTrace();

	} finally {
		if (workbook != null)
		workbook.close();
	}
	%>
</body>
</html>