<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/chat/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/chat/custom.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/chat/bootstrap.js'/>"></script>

<title>JSP AJAX 실시간 익명 채팅 사이트</title>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div class="portlet-body chat-widget"
								style="overflow-y: auto; width: auto; height: 300px;">
								<div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2020년 7월 28일</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#"> <img
												class="media-object img-circle"
												src="<c:url value='/resources/images/logo.png'/>">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													홍길동 <span class="small pull-right">오후 7시 30분</span>
												</h4>
											</div>
											<p>안녕하세요</p>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#"> <img
												class="media-object img-circle"
												src="<c:url value='/resources/images/logo.png'/>">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													홍길동 <span class="small pull-right">오후 7시 30분</span>
												</h4>
											</div>
											<p>안녕하세요dd</p>
										</div>
									</div>
								</div>
								<div class="portlet-footer">
									<div class="row">
										<div class="form-group col-xs-4">
											<input style="height: 40px;" type="text" id="chatName"
												class="form-control" placeholder="이름" maxlength="20">

										</div>
									</div>
								
								<div class="row" style="height: 90px">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100">
										
										</textarea>
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-defalut-pull-right" onclick="submitfuntion();">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
								
							</div>	
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>