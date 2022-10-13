<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	
<script type="text/javascript" charset="utf-8" src="/resources/javascript/SMSCheck.js"></script>
<script type="text/javascript" charset="utf-8" src="/resources/javascript/nickNameCheck.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<script type="text/javascript">

$(function() {
	$("#addUser").on("click", function() {
		fncAddUser();
	});
});

function fncAddUser() {
	
	var regExp = /^[a-z0-9_]{4,20}$/;
	var regExp2 = /\s/g;
	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var id = $("#userId").val();
	var checkId = $("#checkId").val();
	var pw = $("#password").val();
	var pw2 = $("#password2").val();
	var name = $("#name").val();
	var nickName = $("#nickName").val();
	var checkNickName = $("#checkNickName").val();
	var gender = $("#gender").is(":checked");
	var rrn = $("#rrn").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var checkNo = $("#checkNo").val();		
	var email = $("#email").val();
	
	if(id == null || id.length < 1){
		swal.fire("���̵� �Է��ϼž� �մϴ�.");
		return;
	}else if(5 > id.length || id.length > 8){
		swal.fire("���̵�� ����, �������� 5~8�� �Դϴ�.");
		return;
	}else if(!regExp.test(id)){
		swal.fire("���̵�� ����, �������� 5~8�� �Դϴ�.");
		return;
	}
	
	if(checkId == 2){
		swal.fire("������� ���̵� �Դϴ�");
		return;
	}
	
	if(pw == null || pw.length < 1){
		swal.fire("��й�ȣ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
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
	
	if(name == null || name.length < 1){
		swal.fire("�̸��� �Է��ϼž� �մϴ�.");
		return;
	}
	
	if(nickName == null || nickName.length <1){
		swal.fire("�г����� �Է��ϼž� �մϴ�.");
		return;
	}
	
	if(regExp2.test(nickName)){
		swal.fire("������ ����� �� �����ϴ�.");
		return;
	}
	
	if(checkNickName == 2){
		swal.fire("������� �г��� �Դϴ�");
		return;
	}
	
	if(gender == false){
		swal.fire("���� üũ�� ���ּ���.");
		return;
	}
	
	if(rrn == null || rrn.length < 1){
		swal.fire("�ֹι�ȣ�� �Է��ϼž� �մϴ�.");
		return;
	}

	var value = "";
	if(phone2 != "" && phone3 !=""){
		value = $("#phone1").val() + "-"
		+ phone2 + "-" + phone3;
	}else if(phone2 != "" || phone3 !=""){
		swal.fire("�ڵ��� ��ȣ�� �Է��ϼž� �մϴ�.");
		return;
	}
		$("input:hidden[name='phoneNo']").val(value);
	
	if(!regPhone.test($("input:hidden[name='phoneNo']").val())){
		swal.fire("�ڵ�����ȣ�� ����� �Է����ּ���.");
		return;
	}	
	
	if(checkNo != 1){
		swal.fire("�ڵ��������� �ʿ��մϴ�.");
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
	
	$("form").attr("method", "POST").attr("action", "/user/addUser").submit();
}

function checkSsn() {
	var rrn1, rrn2;
	var nByear, nTyear;
	var today;

	rrn = document.detailForm.rrn.value;
	// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
	if (!PortalJuminCheck(rrn)) {
		alert("�߸��� �ֹι�ȣ�Դϴ�.");
		return false;
	}
}

function PortalJuminCheck(fieldValue) {
	var pattern = /^([0-9]{6})-?([0-9]{7})$/;
	var num = fieldValue;
	if (!pattern.test(num))
		return false;
	num = RegExp.$1 + RegExp.$2;

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i = 0; i < 12; i++) {
		if (isNaN(num.substring(i, i + 1)))
			return false;
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return ((11 - mod) % 10 == last) ? true : false;
}


$(function() {
	//alert("function����")
	$("#userId").on("keyup", function() {
		
		console.log($("#userId").val());
		
		var input = $("#userId").val();
		/*
		if(input == null){
			alert("asdf");
			console.log(input);
			$("#checkId").val(0);
			$("#userIdCheck").html("����, �������� 5~8��");
		}
		*/
		
		$.ajax("/userRest/json/getUser",{
			
			method : "POST",
			data : JSON.stringify({
				userId : input
			}),
			dataType : "json",
			contentType: "application/json",
			henders : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
		
					//console.log("JSONData : "+JSONData);
					//console.log("JSONData.userId : "+JSONData.userId);
			
				var userId = JSONData.userId;
				console.log("DB�� ���� UserId : "+userId);
			
			 
				if(userId == ""){
					$("#userIdCheck").html("��밡���� ���̵� �Դϴ�.");
					$("#checkId").val(1);
					console.log($("#checkId").val());
				}else{
					$("#userIdCheck").html("������� ���̵� �Դϴ�.");
					$("#checkId").val(2);
					console.log($("#checkId").val());
				}
			
			}
			
			
		});
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

		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label" id="id">��
					�� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="�ߺ�Ȯ���ϼ���"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger" id="userIdCheck">����, �������� 5~8��</strong>
					</span>
					<input type="hidden" id="checkId">
				</div> 
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="��й�ȣ"><span id="helpBlock"
						class="help-block"> <strong class="text-danger">����, �������� 6~12��</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password2"
					class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2"
						name="password2" placeholder="��й�ȣ Ȯ��"><span id="helpBlock"
						class="help-block"> <strong class="text-danger">����, �������� 6~12��</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name"
						name="name" placeholder="ȸ���̸�">
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickName" name="nickName"
						placeholder="�г���"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger" id="nickNameCheck">"
							Ư������ ��� �Ұ�, 1~10��</strong>
					</span>
					<input type="hidden" id="checkNickName">
				</div>
			</div>

			<div class="form-group">
				<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="����" value="����">����
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="����" value="����">����
				</div>
			</div>

			<div class="form-group">
				<label for="rrn" class="col-sm-offset-1 col-sm-3 control-label">�ֹι�ȣ</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rrn" name="rrn"
						placeholder="�ֹι�ȣ"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">"
							- " ���� 13�ڸ��Է��ϼ���</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
				<div class="col-sm-2">
					<select class="form-control" name="phone1" id="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
			
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone2" name="phone2"
						placeholder="��ȣ">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone3" name="phone3"
						placeholder="��ȣ">
				</div>
				<input type="hidden" name="phoneNo" />
				<div class="col-sm-2">
					<button type="button" id="sendPhoneNumber" class="btn ">������ȣ����</button>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						name="inputCertifiedNumber" placeholder="������ȣ">
				</div>
				<div class="col-sm-2">
					<button type="button" id="checkBtn" class="btn ">������ȣȮ��</button>
					<input type="hidden" id="checkNo">
				</div>
			</div>
			
			<div class="form-group">
				<label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="�̸���">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">Ȱ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="area1" name="area1"
						placeholder="Ȱ������">
					<input type="text" class="form-control" id="area2" name="area2"
						placeholder="Ȱ������">
					<input type="text" class="form-control" id="area3" name="area3"
						placeholder="Ȱ������">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">ī�װ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="category1" name="category1"
						placeholder="ī�װ�">
					<input type="text" class="form-control" id="category2" name="category2"
						placeholder="ī�װ�">
					<input type="text" class="form-control" id="category3" name="category3"
						placeholder="ī�װ�">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�����ʱ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="profileWriting" name="profileWriting"
						placeholder="�����ʱ�">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�����ʻ���</label>
				<div class="col-sm-4">
					<input type="file" class="form-file" id="profileImage" name="profileImage"
						placeholder="�����ʻ���">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="addUser" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>
</html>