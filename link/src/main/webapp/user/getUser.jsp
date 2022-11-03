<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->

<style type="text/css">
.row1 {
	display: flex;
}

.container {
	border: solid 2px rgb(179, 207, 249);
	border-radius: 10px;
	background: #ecf4ff;
}

.col-xs-8.col-md-4 {
	margin-left: 30px;
}

.col-xs-4.col-md-2 {
	border-radius: 10px;
	text-align: center;
	background-color: #e9e9e9;
}

button:hover {
	border-style: hidden;
	background-color: #5F0080;
	color: white;
	border-radius: 10px;
	font-weight: bold;
	border: solid 2px white;
}

button {
	background-color: white;
	border: solid 2px #5F0080;
	border-radius: 10px;
	color:;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#update").on("click", function() {
			self.location = "/user/updateUser?userId=${getUser.userId}";
		});
		$("#out").on("click", function() {
			swal.fire({
				title : "Ż���Ͻðڽ��ϱ�?",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: 'Ż��',
				cancelButtonText: '���'
			}).then((result) =>{
				if (result.isConfirmed){
				self.location = "/user/deleteUser?userId=${getUser.userId}";
				}
			})
		});
	});
	/*
	$(function() {
	$.ajax("/user/json/getUser", {
		type : "POST",
		data : JSON.stringify({
			userId : $("#userId").html()
	 	}),
			dataType : "json",
		contentType : "application/json",
		header : {
			"Accept" : "application/json"
		},
		success : function(Data, status) {
		
			console.log(Data.rrn);
		}
	});
	})
	 */
</script>
</head>

<body style="background-color: #EBEDF0;">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/sideToolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="margin-left: 400px;">
		<div style="margin-left: 200px;">
			<div class="page-header text-left">
				<c:if test="${fn:trim(user.role) == '0'}">
					<h3 class=" text-info">����������</h3>
				</c:if>
				<c:if test="${fn:trim(user.role) == '1'}">
					<h3 class=" text-info">ȸ����������</h3>
				</c:if>
			</div>
			<div class="row1">
				<div class="col-xs-4 col-md-2">
					<strong>�� �� �� </strong>
				</div>
				<div class="col-xs-8 col-md-4" id="userId">${getUser.userId}</div>
			</div>

			<hr />

			<div class="row1">
				<div class="col-xs-4 col-md-2 ">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">${getUser.name}</div>
			</div>

			<hr />

			<div class="row1">
				<div class="col-xs-4 col-md-2 ">
					<strong>����</strong>
				</div>
				<div class="col-xs-8 col-md-4">${getUser.gender}</div>
			</div>

			<hr />

			<div class="row1">
				<div class="col-xs-4 col-md-2 ">
					<strong>�ֹι�ȣ</strong>
				</div>
				<div class="col-xs-8 col-md-4">${ getUser.rrn }</div>
			</div>

			<hr />

			<div class="row1">
				<div class="col-xs-4 col-md-2 ">
					<strong>�޴���ȭ��ȣ</strong>
				</div>
				<div class="col-xs-8 col-md-4">${ getUser.phoneNo }</div>
			</div>

			<hr />

			<div class="row1">
				<div class="col-xs-4 col-md-2">
					<strong>�� �� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">${getUser.email}</div>
			</div>

			<hr />

			<c:if test="${ fn:trim(user.role) == '0' }">
				<div class="row1">
					<div class="col-xs-4 col-md-2 ">
						<strong>�����Ű�Ƚ��</strong>
					</div>
					<div class="col-xs-8 col-md-4">${getUser.reportCount}</div>
				</div>
			</c:if>

			<c:if test="${ fn:trim(user.role) == '1' }">
				<div class="row1">
					<div class="col-xs-4 col-md-2 ">
						<strong>��������</strong>
					</div>
					<div class="col-xs-8 col-md-4">${fn:trim(getUser.penaltyType) == '0' ? '-' : ''}</div>
					<div class="col-xs-8 col-md-4">${fn:trim(getUser.penaltyType) == '1' ? '����' : ''}</div>
					<div class="col-xs-8 col-md-4">${fn:trim(getUser.penaltyType) == '2' ? '��������' : ''}</div>
				</div>

				<hr />

				<div class="row1">
					<div class="col-xs-4 col-md-2 ">
						<strong>�����Ⱓ</strong>
					</div>
					<div class="col-xs-8 col-md-4">${ ! empty getUser.stopStartDate? getUser.stopStartDate : ''}
						- ${ ! empty getUser.stopEndDate ? getUser.stopEndDate : '' }</div>
				</div>

			</c:if>

			<div class="row1" style="margin-left: -194px; margin-top: 20px;">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="update"
						style="font-weight: bold; font-size: medium;">�� &nbsp;��</button>
					<c:if test="${fn:trim(user.role) == '0'}">
						<button type="button" id="out"
							style="font-weight: bold; font-size: medium;">ȸ��Ż��</button>
					</c:if>
				</div>

				<br /> <br /> <br />
			</div>
		</div>

	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<br />
	<br />
</body>

</html>