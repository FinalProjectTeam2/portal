<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/write.css'/>" />
</head>
<body>
<div class="container">
  <form action="/action_page.php">
    <div class="row">
      <div class="col-25">
        <label for="l_title">����</label>
      </div>
      <div class="col-75">
        <input type="text" id="title" name="title">
      </div>
    </div>
 
    <div class="row">
      <div class="col-25">
        <label for="l_no">��ȣ</label>
      </div>
      <div class="col-75">
        <input type="text" id="no" name="no">
      </div>
    </div>  
       <div class="row">
      <div class="col-25">
        <label for="l_category">�з�</label>
      </div>
      <div class="col-75">
        <select id="category" name="category">
          <option value="">����</option>
          <option value="">����</option>
          <option value="">õ��</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="l_name">�ۼ���</label>
      </div>
      <div class="col-75">
        <input type="text" id="name" name="name">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="l_date">�ۼ���</label>
      </div>
      <div class="col-75">
        <input type="text" id="date" name="date">
      </div>
    </div>
 
    <div class="row">
      <div class="col-25">
        <label for="l_subject">����</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" placeholder="������ �Է��ϼ���." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="����">
      <input type="button" value="���">
    </div>
  </form>
</div>

</body>
</html>
