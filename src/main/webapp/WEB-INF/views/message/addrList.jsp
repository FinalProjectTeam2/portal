<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
div#addr {
    border: 1px solid gray;
    margin: 5px;
    width: 400px;
    overflow-x: scroll;
    white-space: nowrap;
    display: inline-flex;
    float: left;
    padding: 5px;
    height: 54px;
}
input#btSearch {
    padding: 2px 10px;
}
input#btOk {
    float: left;
    padding: 9px 20px;
    margin-top: 10px;
    margin-left: 5px;
}
span.spAddr {
    background: #d7deff;
    padding: 0px 3px;
    border-radius: 8px;
    cursor: pointer;
}
span.spAddr:hover {
	background: #7288ec;
	color: white;
}
.liAddr{
	cursor: pointer;
}
.liAddr:hover{
	background: #e1e0ef75;
}
div#type a {
    cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	empList();
	$("#searchForm").submit(function() {
		var name = $("#search").val();
		empList(name);
		return false;
	});
	$("#search").click(function() {
		$(this).val('');
	});
	
	$("#emp").click(function() {
		var name = $("#search").val();
		empList(name);
	});
	
	$("#prof").click(function() {
		var name = $("#search").val();
		profList(name);
	});
	
	$("#stu").click(function() {
		var name = $("#search").val();
		stuList(name);
	});
	
	$("#btOk").click(function() {
		var addrs = $("#addr").text();
		var sliceAddrs = addrs.slice(0,-1);
		$("#officialNo",opener.document).val(sliceAddrs);
		self.close();
	});
	
});
function empList(name) {
	$.ajax({
		url : "<c:url value='/message/empList'/>",
		data : {
			name : name
		},
		type : "get",
		dataType : "json",
		success : function(res) {
			$("#type a").removeClass('active');
			$("#emp").addClass("active");
			var data = '';
			if(res.length > 0){
				$.each(res, function(idx, item) {
					data += '<li class="liAddr" id="'+item.empNo+'">'+item.empName+'('+item.empNo+') - '+item.depName+'</li>';
				});
			}else{
				data += '<li>주소록이 없습니다.</li>';
			}
			
			$("#list").html(data);
			$(".liAddr").click(function() {
				var no = $(this).attr("id");
				$("#addr").append('<span><span class="spAddr">'+no+'</span>,</span>');
				$(".spAddr").click(function() {
					$(this).parent().remove();
				});
			});
			
		}
	});
}

function profList(name) {
	$.ajax({
		url : "<c:url value='/message/profList'/>",
		data : {
			name : name
		},
		type : "get",
		dataType : "json",
		success : function(res) {
			$("#type a").removeClass('active');
			$("#prof").addClass("active");
			var data = '';
			if(res.length > 0){
				$.each(res, function(idx, item) {
					data += '<li class="liAddr" id="'+item.profNo+'">'+item.profName+'('+item.profNo+') - '+item.depName+'</li>';
				});
			}else{
				data += '<li>주소록이 없습니다.</li>';
			}
			
			$("#list").html(data);
			$(".liAddr").click(function() {
				var no = $(this).attr("id");
				$("#addr").append('<span><span class="spAddr">'+no+'</span>,</span>');
				$(".spAddr").click(function() {
					$(this).parent().remove();
				});
			});
			
		}
	});
}
function stuList(name) {
	$.ajax({
		url : "<c:url value='/message/stuList'/>",
		data : {
			name : name
		},
		type : "get",
		dataType : "json",
		success : function(res) {
			$("#type a").removeClass('active');
			$("#stu").addClass("active");
			var data = '';
			if(res.length > 0){
				$.each(res, function(idx, item) {
					data += '<li class="liAddr" id="'+item.stuNo+'">'+item.name+'('+item.stuNo+') - '+item.majorName+'</li>';
				});
			}else{
				data += '<li>주소록이 없습니다.</li>';
			}
			
			
			$("#list").html(data);
			$(".liAddr").click(function() {
				var no = $(this).attr("id");
				$("#addr").append('<span><span class="spAddr">'+no+'</span>,</span>');
				$(".spAddr").click(function() {
					$(this).parent().remove();
				});
			});
		}
	});
}
</script>
<title>주소록 검색</title>
</head>
<body>
	<div id="addrList">
		<div id="divTop">
			<form action="" id="searchForm">
				<label for="search">이름</label> <input type="text" id="search">
				<input type="submit" value="검색" id="btSearch" class="btn btn-primary">
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
						<div class="dropdown-menu" id="type">
							<a class="dropdown-item active" id="emp">임직원</a> <a
								class="dropdown-item" id="prof">교수</a> <a
								class="dropdown-item" id="stu">학생</a>
						</div>
					</td>
					<td>
					<div style="border: 1px solid #d9d9d9; padding: 5px 0; border-radius: 5px; 
					margin: 2px 0 0 0; width: 100%; overflow: auto;  height: 300px;">
						<ul id="list"></ul>
					</div>
					</td>
				</tr>
			</table>
		</div>
		<div>
		<div id="addr"></div>
		<input type="button" id="btOk" value="확인" class="btn btn-primary">
		</div>
	</div>
</body>
</html>