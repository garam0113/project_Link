<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link rel="stylesheet" href="/resources/css/addUser.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/SMSCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/nickNameCheck.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/resources/javascript/user/category.js"></script>

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
		var regRrn = /^([0-9]{6})-?([0-9]{7})$/;
		;
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

		console.log("체크 결과 값 : " + gender);

		if (id == null || id.length < 1) {
			swal.fire("아이디를 입력하셔야 합니다.");
			return;
		} else if (5 > id.length || id.length > 8) {
			swal.fire("아이디는 영어, 숫자조합 5~8자 입니다.");
			return;
		} else if (!regExp.test(id)) {
			swal.fire("아이디는 영어, 숫자조합 5~8자 입니다.");
			return;
		}

		if (checkId == 2) {
			swal.fire("사용중인 아이디 입니다");
			return;
		}

		if (pw == null || pw.length < 1) {
			swal.fire("비밀번호를 입력하셔야 합니다.");
			return;
		}

		if (6 > pw.length || pw.length > 12) {
			swal.fire("비밀번호는 영어, 숫자조합 6~12자 입니다.");
			return;
		}

		if (!regExp.test(pw)) {
			swal.fire("비밀번호는 영어, 숫자조합 6~12자 입니다.");
			return;
		}

		if (pw != pw2) {
			swal.fire("비밀번호가 다릅니다.");
			return;
		}

		if (name == null || name.length < 1) {
			swal.fire("이름을 입력하셔야 합니다.");
			return;
		}

		if (nickName == null || nickName.length < 1) {
			swal.fire("닉네임을 입력하셔야 합니다.");
			return;
		}

		if (regExp2.test(nickName)) {
			swal.fire("공백은 사용할 수 없습니다.");
			return;
		}

		if (checkNickName == 2) {
			swal.fire("사용중인 닉네임 입니다");
			return;
		}

		if (gender == false) {
			swal.fire("성별 체크를 해주세요.");
			return;
		}

		if (rrn == null || rrn.length < 1) {
			swal.fire("주민번호를 입력하셔야 합니다.");
			return;
		}

		if (regRrn.test(rrn)) {
			swal.fire("주민등록번호 형식에 어긋납니다.");
			return;
		}

		var value = "";
		if (phone2 != "" && phone3 != "") {
			value = $("#phone1").val() + "-" + phone2 + "-" + phone3;
		} else if (phone2 != "" || phone3 != "") {
			swal.fire("핸드폰 번호를 입력하셔야 합니다.");
			return;
		}
		$("input:hidden[name='phoneNo']").val(value);

		if (!regPhone.test($("input:hidden[name='phoneNo']").val())) {
			swal.fire("핸드폰번호를 제대로 입력해주세요.");
			return;
		}
		
		 if (checkNo != 1) {
		 swal.fire("핸드폰인증이 필요합니다.");
		 return;
		 }
		 
		if (email == null || email.length < 1) {
			swal.fire("이메일을 입력하셔야 합니다.");
			return;
		}

		if (!regEmail.test(email)) {
			swal.fire("이메일을 제대로 입력해주세요.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/user/addUser").attr(
				"encType", "multipart/form-data").submit();
	}

	$(function() {
		//alert("function시작")
		$("#userId").on("keyup", function() {

			console.log($("#userId").val());

			var input = $("#userId").val();
			/*
			if(input == null){
				alert("asdf");
				console.log(input);
				$("#checkId").val(0);
				$("#userIdCheck").html("영어, 숫자조합 5~8자");
			}
			 */

			$.ajax("/userRest/json/getUser", {

				method : "POST",
				data : JSON.stringify({
					userId : input
				}),
				dataType : "json",
				contentType : "application/json",
				henders : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					//console.log("JSONData : "+JSONData);
					//console.log("JSONData.userId : "+JSONData.userId);

					var userId = JSONData.userId;
					console.log("DB로 받은 UserId : " + userId);

					if (userId == "") {
						$("#userIdCheck").html("사용가능한 아이디 입니다.");
						$("#checkId").val(1);
						console.log($("#checkId").val());
					} else {
						$("#userIdCheck").html("사용중인 아이디 입니다.");
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
	<form>
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">회원가입</h2>
					<p class="exTxt">회원가입시 핸드폰 인증을 반드시 진행하셔야 합니다.</p>
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td><input style="height: 40px;" type="text" id="userId"
										name="userId" placeholder="ID 를 입력하세요."> <span><strong
											class="text-danger" id="userIdCheck">영어, 숫자조합 5~8자</strong> </span>
										<input type="hidden" id="checkId"></td>
								</tr>
								<tr>
									<th><span>이름</span></th>
									<td><input type="text" id="name" style="height: 40px;"
										name="name" placeholder=""></td>
								</tr>
								<tr>
									<th><span>닉네임</span></th>
									<td><input type="text" id="nickName" style="height: 40px;"
										name="nickName" placeholder=""><strong
										class="text-danger" id="nickNameCheck">" 특수문자 사용 불가,
											1~10자</strong><input type="hidden" id="checkNickName"></td>
								</tr>
								<tr>
									<th><span>성별</span></th>
									<td>
										<div style="display: flex;">
											<div style="margin-right: 10px;">
												<input type="radio" class="form-radio" id="gender"
													name="gender" placeholder="남자" value="남자">남자
											</div>
											<div>
												<input type="radio" class="form-radio" id="gender"
													name="gender" placeholder="여자" value="여자">여자
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th><span>주민번호</span></th>
									<td><input type="text" id="rrn" name="rrn"
										style="height: 40px;"><span id="helpBlock"
										class="help-block"> <strong class="text-danger">"
												- " 제외 13자리입력하세요</strong></span></td>
								</tr>
								<tr>
									<th><span>비밀번호</span></th>
									<td><input type="text" id="password" style="height: 40px;"
										name="password" placeholder="비밀번호를 입력해주세요."><span
										id="helpBlock" class="help-block"> <strong
											class="text-danger">영어, 숫자조합 6~12자</strong>
									</span></td>
								</tr>
								<tr>
									<th><span>비밀번호</span> <span>확인</span></th>
									<td><input type="text" id="password2"
										style="height: 40px;" name="password2"
										placeholder="비밀번호를 확인하세요"><span id="helpBlock"
										class="help-block"> <strong class="text-danger">영어,
												숫자조합 6~12자</strong>
									</span></td>
								</tr>
								<tr class="email">
									<th><span>이메일</span></th>
									<td><input type="text"
										style="height: 40px; width: 461.59px;" class="email"
										id="email" placeholder=""></td>
								</tr>
								<tr>
									<th><span>휴대폰번호</span></th>
									<td>
										<div style="display: flex;">
											<div>
												<select class="form-control"
													style="height: 40px; width: 80px; margin-right: 20px; border: 1px solid #2c2b2b17;"
													name="phone1" id="phone1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>
											</div>
											<div>
												<input
													style="height: 40px; width: 80px; margin-right: 20px;"
													type="text" id="phone2" name="phone2" class="phone2"
													placeholder="">
											</div>
											<div>
												<input
													style="height: 40px; width: 80px; margin-right: 20px;"
													type="text" id="phone3" name="phone3" class="phone3"
													placeholder=""><a href="#" id="sendPhoneNumber"
													style="height: 40px; margin-top: 0;" class="btn_confirm">인증번호
													발송</a>
											</div>
											<input type="hidden" name="phoneNo" />
										</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th><span>인증번호</span></th>
									<td><div style="display: flex;">
											<input type="text" id="inputCertifiedNumber"
												style="height: 40px;" name="inputCertifiedNumber"
												class="send_number" placeholder="10:00"><a href="#"
												style="height: 40px;" id="checkBtn" class="btn_confirm">인증번호
												확인</a> <input type="hidden" id="checkNo">
										</div></td>
								</tr>
								<tr>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th><span>활동영역</span></th>
									<td>
										<div>
											<select class="form-control"
												style="height: 40px; width: 200px; margin-right: 20px; border: 1px solid #2c2b2b17;"
												name="areaSelcet" id="areaSelcet">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th><span></span></th>
									<td>
										<div></div>
									</td>
								</tr>
								<tr>
									<th><span>관심</span><span>카테고리</span></th>
									<td>
										<div style="display: flex;">
											<select class="form-control"
												style="height: 40px; width: 200px; margin-right: 20px; border: 1px solid #2c2b2b17;"
												name="categorySelect" id="categorySelcet">
												<option value="선택">선택해주세요</option>
												<option value="운동">운동</option>
												<option value="봉사활동">봉사활동</option>
												<option value="음식">음식</option>
												<option value="여행">여행</option>
												<option value="반려동물">반려동물</option>
												<option value="게임">게임</option>
												<option value="음악/댄스">음악/댄스</option>
												<option value="독서">독서</option>
												<option value="기타">기타</option>
											</select>
											<button type="button" class="btn btn-primary"
												id="categryClick">추가</button>
										</div>
									</td>
								</tr>
								<tr>
									<th></th>
									<td>
										<div id="ca"></div> <input type="hidden" name="category1"
										id="category1"> <input type="hidden" name="category2"
										id="category2"> <input type="hidden" name="category3"
										id="category3">
									</td>
								</tr>
								<tr>
									<th>프로필글</th>
									<td><input type="text" style="height: 40px;"
										class="form-control" id="profileWriting" name="profileWriting"
										placeholder="프로필글"></td>
								</tr>
								<tr>
									<th>프로필사진</th>
									<td><input type="file" style="height: 40px;"
										class="form-file" id="profileImageFile"
										name="profileImageFile" placeholder="프로필사진"></td>
								</tr>
							</tbody>
						</table>
						<div class="exform_txt">
							<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
						</div>
					</div>
					<!-- join_form E  -->
					<div class="agree_wrap">
						<div class="checkbox_wrap mar27">
							<input type="checkbox" id="marketing" name="marketing"
								class="agree_chk"> <label for="marketing">[선택]마케팅
								목적 개인정보 수집 및 이용에 대한 동의</label>
							<ul class="explan_txt">
								<li><span class="red_txt">항목 : 성별, 생년월일</span></li>
								<li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br /> 대해
									동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br /> 다만 이때 회원 대상 서비스가
									제한될 수 있습니다.
								</li>
							</ul>
						</div>
					</div>
					<div class="btn_wrap">
						<a href="#" id="addUser" style="height: 50px;">확인</a>
					</div>
					<br />
				</div>
				<!-- form_txtInput E -->
			</div>
			<!-- content E-->
		</div>
		<!-- container E -->
	</form>
</body>
</html>