<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

</style>

</head>
<body>
<div class="container">
  <form action="/action_page.php">
    <label>게시물을 삭제하시겠습니까?<br> 비밀번호를 입력하세요.</label><br>
    <input type="password" id="psw" name="pwd" required>
    <input type="submit" value="삭제">
  </form>
</div>	
</body>
</html>
