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
	
	<!-- addMeetingCss -->
  	<link rel="stylesheet" href="/resources/css/addUser.css">
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 10px;
        }
        
        .form-control {
        	width: 160%;
        	height: 34px;
        }
    </style>
    
    <script type="text/javascript">
    
    $(function() {
		$("#change").on("click", function() {
			alert('수정');
			fncUpdateMemberRole();
			window.close();
		});
		
		$("a[href='#']").on("click", function() {
			//alert('눌리나?');
			window.close();
		});
	});
    
    function refreshMemList(){
    	location.reload();
    }
    
    function fncUpdateMemberRole() {
    	
    	var userId = $("#userId").val();
    	var memberRole = $("#memberRole").val();
    	var clubUserNo = $("#clubUserNo").val();
    	var value = "";
 

 			var userId = $("#userId").val();
  			//alert("유저 아이디 :"+userId);
  			//alert("유저넘버는? :"+clubUserNo);
  			
  			/* var memberRole = #("#memberRole").val();
  			alert(memberRole); */

  			$.ajax("/clubRest/json/updateMemberRole", {

    		
   			type : "POST",
   			data : JSON.stringify({
   				userId : userId,
   				clubUserNo : clubUserNo,
   				memberRole : memberRole
   			}),
   			dataType : "json",
   			contentType : "application/json",
   			henders : {
   				"Accept" : "application/json"
   			},
   			success : function() {
   				
   				$.ajax("/clubRest/json/getClubMemberList", {
   					
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
						
   						console.log("수정완료");
   						window.close();
						}
   				});
			}
    	});
	}
	
    </script>
    
    </head>

<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">직 책 수 정</h2>
				<p class="exTxt">모임원의 직책을 수정해보세요...</p>
			
			</div>
			
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<%-- <input type="hidden" id = "userId" name="userId" value="${ user.userId }"> --%>
		
		<input type="hidden" id="clubUserNo" value="">
		<!-- <input type="text" id="memberRole" value=""> -->
		
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">모임원 아이디</label>
				<div class="col-sm-2">
					<input type="text" id="userId" value="" style="height:34px; width: 160%;">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">직책</label>
				<div class="col-sm-2">
					<select class="form-control" name="memberRole" id="memberRole">
						<option value="1">모임부대표</option>
						<option value="0">모임원</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="change" class="btn btn-primary">수 &nbsp;정</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	</div>
 	
</body>

</html>