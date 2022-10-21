<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
<title>�������� ���</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">


<script type="text/javascript"><%-- javaScript, JQuery ���� --%>
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	function fncAddNotice() {

		var title = $("textarea[name='noticeTitle']").val();
		var content = $("textarea[name='noticeContent']").val();
		var image = $("textarea[name='noticeImage']").val();
		var image = $("input[name='noticeImage']").val();

		if (title == null || title.length < 1) {
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (content == null || content.length < 1) {
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}

		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/addNotice").submit();
	} //funtion AddNotice ��

	$(function() {

		$("button:contains('���')").bind("click", function() {
	
			fncAddNotice();
		});

		$("button:contains('�ڷ�')").bind("click", function() {

		location.href = "/serviceCenter/getNoticeList";
		})

	});
</script>
<style><%--CSS �߰� --%>
textarea {
	resize: none;
}

.noticeTitle {
	width: 500px;
	height: 50px;
}

.content {
	margin-top: -30px;
}
.custom-btn {
  margin: 5px;
  width: 80px;
  height: 30px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: none !important;
  box-shadow:none !important;
  outline: none;
}
.btn-13 {
  background-color: #1528d7;
background-image: linear-gradient(315deg, #08165c  0%, #293b7a 74%);
  border: none;
  z-index: 1;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #2491b7;
  background-image: linear-gradient(315deg, #2491b7 0%, #2491b7 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover {
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
}
</style>
</head>

<body>

	<jsp:include page="/toolbar.jsp" />
	<!-- form Start /////////////////////////////////////-->
	<div class="page-header" align="center"
		style="transform: translate(-316px, 38px);">
		<h2>�������� ���</h2>
	</div>
	<div class="container">
		<div></div>
		<div class="page-header text-center"></div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId" value="${user.userId}">

			<div class="form-group">
				<strong>����</strong> <label for="title"></label>
				<div class="col-sm-4">
					<textarea class="noticeTitle" id="noticeTitle" name="noticeTitle" value=""
						maxlength="80" placeholder="������ �Է����ּ���"></textarea>


				</div>
			</div>
			<strong>����</strong>
			<div class="form-group">
				<label for="content" class="col-sm-offset-1 col-sm-3 control-label"></label>
				<div class="col-sm-4">
					<textarea class="content" id="noticeContent" name="noticeContent" value=""
						placeholder="������ �Է����ּ���." maxlength="500"
						style="width: 500px; height: 500px;"></textarea>
				</div>
			</div>

			<label for="noticeImage"
				class="col-sm-offset-1 col-sm-3 control-label"><strong>÷������</strong></label>
			<div class="col-sm-4">
				<input multiple="multiple" type="file" name="image" id="file"
					class="ct_input_g" style="width: 200px; height: 50px" />


			</div></form>
			<span id="helpBlock" class="help-block"> <strong
				class="text-danger">������ 2����� �����մϴ�.</strong>
			</span>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="custom-btn btn-13"
						style="transform: translate(0px, 0px);">���</button>
					<button class="custom-btn btn-13"
						style="transform: translate(0px, 0px);">�ڷ�</button>
				</div>
			</div>
		


	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>