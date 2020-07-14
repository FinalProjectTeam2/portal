<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/menu1.css'/>" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// 1�޴� - ��Ӹ޴�
function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}
	
function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}

function myFunction2() {
	  document.getElementById("myDropdown2").classList.toggle("show");
}
	
function filterFunction2() {
	  var input, filter, ul, li, a, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  div = document.getElementById("myDropdown2");
	  a = div.getElementsByTagName("a");
	  for (i = 0; i < a.length; i++) {
	    txtValue = a[i].textContent || a[i].innerText;
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	      a[i].style.display = "";
	    } else {
	      a[i].style.display = "none";
	    }
	}
}
</script>
   
<title>�Խ���</title>
</head>
<body>
<!-- 1�޴� ��Ӹ޴� -->
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Home</button>
</div>

<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">��������</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="#">��������</a>
    <a href="#">�����ڷ��</a>
    <a href="#">Ŀ�´�Ƽ(�Խ���)</a>
    <a href="#">����</a>
  </div>
</div>

<div class="dropdown">
  <button onclick="myFunction2()" class="dropbtn">���а���</button>
  <div id="myDropdown2" class="dropdown-content">
    <a href="#">���а���</a>
    <a href="#">�л硤��������</a>
    <a href="#">>���а���</a>
    <a href="#">��硤��������</a>
    <a href="#">Ȩ������ ����</a>

  </div>
</div>


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
<!-- 2�޴� -->
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