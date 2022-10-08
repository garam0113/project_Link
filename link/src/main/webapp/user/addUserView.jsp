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
	
<script type="text/javascript" charset="utf-8" src="/resources/javascript/SMSCheck.js"></script>

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
		$("form").attr("method", "POST").attr("action", "/user/addUser").submit();
	});
});

$(function() {
	//alert("function����")
	$("#userId").on("keyup", function() {
		
		console.log($("#userId").val());
		
		var input = $("#userId").val();
		
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
				}else{
					$("#userIdCheck").html("������� ���̵� �Դϴ�.");
				}
			
			}
		});
	});
});

$(function() {
	$("#nickName").on("keyup", function() {
		var nickName = $("#nickName").val();
		console.log(nickName);
		
		$.ajax("/userRest/json/getUser", {
				
			type : "POST",
			data : JSON.stringify({ 
				nickName : nickName
			}),
			dataType : "json",
			contentType : "application/json",
			henders : {
				"Accept" : "application/json", 
				
			},
			success : function(JSONData, status) {
				
				console.log("JSONData : "+JSONData.nickName);
				
				console.log("DB�� ���� nickName : "+JSONData.nickName);
			
			 
				if(JSONData.nickName == ""){
					$("#nickNameCheck").html("��밡���� �г��� �Դϴ�.");
				}else{
					$("#nickNameCheck").html("������� �г��� �Դϴ�.");
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
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
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