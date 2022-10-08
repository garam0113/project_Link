<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<script type="text/javascript">
	$(function() {
		$("button[type='button']").on("click", function() {
			$("form").attr("method", "POST").attr("action", "/user/updateProfile").submit();
		});
	});
</script>
</head>

<body>
<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Link</a>
		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">프로필작성</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" class="form-control" id="userId" name="userId" value="${ user.userId }">
			<div class="form-group">
				<label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickName" name="nickName"
						placeholder="중복확인하세요"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">특수문자&nbsp;사용&nbsp;불가,&nbsp;1~10자</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
				<div class="col-sm-4">
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="성별" value="남자">&nbsp;남자
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="성별" value="여자">&nbsp;여자
				</div>
			</div>

			<div class="form-group">
				<label for="area1"
					class="col-sm-offset-1 col-sm-3 control-label">활동영역</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="area1"
						name="area1" placeholder="활동영역">
					<input type="text" class="form-control" id="area2"
						name="area2" placeholder="활동영역">
					<input type="text" class="form-control" id="area3"
						name="area3" placeholder="활동영역">
				</div>
			</div>

			<div class="form-group">
				<label for="categoty1"
					class="col-sm-offset-1 col-sm-3 control-label">관심카테고리</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="categoty1"
						name="categoty1" placeholder="카테고리">
					<input type="text" class="form-control" id="categoty2"
						name="categoty2" placeholder="카테고리">
					<input type="text" class="form-control" id="categoty3"
						name="categoty3" placeholder="카테고리">
				</div>
			</div>

			<div class="form-group">
				<label for="profileWriting" class="col-sm-offset-1 col-sm-3 control-label">프로필글</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="profileWriting"
						name="profileWriting" placeholder="프로필글">
				</div>
			</div>

			<div class="form-group">
				<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">프로필사진</label>
				<div class="col-sm-4">
					<input type="file" class="form-file" id="profileImage" name="profileImage"
						placeholder="프로필사진">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등 &nbsp;록</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>