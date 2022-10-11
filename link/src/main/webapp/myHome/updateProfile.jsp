<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">�������ۼ�</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			<input type="hidden" class="form-control" id="userId" name="userId" value="${ user.userId }">
			<div class="form-group">
				<label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickName" name="nickName"
						placeholder="�ߺ�Ȯ���ϼ���"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">Ư������&nbsp;���&nbsp;�Ұ�,&nbsp;1~10��</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="����" value="����">&nbsp;����
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="����" value="����">&nbsp;����
				</div>
			</div>

			<div class="form-group">
				<label for="area1"
					class="col-sm-offset-1 col-sm-3 control-label">Ȱ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="area1"
						name="area1" placeholder="Ȱ������">
					<input type="text" class="form-control" id="area2"
						name="area2" placeholder="Ȱ������">
					<input type="text" class="form-control" id="area3"
						name="area3" placeholder="Ȱ������">
				</div>
			</div>

			<div class="form-group">
				<label for="categoty1"
					class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="categoty1"
						name="categoty1" placeholder="ī�װ�">
					<input type="text" class="form-control" id="categoty2"
						name="categoty2" placeholder="ī�װ�">
					<input type="text" class="form-control" id="categoty3"
						name="categoty3" placeholder="ī�װ�">
				</div>
			</div>

			<div class="form-group">
				<label for="profileWriting" class="col-sm-offset-1 col-sm-3 control-label">�����ʱ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="profileWriting"
						name="profileWriting" placeholder="�����ʱ�">
				</div>
			</div>

			<div class="form-group">
				<label for="profileImage" class="col-sm-offset-1 col-sm-3 control-label">�����ʻ���</label>
				<div class="col-sm-4">
					<input type="file" class="form-file" id="profileImage" name="profileImage"
						placeholder="�����ʻ���">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>
</html>