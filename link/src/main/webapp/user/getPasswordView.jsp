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
	$(function() {
		$("#chack").on("click", function() {
			fncGetPassword();
		});
		$("#back").on("click", function() {
			window.close();
		});
	});

	function fncGetPassword() {

		var id = $("#userId").val();
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
		
		console.log("rrn 값 : "+$("#rrn").val());
		console.log("phone2 : " + phone2 + ", phone3 : " + phone3);
		console.log("email : " + email);

		if (id == null || id.length < 1) {
			swal.fire("아이디를 입력해 주세요.");
			return;
		}

		if (name == null || name.length < 1) {
			swal.fire("이름을 입력해 주세요.");
			return;
		}

		if (rrn == null || rrn.length < 1) {
			swal.fire("주민번호를 입력해 주세요.");
			return;
		}

		if (phone2 == "" && phone3 == "" && email == "") {
			swal.fire("핸드폰, 이메일정보중 하나만 적어주세요.")
			return;
		}

		if (checkNo != 1) {
			swal.fire("인증이 필요합니다.");
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
				"Accept" : "application/json"
			},
			success : function(Data, status) {
				console.log(Data.phoneNo)
				console.log(phoneNo)
				console.log(Data.userId)

				if (Data.userId != id) {
					swal.fire("아이디가 다릅니다.");
					return;
				}

				$.ajax("/userRest/json/updatePassword", {

					type : "POST",
					data : JSON.stringify({
						userId : id,
						email : email
					}),
					contentType : "application/json",
					henders : {
						"Accept" : "application/json"
					},
					success : function(JsonData, status) {
						console.log(JsonData)

						if (email == null || email.length < 1) {
							swal.fire("임시 비밀번호가 핸드폰번호로 전송되었습니다.").then(function() {
							window.close();
							});
						}

						if (phone2.length < 1 || phone3.length < 1) {
							swal.fire("임시 비밀번호가 이메일로 전송되었습니다.").then(function() {
							window.close();
							});
						}
					}
				})
			},
			error : function() {
				console.log("error");
				swal.fire("가입된 정보와 일치하지 않습니다.");
			}
		})
	}
</script>

</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="background-color: lavenderblush;">

		<h1 style="font-weight: bold; margin-bottom: 30px; margin-left: 60px;">비밀번호찾기</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label"
					style="margin-left: -55px;">아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="uesrID"
						style="margin-left: 29px;" value="" placeholder="아이디">
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="col-sm-offset-1 col-sm-3 control-label"
					style="margin-left: -65px;">이 름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						style="margin-left: 39px;" value="" placeholder="이름">
				</div>
			</div>

			<div class="form-group">
				<label for="rrn" class="col-sm-offset-1 col-sm-3 control-label"
					style="margin-left: -42px;">주민번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rrn1" name="rrn1"
						style="margin-left: 16px; width: 100px" value="">
				</div>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="rrn2" name="rrn2"
						style="margin-left: -115px; width: 100px" value="">
				</div>
				<input type="hidden" id="rrn" name="rrn">
			</div>

			<ul class="nav nav-tabs" role="tablist" style="margin-left: 55px;">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">핸드폰</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">이메일</a></li>
			</ul>

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">
					<label for="phoneNo" class="col-sm-offset-1 col-sm-3 control-label"
						style="margin-left: -23px; margin-top: 10px;">휴대전화번호</label>
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
							style="margin-top: 11px; margin-left: -40px; background-color: white; border-color: #5F0080;">인증번호전송</button>
					</div>
				</div>

				<div role="tabpanel" class="tab-pane" id="profile">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"
						style="margin-left: -63px; margin-top: 10px; ">이메일</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="email" name="email" style="margin-top: 10px; margin-left: 30px; width: 220px;"
							placeholder="변경이메일">
					</div>
					<div class="col-sm-4">
						<button type="button" id="sendPhoneNumber" class="btn " style="margin-top: 11px; margin-left: 30px; background-color: white; border-color: #5F0080;">인증번호전송</button>
						<input type="hidden" id=checkNo>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"
					style="margin-left: -43px; margin-top: 10px;">인증번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						style="margin-top: 10px; margin-left: 17px;"
						name="inputCertifiedNumber" placeholder="인증번호">
				</div>
				<div class="col-sm-4">
					<button type="button" id="checkBtn" class="btn "
						style="margin-top: 10px; background: white; border-color: #5F0080; margin-left: 7px;">인증번호확인</button>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="chack" class="btn" style="background-color: #5F0080; border-style: hidden; color: white;">확
						&nbsp;인</button>
					<button type="button" id="back" class="btn" style="background-color: #5F0080; border-style: hidden; color: white;">취 &nbsp;소</button>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>