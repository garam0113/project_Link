<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">

<script type="text/javascript"
	src="/resources/javascript/user/kakaoLogin.js" charset="utf-8"></script>

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
.swal2-container.swal2-center{
z-index: 10000; 
}
</style>
<!--  ///////////////////////// CSS ////////////////////////// -->

<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			login();
		}
	}

	$(function() {
		$(".login__button").on("click", function() {
			login(); //�α���
		});

		$("#sign-up").on("click", function() {
			self.location = "/user/addUser" //ȸ������
		});

		$("a[href='#getId']").on(
				"click",
				function() {
					/* var child;
					child = window.open("/user/getUserId", "_blank",
							"width = 800, height = 500"); */
					$('#modalId').modal('show');
				});

		$("a[href='#getPassword']").on(
				"click",
				function() {
					$('#modalPass').modal('show');
/* 					var child;
					child = window.open("/user/getPassword", "_blank",
							"width = 800, height = 500"); */
				});
		
	});

	function login() {

		//const date = new Date();
		var id = $("#userId").val();
		var pw = $("#password").val();

		console.log("date : " + Date.now());

		if (id == null || id.length < 1) {
			event.stopPropagation();
			swal.fire("���̵� �Է����ּ���.");
			return;
		}

		if (pw == null || pw.length < 1) {
			event.stopPropagation();
			swal.fire("��й�ȣ�� �Է����ּ���.");
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

				if (Data.userId == "" || Data.outUserState == 1) {
					event.stopPropagation();
					swal.fire("�������� �ʴ� ���̵��Դϴ�.");
					return;
				} else if (Data.userId != "" && pw != Data.password) {
					event.stopPropagation();
					swal.fire("��й�ȣ�� Ʋ���ϴ�.");
					return;
				} else if (Data.penaltyType == 2) {
					event.stopPropagation();
					swal.fire("ȸ���� �������� ����ڷ� �α����� ���ѵ˴ϴ�.");
					return;
				} else if (Data.penaltyType == 1
						&& Date.now() < Data.stopEndDate) {
					event.stopPropagation();
					swal.fire("ȸ���� ��������ڷ� [" + Data.stopStartDateString + " ~ "
							+ Data.stopEndDateString + "���� �α����� ���ѵ˴ϴ�.");
					return;
				} else if (Data.userID != "" && pw == Data.password) {

					$($("form")[0]).attr("method", "POST").attr("action",
							"/user/login").submit();
				}
			}
		});

	}
</script>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
	<div class='modal fade' id='modalLogin'
		style='display: none; margin-left: -30px; overflow: hidden; width: auto; margin-top: -100px; '>
		<div class='modal-dialog' style="margin-top: -160px; zoom: 1.2;">
			<div class='modal-content' id='ml'
				style='background: transparent; box-shadow: none; border: none;'>
				<div class='modal-header'>
					<div class="login" style="">
						<div class="login__content">
							<div class="login__forms">
								<!--         login form -->
								<form class="login__register" id="login-in"
									style='margin-left: 60px'>
									<h1 class="login__title">Sign In</h1>
									<div class="login__box" style="height: 60px;">
										<i class='bx bx-user login__icon'></i> <input type="text"
											onkeyup="enterkey()" placeholder="���̵�" class="login__input"
											name="userId" style="font-size: initial; border: none;"
											id="userId">
									</div>
									<div class="login__box" style="height: 60px;">
										<i class='bx bx-lock login__icon'></i> <input type="password"
											placeholder="��й�ȣ" class="login__input" name="password"
											onkeyup="enterkey()"
											style="font-size: initial; border: none;" id="password">
									</div>
									<div style="display: flex; margin-top: 10px;">
										<a href="#getId" class="login__forgot"
											style="font-size: small; margin-right: -181px;">���̵� ã�� </a><a
											href="#getPassword" class="login__forgot"
											style="font-size: small;">��й�ȣã�� </a>
									</div>
									<a href="#login" class="login__button" id="qwe">Sign In</a>
									<div class="form-group">
										<div class="col-sm-offset-4 col-sm-6 text-center" style="margin-left: 220px; margin-top: -20px;">
											<button class="button" type="button" onclick="kakaoLogin();" style=" background: transparent;">
												<img src="/resources/image/kakao_talk.png" style="width: 47px; height: 47px; border-radius: 70px; margin-bottom: -3px;"
								 					alt="īī������ �α���" />
											</button><button id='naverButton' type="button" style=" background: transparent; border: none;"><img src="/resources/image/naver.png" style="width: 40px; height: 40px; border-radius: 70px;"></button>
											<input type="hidden" class="kakao" name="snsUserId"
												id="snsUserId"> <input type="hidden" class="snsType"
												name="addType" id="addType" value=>
										</div>
									</div>
 
									<div class="form-group">
										<div class="col-sm-offset-4 col-sm-6 text-center"> 
											<div id="naver_id_login" style="display: none;">
												<!-- <a id="naverIdLogin_loginButton" href="#"> <img
	 												src="/resources/css/images/naver.png"
													height="50" id="naver"></a> -->
											</div>
											<input class="naver" type="hidden" id="snsUserId"
												name="snsUserId"> <input class="naverType"
												type="hidden" id="addType" name="addType">
										</div>
									</div>
									<div>
										<span class="login__account login__account--account"
											style="font-size: small;">Don't Have an Account?</span> <span
											class="login__signin login__signin--signup"
											style="font-size: small;" id="sign-up">Sign Up</span>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/user/getIdView.jsp" />
	<jsp:include page="/user/getPasswordView.jsp" />
	</div>
	<script type="text/javascript">
	$(function(){
		$("#naverButton").on("click", function() {
			//alert("Ŭ��");
		//$("#naver_id_login").click();  
		//$('#naver_id_login_anchor').click()
		location.href=$('#naver_id_login > a').attr('href')
		//window.open($('#naver_id_login > a').attr('href'))
		 	
	})  
	})
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

			$.ajax("/userRest/json/getUser", {
				type : "POST",
				data : JSON.stringify({
					snsUserId : "," + snsId,
					addType : ",2"
				}),
				dataType : "json",
				contentType : "application/json",
				headers : {
					"Accept" : "application/json"
				},
				success : function(Data, status) {
					console.log("������ �޴� ����Ÿ : " + Data.userId)
					console.log("������ �޴� ����Ÿ : " + Data.penaltyType)
					console.log("������ �޴� ����Ÿ : " + Data.stopEndDate)

					if (Data.penaltyType == 2) {
						swal.fire("ȸ���� �������� ����ڷ� �α����� ���ѵ˴ϴ�.");
						return;
					} else if (Data.penaltyType == 1
							&& Date.now() < Data.stopEndDate) {
						swal.fire("ȸ���� ��������ڷ� [" + Data.stopStartDateString
								+ " ~ " + Data.stopEndDateString
								+ "���� �α����� ���ѵ˴ϴ�.");
						return;
					}
					$("form").attr("method", "POST").attr("action",
							"/user/snsLogin").submit();
				}
			})

		}
	</script>

</body>
</html>