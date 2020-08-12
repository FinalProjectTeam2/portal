<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
.privacy {
    padding: 5%;
    margin: 2% 2%;
    font-family: '나눔고딕', NanumGothic;
    font-size: 13px;
    border: 2px solid gray;
    width: 330px;
    height: 430px;
}

.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 5px 14px;
  font-size: 14px;
  cursor: pointer;
  text-align: center;
}

.btn:hover {
  background-color: RoyalBlue;
}

select, input, label {
    margin: 0;
    padding: 0;
    font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', sans-serif;
    font-size: 12px;
    color: #666
}

.email {
	text-align: center;
}
.date {
	margin-top: 10%;
	text-align: right;
}

#contents {
	margin-top: 5%;
}

</style>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/livescript">
    $(function () {
        $('.btn').on('click',function(){
            window.close();
        })
    })
</script>

<div class="privacy">
	<div class="email">
        <p id="title"><h3>이메일 무단수집 거부</h3></p>
        <p id="contents">본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>
       	  이를 위반시 <span>정보통신망법에 의해 형사처벌됨</span>을 유념하시기 바랍니다.</p>
	</div>
	<div class="date">
        <p>게시일 2020년 7월 22일</p>
	</div>
	<div class="btn">
		<button class="btn"><i class="fa fa-close"></i> Close</button>
	</div>
</div>