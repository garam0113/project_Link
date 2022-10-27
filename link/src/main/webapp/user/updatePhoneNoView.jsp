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
		
		$("#back").on("click", function() {
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
    		swal.fire("�ڵ��� ��ȣ�� �Է��ϼž� �մϴ�.");
    		return;
    	}
    		$("input:hidden[name='phoneNo']").val(value);
    	
    	if(!regPhone.test($("input:hidden[name='phoneNo']").val())){
    		swal.fire("�ڵ�����ȣ�� ����� �Է����ּ���.");
    		return;
    	}	

    	if(checkNo != 1){
    		swal.fire("�ڵ��������� �ʿ��մϴ�.");
    		return;
    	}
    	
   			var phoneNo = $("input:hidden[name='phoneNo']").val();
   			console.log(phoneNo);

 			var userId = $("#userId").val();

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
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="background-color: lavenderblush;" >
	
			<h1 style="font-weight: bold; margin-bottom: 30px; margin-left: 60px;">�ڵ�����ȣ ����</h1>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
		
		<input type="hidden" id = "userId" name="userId" value="${ user.userId }">
		  <div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label" style="margin-left: -10px;">�޴���ȭ��ȣ</label>
				<div class="col-sm-2">
					<select class="form-control" name="phone1" id="phone1" style="margin-left: -10px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>
			
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone2" name="phone2" style="margin-left: -20px;"
						placeholder="��ȣ">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="phone3" name="phone3" style="margin-left: -30px;"
						placeholder="��ȣ">
				</div>
				<input type="hidden" id="phoneNo" name="phoneNo" />
				<div class="col-sm-2">
					<button type="button" id="sendPhoneNumber" class="btn " style="margin-left: -40px; background: white; border-color: #5F0080;">������ȣ����</button>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label" style="margin-left: -20px;">������ȣ</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						name="inputCertifiedNumber" placeholder="������ȣ">
					<input type="hidden" id="checkNo">
				</div>
				<div class="col-sm-2">
					<button type="button" id="checkBtn" class="btn "style="margin-left: -10px; background: white; border-color: #5F0080;">������ȣȮ��</button>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" id="chang" class="btn" style="background-color: #5F0080; border-style: hidden; color: white;">Ȯ &nbsp;��</button>
					<button type="button" id="back" class="btn" style="background-color: #5F0080; border-style: hidden; color: white;">��&nbsp;��</button>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>