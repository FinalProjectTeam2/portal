<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/menu1.css'/>" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
</script>
<title>�Խ���</title>
</head>
<body>
<!-- ------------------------------------------------->
<!-- �������� -->
<div class="NoticeContents">
	<h1>���а���</h1> <!-- Ÿ��Ʋ���� �ٲ�(���а���/ �л����������/ ���а���/ �������� �Խ���/ �л����������  -->
	<p style="line-height: 28px; font-size: 14px;">
		Ȩ������ ���� ���� ���������� Ȩ�������� ���� ������ ���еǾ� ��ǿ��� �̿뿡 �����Ͽ� �ֽñ� �ٶ��ϴ�.<br>
		- <strong>Ȩ������ ����</strong>&nbsp;: ������� ��� �� �ܺ����� ������� �ϴ� �Ϲ�, Ư��, ���, ä�� ������ �<br>
		- <span style="color: rgb(255, 240, 245);">
			<strong>
				<span style="background-color: rgb(61, 121, 194);">���� ����</span>
			</strong>
		</span>
		&nbsp;: <strong>���� �������� ���� ���� ��������&nbsp;</strong>
		�������� ������ <strong>���� ����</strong>, �л������� <strong>�л� ����</strong>, ���������� <strong>���� ����</strong>�� �����Ͽ� �
	</p>
</div>


<!-- ------------------------------------------------->
<!-- �޴� -->
<div class="topnav">
  <a href="#news">���а���</a>
  <a href="#contact">�л硤��������</a>
  <a href="#about">���а���</a>
  <a href="#about">�������� �Խ���</a>
  <a href="#about">Ȩ����������</a>
</div>


<!-- ------------------------------------------------->
<!-- �Խ��� -->
<%@ include file="menu2.jsp" %> 

 
<!-- ------------------------------------------------->
<!-- ���� -->
<%@ include file="menu1-4.jsp" %>   
</body>
</html>