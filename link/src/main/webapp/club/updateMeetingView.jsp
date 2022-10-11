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
        
    </style>
    
<script type="text/javascript">


	function fncUpdateMeeting() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////


		$("form").attr("method", "POST").attr("action", "/club/updateMeeting")
				.submit();
	}


	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			
			fncUpdateMeeting();
		});
	});	

	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});

</script>
</head>

<body>
	
	<div class="container">
	
		<h1 class="bg-primary text-center">�� �� �� �� �� ��</h1>
		
		<form class="form-horizontal">
		
			<div class="form-group">
				<label for="meetingTitle" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingTitle" name="meetingTitle" placeholder="�������������� �ʼ��Դϴ�">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="meetingDate" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ¥</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingDate" name="meetingDate" placeholder="���ӳ�¥�� �ʼ��Դϴ�.">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingTime" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="meetingTime" name="meetingTime" placeholder="���ӽð��� �ʼ��Դϴ�.">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingPlace" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingPlace" name="meetingPlace" placeholder="������Ҵ� �ʼ��Դϴ�.">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="meetingContent" class="col-sm-offset-1 col-sm-3 control-label">�� �� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingContent" name="meetingContent" placeholder="���������� �ʼ��Դϴ�.">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="meetingMaximumMember" class="col-sm-offset-1 col-sm-3 control-label"> �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="meetingMaximumMember" name="meetingMaximumMember" placeholder="������ �Է����ּ���.">
				</div>		
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
			</div>
		</form>	
		</div>
		
</body>
</html>