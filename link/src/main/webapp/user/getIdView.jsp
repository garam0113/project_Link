<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/emailCheck.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">

window.event.keyCode == 8) {
	login();
}
	$(function() {
		$("#check").on("click", function() {
			fncGetId(); //ID찾기
		});

		$("#back").on("click", function() {
			window.close();
		});
	});

	function fncGetId() {

		var name = $("#name").val();
		var rrn1 = $("#rrn1").val();
		var rrn2 = $("#rrn2").val();
		var rrn = rrn1+"-"+rrn2;
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var phoneNo = $("#phone1").val() + "-" + phone2 + "-" + phone3;
		var checkNo = $("#checkNo").val();
		var email = $("#email").val();
		
		$("#rrn").val(rrn);

		if (name == null || name.length < 1) {
			swal.fire("이름을 입력해 주세요.");
			return;
		}

		if (rrn == null || rrn.length < 1) {
			swal.fire("주민번호를 입력해 주세요.");
			return;
		}

		if (checkNo != 1) {
			swal.fire("인증이 필요합니다.");
			return;
		}

		if (phone2 == "" && phone3 == "" && email == "") {
			swal.fire("핸드폰, 이메일정보중 하나만 적어주세요.")
			return;
		}

		$('#myTabs a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})

		$.ajax("/userRest/json/getUserId", {

			type : "POST",
			data : JSON.stringify({
				name : name,
				rrn : rrn,
				outUserState : '0'
			}),
			dataType : "json",
			contentType : "application/json",
			henders : {
				"Accept" : "application"
			},
			success : function(Data, status) {
				console.log(Data.phoneNo)
				console.log(phoneNo)
				
				swal.fire("아이디는"+Data.userId+"입니다.").then(function() {
					window.close();
				});
			}
		})
	}
</script>

</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="background-color: lavenderblush;">

		<h1 class="text-center"
			style="font-weight: bold; margin-bottom: 30px; text-align-last: start; margin-left: 60px;">아이디찾기</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="name" class="col-sm-offset-1 col-sm-3 control-label"
					style="text-align-last: start;">이 름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						value="" placeholder="이름" style="margin-left: -85px;">
				</div>
			</div>

			<div class="form-group">
				<label for="rrn" class="col-sm-offset-1 col-sm-3 control-label"
					style="text-align-last: start;">주민번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rrn1" name="rrn1"
						value=""  style=" margin-left: -85px; width: 100px">
				</div>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="rrn2" name="rrn2"
						value=""  style=" margin-left: -215px; width: 100px">
				</div>
					<input type="hidden" id="rrn" name="rrn">
			</div>

			<ul class="nav nav-tabs" role="tablist" style="margin-left: 60px">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">핸드폰</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">이메일</a></li>
			</ul>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">
					<label for="phoneNo" class="col-sm-offset-1 col-sm-3 control-label"
						style="margin-left: -20px; margin-top: 10px;">휴대전화번호</label>
					<div class="col-sm-2">
						<select class="form-control" name="phone1" id="phone1"
							style="margin-top: 10px; margin-left: -10px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>

					<div class="col-sm-2">
						<input type="text" class="form-control" id="phone2" name="phone2"
							style="margin-top: 10px; margin-left: -20px;">
					</div>

					<div class="col-sm-2">
						<input type="text" class="form-control" id="phone3" name="phone3"
							style="margin-top: 10px; margin-left: -30px;">
					</div>
					<input type="hidden" name="phoneNo" />

					<div class="col-sm-2">
						<button type="button" id="sendPhoneNumber" class="btn "
							style="margin-top: 11px; margin-left: -40px; height: 32px; border-color: #5F0080; background-color: #fffcfc;">인증번호전송</button>
					</div>
				</div>

				<div role="tabpanel" class="tab-pane" id="profile">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label" style="margin-left: -60px; margin-top: 10px;">이메일</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="email" name="email" style=" margin-top: 10px; margin-left: 30px; width: 220px;"
							placeholder="변경이메일"  >
					</div>
					<div class="col-sm-4">
						<button type="button" id="sendEmail" class="btn " style="margin-top: 11px; margin-left: 27px; height: 32px; border-color: #5F0080; background-color: #fffcfc;">인증번호전송</button>
					</div>
				</div>
			</div>

			<br /> <br /> <br />
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"
					style="margin-left: -40px;">인증번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						style="margin-left: 17px;" name="inputCertifiedNumber"
						placeholder="인증번호">
				</div>
				<div class="col-sm-4">
					<button type="button" id="checkBtn" class="btn "
						style="margin-left: 5px;  height: 32px; border-color: #5F0080; background-color: #fffcfc;">인증번호확인</button>
					<input type="hidden" id=checkNo>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="check" class="btn" style="border-style: hidden; background-color: #5F0080; color: #fffef8;">확
						&nbsp;인</button>
					<button type="button" id="back" class="btn"  role="button" style="border-style: hidden; background-color: #5F0080; color: #fffef8;">취 &nbsp;소</button>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>