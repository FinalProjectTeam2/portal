<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- main 끝 -->
<style type="text/css">
a.top {
	position: fixed;
	left: 96%;
	bottom: 150px;
}

a.bottom {
	position: fixed;
	left: 96%;
	bottom: 100px;
}

#scrolling a svg {
	color: #28a745;
}
</style>

<script type="text/javascript">
	$(function() {

		//$('.top').hide();

		$("html").scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('.top').fadeIn(300);
			} else {
				$('.top').fadeOut(300);
			}

			var scrollTop = $(this).scrollTop();
			var innerHeight = $(this).innerHeight();
			var scrollHeight = $(this).prop('scrollHeight');

			if (scrollTop + innerHeight >= scrollHeight-100) {
				$(".bottom").fadeOut(300);
				return false;
			} else {
				$(".bottom").fadeIn(300);
				return false;
			}
		});

		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : '0'
			}, 400);
			return false;
		});
		$('.bottom').click(function() {
			$('html, body').animate({
				scrollTop : $(document).height()
			}, 500);
			return false;
		});
	}); /*  $('html, body').scrollTop( $(document).height() ); */
</script>
<div id="scrolling">
	<a href="#" class="top"> <svg width="2em" height="2em"
			viewBox="0 0 16 16" class="bi bi-arrow-up-square-fill"
			fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 <path fill-rule="evenodd"
				d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 8.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
	</svg>
	</a> <a href="#" class="bottom"> <svg width="2em" height="2em"
			viewBox="0 0 16 16" class="bi bi-arrow-down-square-fill"
			fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 		 <path fill-rule="evenodd"
				d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
		</svg>
	</a>
</div>
</div>
</main>
<!-- footer 시작 -->
<footer class="footer mt-auto py-3">
	<div class="container">
		<div class="foot_inner text-muted">
			<div class="footer_menu"
				style="overflow: hidden; margin: 5px 0 10px 0;">
				<ul style="float: left;">
					<li>원격지원 <a href=" http://ezh.kr/dku/" target="_blank"
						title="원격지원 새 창으로 이동">(죽전</a> | <a href="http://ezh.kr/dku2/"
						target="_blank" title="원격지원 새 창으로 이동">천안)</a>
					</li>
				</ul>
				<h4 style="float: right;">통합콜센터 : 1899-3700</h4>
			</div>
			<div class="foot_address">
				죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119
				(우)31116 / <a href="http://www.dankook.ac.kr/web/kor/privacy"
					target="_blank">개인정보처리방침</a>
			</div>
			<div class="foot_copyright">Copyright(c) 2015 BY DANKOOK
				UNIVERSITY. All rights reserved.</div>
		</div>
	</div>
</footer>
<!-- footer 끝 -->
</body>
</html>
