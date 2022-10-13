<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>������������ȸ</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<style>
	body {
		padding-top : 70px;
	}
	
	</style>

	<script type="text/javascript">
	
	
	function fncDeleteMeeting() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteMeeting")
			.submit();
	}
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			alert("������?");
			fncDeleteMeeting();
			
		});
	});
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			self.location="/club/getMeetingList"
		});
	});
	
	$(function() {

		$("button.btn.btn-waring").on("click", function() {
			self.location="/club/updateMeetingView.jsp"
		});
	});
	
	function fncAddMeetingMember() {
		
		$("form").attr("method", "POST").attr("action", "/club/addMeetingMember")
			.submit();
	}
	
	
	$(function() {
		
		$("button.btn.btn-success").on("click", function() {
			alert("���Խ�û �Ǿ����ϴ�.");
			fncAddMeetingMember();
		});
	});
	
	
	<%--	/* $(function() {

			$("input[value='��û']").bind("click", function(){
				alert("��û�Ͽ����ϴ�.");
				$("form").attr("method", "POST").attr("action", "/club/addMeetingMember").submit();
			});
			
			$(document).on("click", "input[value='��û']", function(){
				alert("��û");
				var meetingNo = $("#meetingNo").val();
				var participantUserId = $("#userId").val();
				
				alert(meetingNo);
				alert(participantUserId);
				
				$.ajax("/clubRest/json/addMeetingMember",
						{
							method : "POST" ,
							data : JSON.stringify({
								meetingNo : meetingNo ,
								participantUserId : userId
							}) ,
							headers : 
							{
								"Accept" : "application/json" ,
								"Content-Type" : "application/json"
							},
							dataType : "json" ,
							success : function
					
						}
						
				)
				
			}); */	--%>

	</script>	

</head>

<body>
		
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">������������ȸ</h3>
	    </div>
	
		<form class="form-horizontal">

		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>�� �� �� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTitle}</div>		
		</div>
			
		
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ¥ </strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� Ȱ �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingPlace}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� �� �� �� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingMaximumMember}</div>
		</div>
		
		<hr/>
		
		
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >��&nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
					<button type="button" class="btn btn-waring"  >��&nbsp;��</button>
					<button type="button" class="btn btn-success"  >��&nbsp;��&nbsp;��&nbsp;û</button>
					
		    </div>
			</div>		
			</form>	
	</div>
</body>
</html>