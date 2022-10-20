<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>공지사항 등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>


<script type="text/javascript">
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	function fncAddNotice() {

		var title = $("input[name='noticeTitle']").val();
		var content = $("input[name='noticeContent']").val();
		var image = $("input[name='noticeImage']").val();

		if (title == null || title.length < 1) {
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if (content == null || content.length < 1) {
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}

		$($("form")[0]).attr("method", "POST").attr("action",
				"/serviceCenter/addNotice").submit();
	} //funtion AddNotice 끝

	$(function() {

		$("button:contains('등록')").bind("click", function() {

			fncAddNotice();
		});

		$("button:contains('뒤로')").bind("click", function() {

			history.go(-1);
		})

	});
</script>

</head>

<body>


	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">공 지 사 항 등 록</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
				<input type="hidden" name="userId" id="userId" value="${user.userId}">
			<div class="form-group">
				<label for="noticeTitle"
					class="col-sm-offset-1 col-sm-3 control-label">제목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="noticeTitle"
						name="noticeTitle"> <span id="helpBlock"
						class="help-block"> </span>
				</div>

			</div>

			<div class="form-group">
				<label for="noticeContent"
					class="col-sm-offset-1 col-sm-3 control-label">내 용</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="noticeContent"
						name="noticeContent">
				</div>
			</div>

			<label for="noticeImage"
				class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
			<div class="col-sm-4">
				<input multiple="multiple" type="file" name="image"
					class="ct_input_g" style="width: 200px; height: 19px"
					maxLength="13" />

			</div>
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">사진은 2장까지 가능합니다.</strong>
			</span>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-primary">뒤로</button>
		</div>
	</div>
	</form>


	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>