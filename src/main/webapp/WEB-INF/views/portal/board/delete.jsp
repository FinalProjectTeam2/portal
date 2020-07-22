<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style type="text/css">
/* Style all input fields */
input {
  width: 50%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
  background-color: skyblue;
  color: white;
}

/* Style the container for inputs */
.container {
  background-color: #f1f1f1;
  padding: 20px;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}

form[name=frmDelete]{
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}
</style>

<main role="main" class="flex-shrink-0">
<div class="container">

  <form action="" method="post" name="frmDelete">
    <label>게시물을 삭제하시겠습니까?<br> 비밀번호를 입력하세요.</label><br>
    <input type="password" id="psw" name="pwd" required>
    <input type="submit" value="삭제">
  </form>

<%@ include file="../../inc/bottom.jsp"%>
