<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<style type="text/css">
.dropdown-menu {
	position: inherit;
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 10rem;
	padding: .5rem 0;
	margin: .125rem 0 0;
	font-size: 1rem;
	color: #212529;
	text-align: left;
	list-style: none;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: .25rem;
	display: inline-block;
}
table{
	border-collapse: collapse;
	width: 98%;
}
td{
	height: 300px;
    vertical-align: top;
}
td > * {
    float: left;
    height: 100%;
}
div#divTop {
    margin: 10px 0 0 10px;
}
</style>
<script type="text/javascript">
$(function() {
	
});
</script>
<title>주소록 검색</title>
</head>
<body>
	<div id="addrList">
		<div id="divTop">
			<form action="" id="searchForm">
				<label for="search">이름</label> <input type="text" id="search">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<table style="margin: 0 auto;">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<td>
						<div class="dropdown-menu">
							<a class="dropdown-item active">임직원</a> <a
								class="dropdown-item">교수</a> <a
								class="dropdown-item">학생</a>
						</div>
					</td>
					<td>
					<div style="border: 1px solid #d9d9d9; padding: 5px 0; border-radius: 5px; margin: 2px 0 0 0; width: 100%;">
						<ul id="list">
							<li>김우석(202030010001)</li>
							<li>김우석(202030010001)</li>
							<li>김우석(202030010001)</li>
						</ul>
					</div>
					</td>
				</tr>
			</table>
		</div>
		<div>
		<div id="addr">
			<span>202030010001</span>
			<span>202020010001</span>
			<span>202010010001</span>
		</div>
		<input type="button" id="btOk" value="확인">
		</div>
	</div>
</body>
</html>