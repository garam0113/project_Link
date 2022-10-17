<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
</style>

<script type="text/javascript">
    
	$(function() {
		$("#update").on("click", function() {
			fncUpdateUser();
		});
			
		$("#phoneChange").on("click", function() {
			popup();
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
    			data : JSON.stringify({
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
<body>
	<jsp:include page="/sideToolbar.jsp" />
	<form>
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<c:if test="${user.role == '0'}">
						<h2 class="sub_tit_txt">����������</h2>
					</c:if>
					<c:if test="${user.role == '1'}">
						<h2 class="sub_tit_txt">ȸ����������</h2>
					</c:if>
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>���̵�</span></th>
									<td><input disabled="disabled" class="form-control"
										id="userId" name="userId" value="${getUser.userId }">
										<input type="hidden" class="form-control" id="userId"
										name="userId" value="${getUser.userId }"></td>
								</tr>
								<tr>
									<th><span>�̸�</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="name" name="name"
										value="${getUser.name}">
										<input type="hidden" class="form-control" id="name"
										name="name" value="${getUser.name }">
										</td>
								</tr>
								<tr>
								<tr>
									<th><span>����</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="gender" name="gender"
										value="${getUser.gender}">
										<input type="hidden" class="form-control" id="gender"
										name="gender" value="${getUser.gender }"></td>
								</tr>
								<tr>
									<th><span>�ֹι�ȣ</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="rrn" name="rrn"
										value="${getUser.rrn}">
										<input type="hidden" class="form-control" id="rrn"
										name="rrn" value="${getUser.rrn }"></td>
								</tr>
								<c:if test="${user.role == '0'}">
									<tr>
										<th><span>��й�ȣ</span></th>
										<td><input type="password" class="form-control"
											id="password" name="password" placeholder="�����й�ȣ"> <span
											id="helpBlock" class="help-block"> <strong
												class="text-danger">����, ���� ���� 6~12��</strong>
										</span></td>
									</tr>
								</c:if>
								<c:if test="${user.role == '0'}">
									<tr>
										<th><span>��й�ȣ Ȯ��</span></th>
										<td><input type="password" class="form-control"
											id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
											<span id="helpBlock" class="help-block"> <strong
												class="text-danger">����, ���� ���� 6~12��</strong>
										</span></td>
									</tr>
								</c:if>
								<tr class="email">
									<th><span>�̸���</span></th>
									<td><c:if test="${user.role == '0'}">
											<input type="text" class="form-control" id="email"
												name="email" value="${getUser.email}" placeholder="�����̸���">
										</c:if> 
											<c:if test="${user.role == '1'}"><input disabled="disabled" type="text" class="form-control"
										id="email" name="email" value="${getUser.email}"
										placeholder="�����̸���"></c:if>
										</td>
								</tr>
								<tr>
									<th><span>�޴��� ��ȣ</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="phoneNo" name="phoneNo"
										value="${ getUser.phoneNo }"> <c:if
											test="${user.role == '0'}">
											<button type="button" class="btn btn-primary btn"
												id="phoneChange">��&nbsp;��</button>
										</c:if></td>
								</tr>
								<c:if test="${user.role == '1'}">
									<tr>
										<th><span>��������</span></th>
										<td><select name="penaltyType" id="penaltyType">
												<option selected="selected">�������ּ���</option>
												<option>��</option>
												<option>����</option>
												<option>��������</option>
										</select></td>
									</tr>
								</c:if>
								<c:if test="${user.role == '1'}">
									<tr>
										<th><span>�����Ⱓ</span></th>
										<td><input class="form-control" id="stopEndDateString"
											readonly="readonly" name="stopEndDateString" value="" /></td>
									</tr>
								</c:if>
								<tr>
									<th><span></span></th>
									<td align="center">
										<button type="button" class="btn btn-primary" id="update">��
											&nbsp;��</button>
										<button type="button" class="btn btn-primary" id="cancel">��
											&nbsp;��</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</form>
</body>
</html>