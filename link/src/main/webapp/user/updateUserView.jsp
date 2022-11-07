<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootsdivap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootsdivap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-diveme.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/divemes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}

fieldset {
	border: 0;
}

label {
	display: block;
	margin: 30px 0 0 0;
}

.overflow {
	height: 200px;
}

/* .container {
	border: solid 2px rgb(179, 207, 249);
	border-radius: 10px;
	background: #ecf4ff;
	width: 1150px;
} */

.group {
	display: flex;
}

.title {
	width: 140px;
	text-align: center;
	padding: 10px;
	background-color: #e9e9e9; 
	border-radius: 10px;
}

.value {
	width: 280px;
	margin-left: 40px;
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
	border-radius: 20px; 
	color:;
}
</style>

<script type="text/javascript">
    
	$(function() {
		$("#update").on("click", function() {
			fncUpdateUser();
		});
			
		$("#phoneChange").on("click", function() {
			$('#modalPhone').modal('show');
		});

		$("#cancel").on("click", function() {
			history.back();
		});
	});	
	
    function fncUpdateUser() {
    		
    		var pw = $("#password").val();
    		var pw2 = $("#password2").val();
    		var email = $("#email").val();
    		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    		var regExp = /^[a-z0-9_]{4,20}$/;
    		var penalty = $("#penalty").val();
    		var stopEndDate = $("#stopEnd").val();
    		
    		console.log("�г�Ƽ �� : "+penalty);
    		//console.log("���� ��¥ : "+stopEnd.datepicker({ dateFormat: 'yy-mm-dd' }));
    		
    		if(${user.role == '0'} && (pw == null || pw.length < 1)){
    			swal.fire("��й�ȣ�� �Է��ϼž� �մϴ�.");
    			return;
    		}
    		
    		if(${user.role == '0'}){
    		
    			if(6 > pw.length || pw.length > 12){
    				swal.fire("��й�ȣ�� ����, �������� 6~12�� �Դϴ�.");
    				return;
    			}
    		
    			if(!regExp.test(pw)){
    				swal.fire("��й�ȣ�� ����, �������� 6~12�� �Դϴ�.");
    				return;
    			}
    			
    			if(pw != pw2){
    				swal.fire("��й�ȣ�� �ٸ��ϴ�.");
    				return;
    			}
    				
    			if(email == null || email.length < 1){
    				swal.fire("�̸����� �Է��ϼž� �մϴ�.");
    				return;
    			}
    		
    			if(!regEmail.test(email)){
    				swal.fire("�̸����� ����� �Է����ּ���.");
    				return;
    			}
    		
    		}
/*
    		$.ajax("/userRest/json/updatePenalty", {
    			type : "POST",
    			data : JSON.sdivingify({
    				penaltyType : penalty,
    				stopEndDate : stopEnd
    			}),
    			dataType : "json",
    			contentType : "application/json",
    			headers : {
    				"Accept" : "application/json"
    			},
    			success : function(Data, status) {
					console.log("update�� �г�Ƽ �� : "+Data.penaltyType)
					console.log("update�� ������¥ : "+Data.stopEndDate)
				}
    		});
    */	    
    		$("form").attr("method", "POST").attr("action", "/user/updateUser").submit();
		}
    
    function popup(){
        var url = "/user/updatePhoneNoView.jsp";
        var name = "updatePhoneNoView";
        var option = "width = 800, height = 300, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
    
    $.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '���� ��',
		nextText : '���� ��',
		monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��',
				'10��', '11��', '12��' ],
		monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��',
				'9��', '10��', '11��', '12��' ],
		dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
		dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
		dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
		showMonthAfterYear : true,
		yearSuffix : '��'
	});

	$(function() {
		$("#stopEndDateString").datepicker();
	});
    </script>

