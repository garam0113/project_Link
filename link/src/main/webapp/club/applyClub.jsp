<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

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
	
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  	<!--  	jQuery UI toolTip ��� JS -->
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        
                    
        element.style {
    	margin-top: 100px !important;
		}
		
		
		.h1, .h2, .h3, h1, h2, h3 {
 		   margin-top: 20px;
		   margin-bottom: 50px;
		}
		
        
        
        
        
    </style>
    
<script type="text/javascript">


	function fncAddApprovalCondition() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////


		$("form").attr("method", "POST").attr("action", "/club/addApprovalCondition")
				.submit();
	}


	$(function() {

		$("button.btn.btn-apply").on("click", function() {
			
			fncAddApprovalCondition();
		});
	});	

	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			history.go(-1);
		});
	});

</script>
</head>

<body>
	
	<div class="container">
	
		<h1 class="bg-primary text-center" style="background-color:#BD76FF; color:#fbfbfb; width:700px; margin-left: 166px;">�� �� �� �� �� û</h1>
		
		<form class="form-horizontal">
		
		<!-- 	<div class="form-group">
				<label for="user.userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="user.userId" name="user.userId" placeholder="�̸��� �ʼ��Դϴ�">
				</div>					
			</div> -->
						
			<div class="form-group">
				<label for="joinGreeting" class="col-sm-offset-1 col-sm-3 control-label"> �� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="joinGreeting" name="joinGreeting" placeholder="�����λ�� �ʼ��Դϴ�.">
				</div>		
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-apply" style="background-color: #BD76FF; color:#fbfbfb;">��&nbsp;û</button>
					<button type="button" class="btn btn-cancel" style="background-color: #BD76FF; color:#fbfbfb;">��&nbsp;��</button>
		    </div>
			</div>
		</form>	
		</div>
		
</body>
</html>