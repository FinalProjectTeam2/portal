<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/fnq.css'/>" >

<main role="main" class="flex-shrink-0">
<div class="container">
<div id="fnq">
	<div style="margin-bottom: 10px">
		<h2 style="color: #1f54a2; font-weight:bold; margin-bottom: 3px">FAQ</h2>
		<span style="font-size: 16px;">자주묻는 질문</span>
	</div>
	<nav>
		<ul>
			<li><a href="#">전체</a></li>
			<li><a href="#">장학금</a></li>
			<li><a href="#">학사</a></li>
			<li><a href="#">졸업이수</a></li>
			<li><a href="#">강의평가</a></li>
			<li><a href="#">성적처리</a></li>
			<li><a href="#">전체</a></li>
			<li><a href="#">장학금</a></li>
			<li><a href="#">학사</a></li>
			<li><a href="#">졸업이수</a></li>
			<li><a href="#">강의평가</a></li>
			<li><a href="#">성적처리</a></li>
		</ul>	
	</nav>
	<div class="bar" >
		<div style="width: 30%">구분</div>
		<div style="width: 70%">질문내용</div>
	</div>
    <div class="panel-group" id="faqAccordion">
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">
                   		<div style="width: 30%">장학금</div>
                   		<div style="width: 70%"><span style="color:blue"><i class="fa fa-question"></i></span>   장학금 납부일은 언제인가요</div>
                    </a>
              	</h4>

            </div>
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     
                     <h5><span class="label label-primary">Answer</span></h5>
                    <p>Lorem Ipsum is simply dummy text of the printing and ttry's standard dummy text ever since the 1500s, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        </p>
                </div>
            </div>

       </div>
	<div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">
                   		<div style="width: 30%">장학금</div>
                   		<div style="width: 70%">question</div>
                    </a>
              </h4>

            </div>
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                 <h4 class="panel-title">
                    <a href="#" class="ing">
                   		<div style="width: 30%">장학금</div>
                   		<div style="width: 70%">question</div>
                    </a>
              </h4>

            </div>
            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                 <h4 class="panel-title">
                    <a href="#" class="ing">
                   		<div style="width: 30%">장학금</div>
                   		<div style="width: 70%">question</div>
                    </a>
              </h4>

            </div>
            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Answer</span></h5>

                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. </p>
                </div>
            </div>
        </div>
       </div>
       <div id="searchDiv">
			<form class="form-inline md-form mr-auto mb-4" id="searchFrm">
			  <input class="form-control mr-sm-2" type="text" placeholder="검색" aria-label="Search">
			  <button class="btn aqua-gradient btn-rounded btn-sm my-0" type="submit" id="searchBt">검색</button>
			</form>
    	</div>
    	</div>
    <!--/panel-group-->
    

<%@ include file="../../inc/bottom.jsp"%>