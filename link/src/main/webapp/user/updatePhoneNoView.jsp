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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<script type="text/javascript" charset="utf-8" src="/resources/javascript/user/SMSCheck.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
    <script type="text/javascript">
    
    $(function() {
		$("#chang").on("click", function() {
			fncUpdatePhone();
		});
		
		$("a[href='#']").on("click", function() {
			window.close();
		});
	})
    
    function fncUpdatePhone() {
    	
    	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    	var phone2 = $("#phone2").val();
    	var phone3 = $("#phone3").val();
    	var checkNo = $("#checkNo").val();	
    	var value = "";
    	if(phone2 != "" && phone3 !=""){
    		value = $("#phone1").val() + "-"
    		+ phone2 + "-" + phone3;
    	}else if(phone2 != "" || phone3 !=""){
    		swal.fire("핸드폰 번호를 입력하셔야 합니다.");
    		return;
    	}
    		$("input:hidden[name='phoneNo']").val(value);
    	
    	if(!regPhone.test($("input:hidden[name='phoneNo']").val())){
    		swal.fire("핸드폰번호를 제대로 입력해주세요.");
    		return;
    	}	

    	if(checkNo != 1){
    		swal.fire("핸드폰인증이 필요합니다.");
    		return;
    	}
    	
   			var phoneNo = $("input:hidden[name='phoneNo']").val();
   			console.log(phoneNo);

 			var userId = $("#userId").val();
  			alert(userId);

  			$.ajax("/userRest/json/updatePhoneNo", {

    		
   			type : "POST",
   			data : JSON.stringify({
   				userId : userId,
   				phoneNo : phoneNo
   			}),
   			dataType : "json",
   			contentType : "application/json",
   			henders : {
   				"Accept" : "application/json"
   			},
   			success : function() {
   				
   				$.ajax("/userRest/json/getUser", {
   					
   					type : "POST",
   					data : JSON.stringify({
   						userId : userId
   					}),
   					dataType : "json",
   					contentType : "application/json",
   					henders : {
   						"Accept" : "application/json"	
   					},
   					success : function(JSONData, status) {
						
   						console.log("JSONData : "+JSONData.phoneNo);
   						$("#phoneNo", opener.document).val(JSONData.phoneNo);
   						
   						window.close();
						}
   				});
				
			}
    	});
  			
  		$(function() {
			
		})
	}
	
    </script>
    
    </head>

<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
			<h1 class="bg-primary text-center">핸드폰번호 변경</h1>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<input type="hidden" id = "userId" name="userId" value="${ user.userId }">
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
				<input type="hidden" id="phoneNo" name="phoneNo" />
				<div class="col-sm-2">
					<button type="button" id="sendPhoneNumber" class="btn ">인증번호전송</button>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						name="inputCertifiedNumber" placeholder="인증번호">
					<input type="hidden" id="checkNo">
				</div>
				<div class="col-sm-2">
					<button type="button" id="checkBtn" class="btn ">인증번호확인</button>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="chang" class="btn btn-primary">확 &nbsp;인</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>