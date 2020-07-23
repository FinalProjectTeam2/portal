<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<%@ include file="inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jsPDF-1.3.2/libs/html2canvas/dist/html2canvas.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#pdfDown").click(function(){
			html2canvas(document.getElementById("cont"),{
				onrendered:function(canvas){
					var imgData = canvas.toDataURL('image/png');
					console.log('Report Image URL:'+imgData);
					var doc = new jsPDF('p', 'mm', [297, 210]);
					doc.addImage(imgData, 'PNG', 0, 10, 210, 250);
					doc.save('sample-file.pdf');
				}
			});
		});

	});
</script>

<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div id="cont">
	<div class="container">
		<input type="button" value="pdf저장" id="pdfDown">
		<div style="overflow: hidden;">
			<div class="indexDOM_large">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>

			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_large">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			<div class="indexDOM_small">
				<h1 class="mt-1">Sticky footer with fixed navbar</h1>
				<p class="lead">
					Pin a footer to the bottom of the viewport in desktop browsers with
					this custom HTML and CSS. A fixed navbar has been added with
					<code>padding-top: 60px;</code>
					on the
					<code>main &gt; .container</code>
					.
				</p>
				<p>
					Back to <a href="/docs/4.5/examples/sticky-footer/">the default
						sticky footer</a> minus the navbar.
				</p>
			</div>
			</div>
		</div>
		<%@ include file="inc/bottom.jsp"%>
