$(function() {
	// ajax 학과 검색
	$('#faculty').change(
			function() {
				$('#department').find('option').each(function() {
					$(this).remove();
				});

				var faculty = $(this).val();
				if (faculty != "") {
					$('#department').append("<option value=''>선택</option>");
					$.ajax({
						type : 'get',
						url : "/portal/common/departmentList",
						data : "facultyNo=" + $('#faculty').val(),
						dataType : "json",
						success : function(res) {
							$(res).each(
									function(i) {
										$('#department').append(
												"<option value=\""
														+ res[i].depNo + "\">"
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
				}else{
					$('#department').append("<option value=''>학부를 선택하세요</option>");
				}
			});

	// 등록 구분 시 입력창
	$('select[name=sort]').change(function() {
		if ($('select[name=sort]').val() == 1) {
			$('.emp').css('display', 'block');
			$('.emp select').val("");
			$('.stud').css('display', 'none');
		} else {
			$('.emp').css('display', 'none');
			$('.stud').css('display', 'block');
			$('.stud select').val("");
		}
		if ($('select[name=sort]').val() == 2) {
			$('.prof').css('display', 'inline-block');
			$('.prof').val("");
		} else {
			$('.prof').css('display', 'none');
		}
	});
	$('#btMultiDel').click(
			function() {
				var len = $('tbody input[type=checkbox]:checked').length;
				if (len == 0) {
					alert('삭제하려는 회원을 먼저 체크하세요');
					return;
				}

				$('form[name=frmList]').prop("action",
						"<c:url value='/admin/product/deleteMulti.do'/>");
				$('form[name=frmList]').submit();
			});

	$("input[name=chkAll]").click(function() {
		$('tbody input[type=checkbox]').prop('checked', this.checked);
	});


});// document.ready

function boardList(curPage) {
	$("input[name=currentPage]").val(curPage);
	$('form[name=frmPage]').submit();
}