<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
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
        <label for="l_title">제목</label>
      </div>
      <div class="col-75">
        <input type="text" id="title" name="title">
      </div>
    </div>
 
    <div class="row">
      <div class="col-25">
        <label for="l_no">번호</label>
      </div>
      <div class="col-75">
        <input type="text" id="no" name="no">
      </div>
    </div>  
       <div class="row">
      <div class="col-25">
        <label for="l_category">분류</label>
      </div>
      <div class="col-75">
        <select id="category" name="category">
          <option value="">공통</option>
          <option value="">죽전</option>
          <option value="">천안</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="l_name">작성자</label>
      </div>
      <div class="col-75">
        <input type="text" id="name" name="name">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="l_date">작성일</label>
      </div>
      <div class="col-75">
        <input type="text" id="date" name="date">
      </div>
    </div>
 
    <div class="row">
      <div class="col-25">
        <label for="l_subject">내용</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" placeholder="내용을 입력하세요." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="등록">
    </div>
  </form>
</div>

</body>
</html>
