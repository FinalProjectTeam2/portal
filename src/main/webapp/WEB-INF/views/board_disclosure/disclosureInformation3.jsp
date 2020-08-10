<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
.div {
	width: 1280px;

}
.div1, .div2, .div3, .div4, .div5, .div6  {
	border: 1px solid silver;
	width: 420px;
	height: 180px;
}

.list {
	list-style: none;
	
}
.count {
	text-align: right;
}

hr {
	color: silver;
	width: 85%;
}

.div1 {
	float: left;
	margin: 1.5% 1.5% ;
}

.div2 {
	float: left;
	margin: 1.5% 1.65% ;
}

.div3 {
	float: left;
	margin: 1.5% 1.70% ;

}

.div4 {
	float: left;
	margin: 2% 1.5% ;

}

.div5 {
	float: left;
	margin: 2% 1.65% ;

}

.div6 {
	float: left;
	margin: 2% 1.70% ;

}

.noti-value {
	font-size: 0.7em;
	text-align: right;
}
</style>

<div class="div">
<div class = "div1">
	<div class="title">
		<strong>재학생 충원율</strong><br>
		<span>(정원내 재학생수/(학생정원-학생모집정지인원)×100%)</span><hr><br>
	</div>
	<div class="list-group">
	   	<ul class="list">	                                                                                                      
	        <li><span class="stitle">전체 재학생수</span><span class="count">  11,811 명</span></li>                                                          
	        <li><span class="stitle">학생정원</span><span class="count">   9,192 명</span></li>
	        <li><span class="stitle">학생모집정지인원</span><span class="count">       0 명</span></li>
	        <li><span class="stitle">충원율 (정원내)</span><span class="count"> 109.0 %</span></li>                                                          
	    </ul>
	</div>
</div>

<div class = "div2">
	<div class="title">
		<strong class="title">취업률</strong>
		<span class="desc">(취업자수/(졸업자수-제외자수)×100%)<hr></span>                                                       
	</div>
    <div class="list-group">
    	<ul class="list">	       
	        <li><span class="stitle">졸업자수</span><span class="count">   2,388 명</span></li>
	        <li><span class="stitle">취업자수</span><span class="count">   1,383 명</span></li>
	        <li><span class="stitle">제외자수</span><span class="count">     243 명</span></li>
	        <li><span class="stitle">취업률</span><span class="count">  64.5 %</span></li> 
    	</ul>
    </div>
	<div class="info-noti">
		<span class="noti-value">자료기준일: 2018. 12. 31</span>
	</div>
</div>

<div class = "div3">
	<div class="title">                 		
		<strong class="title">신입생 충원율</strong>
        <span class="desc">(정원내 입학자수/모집인원×100%)<hr></span>                                                        
    </div>
    <div class="list-group">
    	<ul class="list">
	        <li>
		       	<span class="stitle">전체 입학자수</span><span class="count">2,590 명</span>
	        </li>
	        <li>
		       	<span class="stitle">정원내 입학자수</span><span class="count">   2,278 명</span>
	        </li>	                                          
	        <li>
		       	<span class="stitle">모집인원</span><span class="count">   2,599 명</span>
	        </li>
	        <li>
		       	<span class="stitle">충원율 (정원내)</span><span class="count">  99.9 %</span>
	        </li>                                                                                                                    
		</ul>
	</div>
    <div class="info-noti">
    	 <span class="noti-value">자료기준일: 2019년 3월 학기 신입생</span>
    </div>
</div>
                    
<div class="div4">
	<div class="title">        
		<strong class="title">학생 1인당 교육비</strong>
		<span class="desc">(총교육비/재학생수)<hr></span>                                                       
    </div>
    <div class="list-group">
    	<ul class="list">    
	        <li>
	        	<span class="stitle">총교육비</span><span class="count" style="max-width:45%;"> 359,007,011,022 원</span>
	        </li>
	        <li>
	         <span class="stitle">재학생수</span><span class="count" style="max-width:45%;">26,823 명</span>
	        </li>
	        <li>
	        	<span class="stitle">학생 1인당 교육비</span><span class="count" style="max-width:45%;">13,384,297.5 원</span>
	        </li>                                                                 
	      </ul>
	 </div>
     <div class="info-noti">
     	<span class="noti-value">자료기준일: 2018년 결산, 재학생 : 2019. 4. 1. 학부+대학원</span>
     </div>
</div>
          
<div class="div5">
	<div class="title">         
    	<strong class="title">전임교원 확보율</strong>
    	<span class="desc">(전임교원수/교원 법정정원×100%)<hr></span>                                         
    </div>
    <div class="list-group">
    	<ul class="list">   
			<li>
				<span class="stitle">전임교원수(재학생기준)</span>
				<span class="count">     488 명</span>
			</li>
            <li>
	            <span class="stitle">재학생수</span>
	            <span class="count">  15,845 명</span>
            </li>
            <li>
	      		<span class="stitle">교원 법정정원(재학생기준)</span>
	      		<span class="count">     711 명</span>
            </li>
            <li>
            	<span class="stitle">전임교원 확보율(재학생기준)</span>
            	<span class="count">  68.64 %</span>
            </li>   
         </ul>
      </div>
      <div class="info-noti">
      		<span class="noti-value">자료기준일: 2019. 4. 1. 학부+대학원</span>
      </div>
</div>
     
<div class="div6">
	<div class="title">         
		<strong class="title">학생 1인당 장학금</strong>
		<span class="desc">(장학금총액/재학생수)<hr></span>                                                        
    </div>
    <div class="list-group">
    	<ul class="list">                     
	   		<li>
	   			<span class="stitle">재학생수</span>
	   			<span class="count" style="max-width:35%;">11,285 명</span>
	   		</li>
	        <li>
	        	<span class="stitle">장학금 총액</span>
	        	<span class="count" style="max-width:45%;">35,844,035,540 원</span>
	        </li>
	        <li>
	        	<span class="stitle">교내 + 사설 및 기타</span>
	        	<span class="count" style="max-width:45%;">16,829,790,470 원</span>
	        </li>
	        <li>
	        	<span class="stitle">학생 1인당 장학금</span>
	        	<span class="count" style="max-width:45%;">3,176,254.8 원</span>
	        </li>      
	   </ul>
    </div>    
    <div class="info-noti">
        <span class="noti-value">자료기준일: 2018년 기준, 재학생 : 2018. 4. 1., 10. 1. 합계/2 </span>
    </div>
</div>
</div>