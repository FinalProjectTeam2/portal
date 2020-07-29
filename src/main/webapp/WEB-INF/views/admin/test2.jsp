<script type="text/javascript">
	//ajax 학과 검색
	$('#faculty').change(
			function() {
				$('#department').find('option').each(function() {
					$(this).remove();
				});
				$('#department').append("<option value=''>선택</option>");

				var faculty = $(this).val();
				if (faculty != "") {

					$.ajax({
						type : 'get',
						url : "<c:url value='/common/departmentList'/>",
						data : "facultyNo=" + $('#faculty').val(),
						dataType : "json",
						success : function(res) {
							$(res).each(
									function(i) {
										$('#department').append(
												"<option value=\""+
								res[i].depNo+"\">"
														+ res[i].depName
														+ "</option>");
									});
						},
						error : function(xhr) {
							console.log(xhr.responseTest);
							alert("오류");
							return;
						}

					})
				}
			});
</script>
<div class="stud faculty form-group">
	<div>
		<label for="faculty">학부</label> <select name="facultyNo" id="faculty">
			<option value="">선택</option>
			<c:forEach var="facVo" items="${facultyList }">
				<option value="${facVo.facultyNo }">${facVo.facultyName }</option>
			</c:forEach>
		</select>
	</div>
</div>
<div class="stud department form-group">
	<div>
		<label for="depNo">학과</label> <select name="depNo" id="department">
			<option value="">선택</option>
		</select>
	</div>
</div>