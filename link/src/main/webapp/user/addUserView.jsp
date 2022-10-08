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
	//alert("function시작")
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
				console.log("DB로 받은 UserId : "+userId);
			
			 
				if(userId == ""){
					$("#userIdCheck").html("사용가능한 아이디 입니다.");
				}else{
					$("#userIdCheck").html("사용중인 아이디 입니다.");
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
				
				console.log("DB로 받은 nickName : "+JSONData.nickName);
			
			 
				if(JSONData.nickName == ""){
					$("#nickNameCheck").html("사용가능한 닉네임 입니다.");
				}else{
					$("#nickNameCheck").html("사용중인 닉네임 입니다.");
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

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">회 원 가 입</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label" id="id">아
					이 디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="중복확인하세요"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger" id="userIdCheck">영어, 숫자조합 5~8자</strong>
					</span>
				</div> 
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="비밀번호"><span id="helpBlock"
						class="help-block"> <strong class="text-danger">영어, 숫자조합 6~12자</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="password2"
					class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2"
						name="password2" placeholder="비밀번호 확인"><span id="helpBlock"
						class="help-block"> <strong class="text-danger">영어, 숫자조합 6~12자</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name"
						name="name" placeholder="회원이름">
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickName" name="nickName"
						placeholder="닉네임"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger" id="nickNameCheck">"
							특수문자 사용 불가, 1~10자</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
				<div class="col-sm-4">
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="남자" value="남자">남자
					<input type="radio" class="form-radio" id="gender"
						name="gender" placeholder="여자" value="여자">여자
				</div>
			</div>

			<div class="form-group">
				<label for="rrn" class="col-sm-offset-1 col-sm-3 control-label">주민번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rrn" name="rrn"
						placeholder="주민번호"> <span id="helpBlock"
						class="help-block"> <strong class="text-danger">"
							- " 제외 13자리입력하세요</strong>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
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
						placeholder="번호">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone3" name="phone3"
						placeholder="번호">
				</div>
				<div class="col-sm-2">
					<button type="button" id="sendPhoneNumber" class="btn ">인증번호전송</button>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						name="inputCertifiedNumber" placeholder="인증번호">
				</div>
				<div class="col-sm-2">
					<button type="button" id="checkBtn" class="btn ">인증번호확인</button>
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="이메일">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">활동영역</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="area1" name="area1"
						placeholder="활동영역">
					<input type="text" class="form-control" id="area2" name="area2"
						placeholder="활동영역">
					<input type="text" class="form-control" id="area3" name="area3"
						placeholder="활동영역">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">카테고리</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="category1" name="category1"
						placeholder="카테고리">
					<input type="text" class="form-control" id="category2" name="category2"
						placeholder="카테고리">
					<input type="text" class="form-control" id="category3" name="category3"
						placeholder="카테고리">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">프로필글</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="profileWriting" name="profileWriting"
						placeholder="프로필글">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">프로필사진</label>
				<div class="col-sm-4">
					<input type="file" class="form-file" id="profileImage" name="profileImage"
						placeholder="프로필사진">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="addUser" class="btn btn-primary">가 &nbsp;입</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>