<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
			alert('����');
			fncUpdateMemberRole();
			window.close();
		});
		
		$("a[href='#']").on("click", function() {
			//alert('������?');
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
  			//alert("���� ���̵� :"+userId);
  			//alert("�����ѹ���? :"+clubUserNo);
  			
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
						
   						console.log("�����Ϸ�");
   						window.close();
						}
   				});
			}
    	});
	}
	
    </script>
    
    </head>

<body>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">�� å �� ��</h2>
				<p class="exTxt">���ӿ��� ��å�� �����غ�����...</p>
			
			</div>
			
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<%-- <input type="hidden" id = "userId" name="userId" value="${ user.userId }"> --%>
		
		<input type="hidden" id="clubUserNo" value="">
		<!-- <input type="text" id="memberRole" value=""> -->
		
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���ӿ� ���̵�</label>
				<div class="col-sm-2">
					<input type="text" id="userId" value="" style="height:34px; width: 160%;">
				</div>
			</div>
			
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��å</label>
				<div class="col-sm-2">
					<select class="form-control" name="memberRole" id="memberRole">
						<option value="1">���Ӻδ�ǥ</option>
						<option value="0">���ӿ�</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="change" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	</div>
 	
</body>

</html>