</head>
<body style="background-color: whitesmoke;">



	<%-- ///////////////////// ä�ÿ� �ʿ��� �ڵ� //////////////////////// --%>
	<%-- ä���� ���� ���� --%>
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
	<%-- ä�� js --%>
	<script src="/resources/javascript/chat/chat.js"></script>
	<%-- ä�� css --%>
	<link rel="stylesheet" href="/resources/css/chat/chat.css" type="text/css" media="screen" title="no title">
	<%-- ///////////////////// ä�ÿ� �ʿ��� �ڵ� //////////////////////// --%>
	
	
	
	<jsp:include page="/sideToolbar.jsp" />
	<form>
		<div class="wrap wd668" style="zoom: 1.2; margin-top: 80px; margin-left: 100px;">		
			<div class="container" style="margin-left: 0px;">
			
			
	
				<%-- chat.js���� ������ؼ� --%>
				<input type="hidden" id="session_userId" value="${ sessionScope.user.userId }">
				<input type="hidden" id="session_profileImage" value="${ sessionScope.user.profileImage }">
				<input type="hidden" id="session_nickName" value="${ sessionScope.user.nickName }">
				<%-- chat.js���� ������ؼ� --%>
				<%-- ä�� --%>
				<jsp:include page="/chat/chat.jsp" />
				<%-- ä�� --%>
			
			
			
				<div class="form_txtInput" style="margin-left: 200px;">
					<c:if test="${fn:trim(user.role) == '0'}">
						<h3 class=" text-info" style="color: #31708f; font-weight: bold;">����������>����������</h3>
					</c:if>
					<c:if test="${fn:trim(user.role) == '1'}">
						<h3 class=" text-info" style="color: #31708f; font-weight: bold;">ȸ����������</h3>
					</c:if>
					<div class="join_form">
						<div>
							<div style="margin-top: 40px;">
								<div class="group">
									<strong class="title">���̵�</strong>
									<div class="value">
										<input disabled="disabled" class="form-control" id="userId" 
											name="userId" style="background: none; border: none; font-weight: bold; " value="${getUser.userId }"> <input
											type="hidden" class="form-control" id="userId" name="userId"
											value="${getUser.userId }">
									</div>
								</div>
								<br/>
								<div class="group">
									<strong class="title">�̸�</strong>
									<div class="value">
										<input disabled="disabled" type="text" class="form-control" style="background: none; border: none; font-weight: bold; "
											id="name" name="name" value="${getUser.name}"> <input
											type="hidden" class="form-control" id="name" name="name"
											value="${getUser.name }">
									</div>
								</div>
								<br/>
								<div class="group">
									<strong class="title">����</strong>
									<div class="value">
										<input disabled="disabled" type="text" class="form-control" style="background: none; border: none; font-weight: bold; "
											id="gender" name="gender" value="${getUser.gender}">
										<input type="hidden" class="form-control" id="gender"
											name="gender" value="${getUser.gender }">
									</div>
								</div>
								<br/>
								<div class="group">
									<strong class="title">�ֹι�ȣ</strong>
									<div class="value">
										<input disabled="disabled" type="text" class="form-control" style="background: none; border: none; font-weight: bold; "
											id="rrn" name="rrn" value="${getUser.rrn}"> <input
											type="hidden" class="form-control" id="rrn" name="rrn"
											value="${getUser.rrn }">
									</div>
								</div>
								<br/>
								<c:if test="${fn:trim(user.role) == '0'}">
									<div class="group">
										<strong class="title">��й�ȣ</strong>
										<div class="value">
											<input type="password" class="form-control" id="password" style="font-weight: bold; "
												name="password" placeholder="�����й�ȣ"> <strong
												id="helpBlock" class="help-block" style="color: red;">
												����, ���� ���� 6~12�� </strong>
										</div>
									</div>
								<br/>
								</c:if>
								<c:if test="${fn:trim(user.role) == '0'}">
									<div class="group">
										<strong class="title">��й�ȣȮ��</strong>
										<div class="value">
											<input type="password" class="form-control" id="password2" style="font-weight: bold; "
												name="password2" placeholder="�����й�ȣ Ȯ��"> <strong
												id="helpBlock" class="help-block" style="color: red;">
												����, ���� ���� 6~12�� </strong>
										</div>
									</div>
								<br/>
								</c:if>
								<div class="group">
									<strong class="title">�̸���</strong>
									<div class="value">
										<c:if test="${fn:trim(user.role) == '0'}">
											<input type="text" class="form-control" id="email" style="font-weight: bold; "
												name="email" value="${getUser.email}" placeholder="�����̸���">
										</c:if>
										<c:if test="${fn:trim(user.role) == '1'}">
											<input disabled="disabled" type="text" class="form-control"
												id="email" name="email" value="${getUser.email}"
												placeholder="�����̸���">
										</c:if>
									</div>
								</div>
								<br/>
								<div class="group">
									<strong class="title">�޴�����ȣ</strong>
									<div class="value">
										<div style="display: flex;">
											<input disabled="disabled" type="text" class="form-control" style="background: none; border: none; font-weight: bold; "
												id="phoneNo" name="phoneNo" value="${ getUser.phoneNo }">
											<c:if test="${fn:trim(user.role) == '0'}">
												<button type="button"
													style="font-weight: 900; border-radius: 10px; border: solid 2px #5F0080;"
													id="phoneChange">��&nbsp;��</button>
											</c:if>
										</div>
									</div>
								</div>
								<br/>
								<c:if test="${fn:trim(user.role) == '1'}">
									<div class="group">
										<strong class="title">��������</strong>
										<div class="value">
											<select name="penaltyType" id="penaltyType"
												style="border-color: #00000038; font-weight: bold; height: 44px; border-radius: 10px; padding: 10px;">
												<option selected="selected">�������ּ���</option>
												<option>��</option>
												<option>����</option>
												<option>��������</option>
											</select>
										</div>
									</div>
								</c:if>
								<br/>
								<c:if test="${fn:trim(user.role) == '1'}">
									<div class="group">
										<strong class="title">�����Ⱓ</strong>
										<div class="value">
											<input class="form-control" id="stopEndDateString" style="font-weight: bold; "
												readonly="readonly" name="stopEndDateString" value="" />
										</div>
									</div>
								</c:if>
							</div>
						</div>
						<div style="margin-left: 480px;">
							<button type="button"  id="update"
								style="font-weight: bold; border: solid 2px #5F0080; border-radius: 10px">��
								&nbsp;��</button>
							<button type="button"  id="cancel"
								style="font-weight: bold; border: solid 2px #5F0080; border-radius: 10px">��
								&nbsp;��</button>
						</div>
						<br /> <br />
					</div>
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<br /> <br />
		<!-- container E -->
	</form>
		<jsp:include page="/user/updatePhoneNoView.jsp" />
</body>
</html>