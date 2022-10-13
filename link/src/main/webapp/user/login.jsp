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
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>


<script type="text/javascript" src="/resources/javascript/kakaoLogin.js"></script>

<style>
body>div.container {
	border: 0;
	outline: 0;
	margin-top: 10px;
}

.button {
	border: 0;
	outline: 0;
}

.btn-social-login {
	transition: all .2s;
	outline: 0;
	border: 1px solid transparent;
	padding: .5rem !important;
	border-radius: 50%;
	color: #fff;
}

.btn-social-login:focus {
	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25);
}

.text-dark {
	color: #343a40 !important;
}
</style>
<!--  ///////////////////////// CSS ////////////////////////// -->

<script type="text/javascript">
	$(function() {
		$(".login__button").on("click", function() {
			login(); //로그인
		});

		$("#sign-up").on("click", function() {
			self.location = "/user/addUser" //회원가입
		});

		$("a[href='#getId']").on(
				"click",
				function() {
					var child;
					child = window.open("/user/getUserId", "_blank",
							"width = 800, height = 500");
				});

		$("a[href='#getPassword']").on(
				"click",
				function() {
					var child;
					child = window.open("/user/getPassword", "_blank",
							"width = 800, height = 500");
				});

	});

	function login() {

		//const date = new Date();
		var id = $("#userId").val();
		var pw = $("#password").val();

		console.log("date : " + Date.now());

		if (id == null || id.length < 1) {
			swal.fire("아이디를 입력해주세요.");
			return;
		}

		if (pw == null || pw.length < 1) {
			swal.fire("비밀번호를 입력해주세요.");
			return;
		}

		$.ajax("/userRest/json/getUser", {

			type : "POST",
			data : JSON.stringify({
				userId : id
			}),
			dataType : "json",
			contentType : "application/json",
			henders : {
				"Accept" : "applicattion/json"
			},
			success : function(Data, status) {

				console.log(Data.stopEndDate);

				if (Data.userId == "") {
					swal.fire("존재하지 않는 아이디입니다.");
					return;
				} else if (Data.userId != "" && pw != Data.password) {
					swal.fire("비밀번호가 틀립니다.");
					return;
				} else if (Data.penaltyType == 2) {
					swal.fire("회원은 영구정지 대상자로 로그인이 제한됩니다.");
					return;
				} else if (Data.penaltyType == 1
						&& Date.now() < Data.stopEndDate) {
					swal.fire("회원은 정지대상자로 [" + Data.stopStartDateString + " ~ "
							+ Data.stopEndDateString + "까지 로그인이 제한됩니다.");
					return;
				} else if (Data.userID != "" && pw == Data.password) {

					$($("form")[0]).attr("method", "POST").attr("action",
							"/user/login").submit();
				}
			}
		});

	}
</script>
</head>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>

<div class="login">
	<div class="login__content">
		<div class="login__img">
			<img
				src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg"
				alt="user login">
		</div>
		<div class="login__forms">
			<!--         login form -->
			<form class="login__register" id="login-in">
				<h1 class="login__title">Sign In</h1>
				<div class="login__box">
					<i class='bx bx-user login__icon'></i> <input type="text"
						placeholder="Username" class="login__input" name="userId"
						id="userId">
				</div>
				<div class="login__box">
					<i class='bx bx-lock login__icon'></i> <input type="password"
						placeholder="Password" class="login__input" name="password"
						id="password">
				</div>
				<a href="#getId" class="login__forgot">Forgot Id? </a> <a
					href="#getPassword" class="login__forgot">Forgot Password? </a> <a
					href="#login" class="login__button">Sign In</a>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6 text-center">
						<button class="button" type="button" onclick="kakaoLogin();">
							<img src="/resources/image/ko/kakao_login_medium_narrow.png"
								alt="카카오계정 로그인" />
						</button>
						<input type="hidden" class="kakao" name="snsUserId" id="snsUserId">
						<input type="hidden" class="snsType" name="addType" id="addType"
							value=>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6 text-center">
						<div id="naver_id_login">
							<a id="naverIdLogin_loginButton" href="#"> <img
								src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1"
								height="50"></a>
						</div>
						<input class="naver" type="hidden" id="snsUserId" name="snsUserId">
						<input class="naverType" type="hidden" id="addType" name="addType">
					</div>
				</div>
				<br /> <br /> <br /> <br /> <br /> <br />
				<div>
					<span class="login__account login__account--account">Don't
						Have an Account?</span> <span class="login__signin login__signin--signup"
						id="sign-up">Sign Up</span>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("Ml9RKhaCexgFbiAJLp0c",
			"http://192.168.0.183:8080/user/login.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3, 50);
	naver_id_login.setDomain("http://192.168.0.183:8080/");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
	console.log(naver_id_login);

	naver_id_login.get_naver_userprofile("naverSignInCallback()");

	function naverSignInCallback() {

		console.log(naver_id_login.getProfileData('email'))
		var snsId = naver_id_login.getProfileData('email');
		console.log(snsId);

		$(".naver").val(snsId);
		$(".naverType").val(2);
		console.log($(".naverType").val());
		console.log($(".naver").val());

		$("form").attr("method", "POST").attr("action", "/user/snsLogin")
				.submit();
	}
</script>

</body>
</html>