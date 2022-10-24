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
	
	#btn_group button{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		color: #BD76FF;
    	border-color: #BD76FF;
    	background-color: #fbfbfb;
	}
	
	</style>

	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	
	function fncDeleteMeeting() {
		
		$("form").attr("method", "POST").attr("action", "/club/deleteMeeting")
			.submit();
	}
	
	$(function() {

		$("button.btn.btn-delete").on("click", function() {
			alert("������?");
			fncDeleteMeeting();
			
		});
	});
	
	$(function() {

		$("button.btn.btn-cancel").bind("click", function() {
			self.location="/club/getMeetingList"
		});
	});
	
	$(function() {

		$("button.btn.btn-update").on("click", function() {
			//self.location="/club/updateMeetingView.jsp"
			self.location="/club/updateMeetingView?meetingNo="+${meeting.meetingNo};
		});
	});
	
	function fncAddMeetingMember() {
		
		$("form").attr("method", "POST").attr("action", "/club/addMeetingMember")
			.submit();
	}
	
	
	$(function() {
		
		$("button.btn.btn-addParticipant").on("click", function() {
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

<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />
		
	<main role="main">
		
			<div id="intro-wrap" data-height="27.778"><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MEETING</h2>
							<p>New encounters are always fun...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">���� ����</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">���� �Խù�</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">���ӿ�</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList">���� ä��</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">����</a>
						</li> --%>
					</ul>	
		
		
		
		
		
		
		
	<div class="container">
	
		<form class="form-horizontal">
		
		<div class="row">
			<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTitle}</div> 		
		</div>
			
		
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������¥ </strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ð�</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingPlace}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${meeting.meetingContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong><a href="/club/getMeetingMemberList">(������Ȳ)</a></div>
			<div class="col-xs-8 col-md-4">(${meetingCount}/${meeting.meetingMaximumMember})</div>
			
		</div>
		
		<hr/>
		
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
				
					<button type="button" class="btn btn-addParticipant"  >��&nbsp;��&nbsp;��&nbsp;û</button>
					<button type="button" class="btn btn-cancel" > ��&nbsp;��</button>
					<button type="button" class="btn btn-update"  >��&nbsp;��</button>
		      		<button type="button" class="btn btn-delete"  >��&nbsp;��</button>
					
					
		    </div>
			</div>		
			</form>	
		</div>
		</div>
	</div>
	</main>
</body>
</html>