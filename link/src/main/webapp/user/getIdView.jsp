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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript" charset="utf-8" src="/resources/javascript/SMSCheck.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
    <script type="text/javascript">
    	$(function() {
			$("#check").on("click", function() {
				fncGetId();	//IDã��
			});
			
			$("a[href='#']").on("click", function() {
				window.close();
			});
		});
    	
    	function fncGetId() {
			
    		var name = $("#name").val();
    		var rrn = $("#rrn").val();
    		var phone2 = $("#phone2").val();
    		var phone3 = $("#phone3").val();
    		var phoneNo = $("#phone1").val()+"-"+phone2+"-"+phone3;
  			var checkNo = $("#checkNo").val();
  			var email = $("#email").val();
  			
  			if(name == null || name.length < 1){
  				swal.fire("�̸��� �Է��� �ּ���.");
  				return;
  			}
  			
  			if(rrn == null || rrn.length < 1){
  				swal.fire("�ֹι�ȣ�� �Է��� �ּ���.");
  				return;
  			}
  			/*
  			if(checkNo != 1){
  				swal.fire("������ �ʿ��մϴ�.");
  				return;
  			}*/
  			
  			$('#myTabs a').click(function (e) {
  			  e.preventDefault()
  			  $(this).tab('show')
  			})
  			
  			$.ajax("/userRest/json/getUserId", {
  				
  				type : "POST",
  				data : JSON.stringify({
  					name : name,
  					rrn : rrn
  				}),
  				dataType : "json",
  				contentType : "application/json",
  				henders : {
  					"Accept" : "application"
  				},
  				success : function(Data, status) {
					console.log(Data.phoneNo)
					console.log(phoneNo)
					
					if(Data.phoneNo != phoneNo){
						swal.fire("�ڵ�����ȣ�� ��ġ���� �ʽ��ϴ�.");
						return;
					}
				}
  			})
  			$("form").attr("method", "POST").attr("action" , "/user/getUserId").submit();
		}
    	
    </script>
    
    </head>

<body>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
			<h1 class="bg-primary text-center">IDã��</h1>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" value="" placeholder="�̸�">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="rrn" class="col-sm-offset-1 col-sm-3 control-label">�ֹι�ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="rrn" name="rrn" value="" placeholder="�ֹι�ȣ">
		    </div>
		  </div>
		  
		  <ul class="nav nav-tabs" role="tablist" >
		     <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">�ڵ���</a></li>
		      <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">�̸���</a></li>
		  </ul>
		  
		  <div class="tab-content">
		   <div role="tabpanel" class="tab-pane active" id="home">
		    <label for="phoneNo" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
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
						placeholder="��ȣ">
			</div>
			
			<div class="col-sm-2">
					<input type="text" class="form-control" id="phone3" name="phone3"
						placeholder="��ȣ">
			</div>
			<input type="hidden" name="phoneNo" />
				
			<div class="col-sm-2">
					<button type="button" id="sendPhoneNumber" class="btn ">������ȣ����</button>
			</div>
		  </div>
		  
		   <div role="tabpanel" class="tab-pane" id="profile">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�����̸���">
		    </div>
			<div class="col-sm-4">
					<button type="button" id="sendPhoneNumber" class="btn ">������ȣ����</button>
			</div>
		  </div>
		  </div>
		  
		  <br/>
		  <br/>
		  <br/>
		  <div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="inputCertifiedNumber"
						name="inputCertifiedNumber" placeholder="������ȣ">
				</div>
				<div class="col-sm-4">
					<button type="button" id="checkBtn" class="btn ">������ȣȮ��</button>
					<input type="hidden" id=checkNo>
				</div>
		</div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="check" class="btn btn-primary"  >Ȯ &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>