<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

<title>모임일정상세조회</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<style>
	body {
		padding-top : 70px;
	}
	
	.plain.button.red.cancel{
	   background-color: white;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: #5F0080 !important;
	   font-size: 16px !important;
	   text-align: center;
	   border: solid 2px;
	}
	
	.plain.button.red.cancel:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: white !important;
	   font-size: 16px !important;
	}
	
	#main {
	
		background-color: #f0f2f5 !important;
	}
	
	main {
		background-color: #f0f2f5 !important;
	}
	
	#menu_wrap {
		display: none !important;
	}
	
	.map_wrap {
		width: 50% !important;
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

		$("#deleteMeeting").on("click", function() {
			alert("눌리나?");
			fncDeleteMeeting();
			
		});
	});
	
	$(function() {

		$("#cancel").bind("click", function() {
			self.location="/club/getMeetingList"
		});
	});
	
	$(function() {

		$("#updateMeeting").on("click", function() {
			//self.location="/club/updateMeetingView.jsp"
			self.location="/club/updateMeetingView?meetingNo="+${meeting.meetingNo};
		});
	});
	
	function fncAddMeetingMember() {
		
		$("form").attr("method", "POST").attr("action", "/club/addMeetingMember")
			.submit();
	}
	
	
	$(function() {
		
		$("#addParticipant").on("click", function() {
			alert("가입신청 되었습니다.");
			fncAddMeetingMember();
		});
	});
	
	
	<%--	/* $(function() {

			$("input[value='신청']").bind("click", function(){
				alert("신청하였습니다.");
				$("form").attr("method", "POST").attr("action", "/club/addMeetingMember").submit();
			});
			
			$(document).on("click", "input[value='신청']", function(){
				alert("신청");
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
		
			<div id="intro-wrap" data-height="15"><!-- 상단 검은색 공통 영역 -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MEETING</h2>
							<p>New encounters are always fun...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 176px;">
						<li data-group="advertising">
							<a href="/club/getClub?clubNo=${clubNo}" style="color: #BD76FF;">모임</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList" style="color: #BD76FF;">모임게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList" style="color: #BD76FF;">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList" style="color: #BD76FF;">모임채팅</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>	
		
		
		
		
		
		
		
	<div class="container">
	
		<!-- 합치자~~ -->
		<div>
		<!-- 상세 div -->
			<div>
			<form class="form-horizontal">
			
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>일정제목</strong></div>
				<div class="col-xs-8 col-md-4">${meeting.meetingTitle}</div> 		
			</div>
				
			
			<hr/>		
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>일정날짜 </strong></div>
				<div class="col-xs-8 col-md-4">${meeting.meetingDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>일정시간</strong></div>
				<div class="col-xs-8 col-md-4">${meeting.meetingTime}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>일정장소</strong></div>
				<div class="col-xs-8 col-md-4"><a href="https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&sq=&o=&q=${meeting.meetingPlace}"></a>${meeting.meetingPlace}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>일정설명</strong></div>
				<div class="col-xs-8 col-md-4">${meeting.meetingContent}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>정 원</strong><a href="/club/getMeetingMemberList">(참여인원)</a></div>
				<div class="col-xs-8 col-md-4">(${meetingCount}/${meeting.meetingMaximumMember})</div>
				
			</div>
			
			<hr/>
			</form>	
	</div>
			
			<div class="mapArea">
				<jsp:include page="/club/searchPlace.jsp"/>			
			</div>
		
	<!-- 합치자~ -->		
	</div>	
		
			<div class="form-group" id="btn_group">
				<div class="col-sm-offset-6  col-sm-6 text-center" style="margin-left: 26%;">
				
					<button type="button" class="plain button red cancel" id="addParticipant"  >참가신청</button>
					<button type="button" class="plain button red cancel" id="cancel"> 이&nbsp;전</button>
					<button type="button" class="plain button red cancel" id="updateMeeting" >수&nbsp;정</button>
		      		<button type="button" class="plain button red cancel" id="deleteMeeting" >삭&nbsp;제</button>
					
					
		 	   </div>
			</div>		
			
		</div>
		</div>
	</div>
	</main>
</body>
</html>