<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		body {
            padding-top : 50px;
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
	});	
	
    function fncUpdateUser() {
    	
    	var pw = $("#password").val();
    		var pw2 = $("#password2").val();
    		var email = $("#email").val();
    		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    		var regExp = /^[a-z0-9_]{4,20}$/;
    		
    		if(pw == null || pw.length < 1){
    			swal.fire("비밀번호를 입력하셔야 합니다.");
    			return;
    		}
    		
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
    	    
    		$("form").attr("method", "POST").attr("action", "/user/updateUser").submit();
		}
    
    function popup(){
        var url = "/user/updatePhoneNoView.jsp";
        var name = "updatePhoneNoView";
        var option = "width = 800, height = 300, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
    </script>
    
    </head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">내정보수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input disabled="disabled" type="text" class="form-control" id="userId" name="userId" value="${user.userId }">
		      <input type="hidden" class="form-control" id="userId" name="userId" value="${user.userId }">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">영어, 숫자 조합 6~12자</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		      <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">영어, 숫자 조합 6~12자</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input disabled="disabled" type="text" class="form-control" id="name" name="name" value="${user.name}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		    <div class="col-sm-4">
		      <input disabled="disabled" type="text" class="form-control" id="gender" name="gender"  value="${user.gender}">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주민번호</label>
		    <div class="col-sm-4">
		      <input disabled="disabled" type="text" class="form-control" id="rrn" name="rrn" value="${user.rrn}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		    <div class="col-sm-2">
		      <input disabled="disabled" type="text" class="form-control" id="phoneNo" name="phoneNo" value="${ user.phoneNo }">
		    </div>
		      <button type="button" class="btn btn-primary btn" id="phoneChange" >변&nbsp;경</button>
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="변경이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="update" >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>