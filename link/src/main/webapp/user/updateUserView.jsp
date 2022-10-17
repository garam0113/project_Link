<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    		
    		console.log("패널티 값 : "+penalty);
    		//console.log("정지 날짜 : "+stopEnd.datepicker({ dateFormat: 'yy-mm-dd' }));
    		
    		if(${user.role == '0'} && (pw == null || pw.length < 1)){
    			swal.fire("비밀번호를 입력하셔야 합니다.");
    			return;
    		}
    		
    		if(${user.role == '0'}){
    		
    			if(6 > pw.length || pw.length > 12){
    				swal.fire("비밀번호는 영어, 숫자조합 6~12자 입니다.");
    				return;
    			}
    		
    			if(!regExp.test(pw)){
    				swal.fire("비밀번호는 영어, 숫자조합 6~12자 입니다.");
    				return;
    			}
    			
    			if(pw != pw2){
    				swal.fire("비밀번호가 다릅니다.");
    				return;
    			}
    				
    			if(email == null || email.length < 1){
    				swal.fire("이메일을 입력하셔야 합니다.");
    				return;
    			}
    		
    			if(!regEmail.test(email)){
    				swal.fire("이메일을 제대로 입력해주세요.");
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
					console.log("update된 패널티 값 : "+Data.penaltyType)
					console.log("update된 정지날짜 : "+Data.stopEndDate)
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
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
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
						<h2 class="sub_tit_txt">내정보수정</h2>
					</c:if>
					<c:if test="${user.role == '1'}">
						<h2 class="sub_tit_txt">회원정보수정</h2>
					</c:if>
					<div class="join_form">
						<table>
							<colgroup>
								<col width="30%" />
								<col width="auto" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>아이디</span></th>
									<td><input disabled="disabled" class="form-control"
										id="userId" name="userId" value="${getUser.userId }">
										<input type="hidden" class="form-control" id="userId"
										name="userId" value="${getUser.userId }"></td>
								</tr>
								<tr>
									<th><span>이름</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="name" name="name"
										value="${getUser.name}">
										<input type="hidden" class="form-control" id="name"
										name="name" value="${getUser.name }">
										</td>
								</tr>
								<tr>
								<tr>
									<th><span>성별</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="gender" name="gender"
										value="${getUser.gender}">
										<input type="hidden" class="form-control" id="gender"
										name="gender" value="${getUser.gender }"></td>
								</tr>
								<tr>
									<th><span>주민번호</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="rrn" name="rrn"
										value="${getUser.rrn}">
										<input type="hidden" class="form-control" id="rrn"
										name="rrn" value="${getUser.rrn }"></td>
								</tr>
								<c:if test="${user.role == '0'}">
									<tr>
										<th><span>비밀번호</span></th>
										<td><input type="password" class="form-control"
											id="password" name="password" placeholder="변경비밀번호"> <span
											id="helpBlock" class="help-block"> <strong
												class="text-danger">영어, 숫자 조합 6~12자</strong>
										</span></td>
									</tr>
								</c:if>
								<c:if test="${user.role == '0'}">
									<tr>
										<th><span>비밀번호 확인</span></th>
										<td><input type="password" class="form-control"
											id="password2" name="password2" placeholder="변경비밀번호 확인">
											<span id="helpBlock" class="help-block"> <strong
												class="text-danger">영어, 숫자 조합 6~12자</strong>
										</span></td>
									</tr>
								</c:if>
								<tr class="email">
									<th><span>이메일</span></th>
									<td><c:if test="${user.role == '0'}">
											<input type="text" class="form-control" id="email"
												name="email" value="${getUser.email}" placeholder="변경이메일">
										</c:if> 
											<c:if test="${user.role == '1'}"><input disabled="disabled" type="text" class="form-control"
										id="email" name="email" value="${getUser.email}"
										placeholder="변경이메일"></c:if>
										</td>
								</tr>
								<tr>
									<th><span>휴대폰 번호</span></th>
									<td><input disabled="disabled" type="text"
										class="form-control" id="phoneNo" name="phoneNo"
										value="${ getUser.phoneNo }"> <c:if
											test="${user.role == '0'}">
											<button type="button" class="btn btn-primary btn"
												id="phoneChange">변&nbsp;경</button>
										</c:if></td>
								</tr>
								<c:if test="${user.role == '1'}">
									<tr>
										<th><span>정지상태</span></th>
										<td><select name="penaltyType" id="penaltyType">
												<option selected="selected">선택해주세요</option>
												<option>ㅡ</option>
												<option>정지</option>
												<option>영구정지</option>
										</select></td>
									</tr>
								</c:if>
								<c:if test="${user.role == '1'}">
									<tr>
										<th><span>정지기간</span></th>
										<td><input class="form-control" id="stopEndDateString"
											readonly="readonly" name="stopEndDateString" value="" /></td>
									</tr>
								</c:if>
								<tr>
									<th><span></span></th>
									<td align="center">
										<button type="button" class="btn btn-primary" id="update">수
											&nbsp;정</button>
										<button type="button" class="btn btn-primary" id="cancel">취
											&nbsp;소</button>
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