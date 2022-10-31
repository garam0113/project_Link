<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>공지사항 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">


<script type="text/javascript"><%-- javaScript, JQuery 시작 --%>
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	function fncAddNotice() {

		var title = $("textarea[name='noticeTitle']").val();
		var content = $("textarea[name='noticeContent']").val();
		var image = $("textarea[name='noticeImage']").val();
		var image = $("input[name='noticeImage']").val();

		if (title == null || title.length < 1) {
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		if (content == null || content.length < 1) {
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}

		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/addNotice").submit();
	} //funtion AddNotice 끝

	$(function() {

		$("button:contains('등록')").bind("click", function() {
	
			fncAddNotice();
		});

		$("button:contains('뒤로')").bind("click", function() {

		location.href = "/serviceCenter/getNoticeList";
		})

	});
</script>
<style><%--CSS 추가 --%>
.row {
	margin-left : 0px !important;
	    display: inherit;
}
textarea {
	resize: none;
}
.body{
background-color: #EBEDF0 !important;
}
.noticeTitle {
	width: 500px;
	height: 50px;
}

.content {
	margin-top: -30px;
}
.btn-13 {
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background-color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: solid 2px;
  box-shadow:none !important;
  outline: none;
  box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
  border-radius: 10px;
  padding: 10px;
  color: #5F0080 !important;
  font-size: 16px !important;
  text-align: center;
}

.btn-13:hover { 
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

</style>
</head>

<body style="margin-left:470px;">

	<jsp:include page="/toolbar.jsp" />
	<!-- form Start /////////////////////////////////////-->
	<div class="page-header" align="center"
		style="transform: translate(-316px, 38px);">
		<h2>공지사항 등록</h2>
	</div>
	<div class="container">
		<div></div>
		<div class="page-header text-center"></div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId" value="${user.userId}">

			<div class="form-group">
				<strong>제목</strong> <label for="title"></label>
				<div class="col-sm-4">
					<textarea class="noticeTitle" id="noticeTitle" name="noticeTitle" value=""
						maxlength="80" placeholder="제목을 입력해주세요"></textarea>


				</div>
			</div>
			<strong>내용</strong>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<textarea class="content" id="noticeContent" name="noticeContent" value=""
						placeholder="내용을 입력해주세요." maxlength="500"
						style="width: 500px; height: 500px;"></textarea>
				</div>
			</div>

			<label for="noticeImage"
				class="col-sm-offset-1 col-sm-3 control-label"><strong>첨부파일</strong></label>
			<div class="col-sm-4">
				<input multiple="multiple" type="file" name="image" id="file"
					class="ct_input_g" style="width: 200px; height: 50px" />


			</div></form>
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">사진은 2장까지 가능합니다.</strong>
			</span>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="custom-btn btn-13"
						style="transform: translate(75px, 0px);">등록</button>
					<button class="custom-btn btn-13"
						style="transform: translate(75px, 0px);">뒤로</button>
				</div>
			</div>
		


	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>