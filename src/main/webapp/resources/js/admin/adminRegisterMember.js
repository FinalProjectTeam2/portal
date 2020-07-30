$(function() {
	$(function() {
		// ajax 학과 검색
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
					}
				});
	});
	$('#btRegi')
			.click(
					function() {
						var sort = $('#sort').val();
						if (sort == 1) {
							check();
							$('#form')
									.prop("action",
											"/portal/admin/member/adminRegisterEmployee");
						} else if (sort == 2) {
							check();
							$('#form')
									.prop("action",
											"/portal/admin/member/adminRegisterProfessor");
						} else if (sort == 3) {
							check();
							$('#form')
									.prop("action",
											"/portal/admin/member/adminRegisterStudent");
						} else if (sort == null) {
							alert('회원구분을 선택해주세요');
							$('#sort').focus();
							event.preventDefault();
						}
					});

	function check() {
		if ($('#name').val() == "") {
			alert('이름을 입력해주세요');
			$('#name').focus();
			event.preventDefault();
		} else if ($('#SSN').val() == "") {
			alert('주민번호를 입력해주세요');
			$('#SSN').focus();
			event.preventDefault();
		} else if ($('#hp1').val() == "") {
			alert('전화번호를 입력해주세요');
			$('#hp1').focus();
			event.preventDefault();
		} else if ($('#hp2').val() == "") {
			alert('전화번호를 입력해주세요');
			$('#hp2').focus();
			event.preventDefault();
		} else if ($('#hp3').val() == "") {
			alert('전화번호를 입력해주세요');
			$('#hp3').focus();
			event.preventDefault();
			/*
			 * }else if($('#depCode').val() == null){ alert('부서를 선택해주세요');
			 * $('#depCode').focus(); event.preventDefault(); }else
			 * if($('#authCode').val() == null){ alert('권한을 선택해주세요');
			 * $('#authCode').focus(); event.preventDefault(); }else
			 * if($('#positionCode').val() == null){ alert('직책을 선택해주세요');
			 * $('#positionCode').focus(); event.preventDefault();
			 */
		} else if (!validate_number($('#hp1').val())
				|| !validate_number($('#hp2').val())
				|| !validate_number($('#hp3').val())) {
			alert('전화번호는 숫자만 가능합니다.');
			$('#hp1').focus();
			event.preventDefault();
		} else if (!validate_number($('#SSN').val())) {
			alert('주민번호는 숫자만 가능합니다.');
			$('#SSN').focus();
			event.preventDefault();
		}
	}
	// 이메일 직접입력
	$('#email2').change(function() {
		if ($(this).val() == 'etc') {
			$('#email3').val('');
			$('#email3').css('visibility', 'visible');
			$('#email3').focus();
		} else {
			$('#email3').css('visibility', 'hidden');
			$('#email3').val('');
		}
	});
	// 숫자만 입력가능
	function validate_number(number) {
		var pattern = new RegExp(/^[0-9]*$/);
		return pattern.test(number);
	}

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
			$('.prof').css('display', 'block');
			$('.prof select').val("");
		} else {
			$('.prof').css('display', 'none');
		}
	});

	
	
});