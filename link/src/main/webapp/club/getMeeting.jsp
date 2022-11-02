<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

	<!-- alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	

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
	
	
	</style>

	<!-- ?? -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
		
	$(function() {
		<%-- 일정삭제 --%>		
		
		$(document).on("click", "#deleteMeeting", function() {
			
			Swal.fire({
				title: '정말 일정을 삭제하시겠습니까?' ,
				text: "삭제한 일정은 복구되지 않습니다.",
				icon: 'warning' ,
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '삭제',
				cancelButtonText: '취소' ,
			}).then((result) => {
				if (result.value) {
					
					$("form").attr("method", "POST").attr("action", "/club/deleteMeeting").submit();
					//fncDeleteMeeting();
				} // end of if
			})// end of swal
		})
		
	//일정 참가

		$(document).on("click", "#addMeetingMember", function() {
		
			Swal.fire({
				title: '일정에 참여합니다' ,
				text: '즐거운 만남하세요' ,
				icon: 'warning' ,
				showConfirmButton: true,
				confirmButtonText: '참가',
				cancelButtonText: '취소' ,
			}).then((result) => {
				if(result.value) {
				
			$("form").attr("method", "POST").attr("action", "/club/addMeetingMember").submit();
			}
		})	
	})
	
	$(function() {
		$("#deleteMeeting").on("click", function() {
			fncDeleteMeeting();
		});
	});
	
	$(function() {
		$("#cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	$(function() {
		$("#updateMeeting").on("click", function() {
			self.location="/club/updateMeetingView?meetingNo="+${meeting.meetingNo};
		});
	});
	
	$(function() {
		$(".homeBtn").on("click", function() {
			self.location="/club/getClub?clubNo=${clubNo}";
		});
	});
	
	$(function() {
		$(".clubPostBtn").on("click", function() {
			self.location="/clubPost/getClubPostList";
		});
	});
	
	$(function() {
		$(".clubMemberBtn").on("click", function() {
			self.location="/club/getClubMemberList";
		});
	});
	
	//모임채팅 모임게시물에서 넘어가야해서 안들어가짐
	$(function() {
		$(".clubChatBtn").on("click", function() {
			self.location="/clubPost/chatRoomList?rommId=${club.roomId}&clubTitle=${club.clubTitle}&clubImage=${club.clubImage}";
		});
	});
	
});
	
	</script>	

</head>

<body>

	
	<jsp:include page="/toolbar.jsp" />	
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom" style="margin-top: 100px;">
				
				
				
					<div class="homrBtn_group">
						<button type="button" class="homeBtn" style="margin-top: 17px;">
							<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 
						</button>
						
						<button type="button" class="clubPostBtn">
							<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubMemberBtn">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="clubChatBtn">
							<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						</button>
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
					</div>
		
	<div class="container">
		<div class="form_txtInput" style="margin-top: 50px;">
			<h2 class="sub_tit_txt">일정상세보기</h2>
		
		</div>
		
	
		<!-- 합치자~~ -->
		<div class="mainForm">
		<!-- 상세 div -->
			
			<!-- <form class="form-horizontal" style="width: 443px;"> -->
			<div class="detailForm" style="background-color: #ffffff; width: 775px; height: 515px; margin-left: 10px; margin-top: 10px; border-radius: 10px;">
			
				<div>
					<div class="col-xs-4 col-md-6" style="margin-top: 15px;"><strong>일정제목</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingTitle}</div> 		
				</div>
					
				<p>
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>일정날짜 </strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingDate}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>일정시간</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingTime}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>일정장소</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingPlace}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>일정설명</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingContent}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>정 원</strong><a href="/club/getMeetingMemberList">(참여인원)</a></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">(${meetingCount}/${meeting.meetingMaximumMember})</div>
				</div>
				
				<p>
				
				</div> <!-- detailForm 종료 -->			
			<!-- </form>	 -->
			
		<%-- 	<div class="mapArea">
				<jsp:include page="/club/searchPlace.jsp"/>			
			</div> --%>
		
		<!-- 합치자~ -->		
		</div>	
		<form>
			<div class="btn_group" id="btn_group" style="margin-top: 60px;">
				<div class="col-sm-offset-6  col-sm-6 text-center" style="margin-left: 20%;">
					<button type="button" class="plain button red cancel" id="addMeetingMember">참가신청</button>
					<button type="button" class="plain button red cancel" id="cancel"> 이&nbsp;전</button>
					
					<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(meeting.user.userId) }">
						<button type="button" class="plain button red cancel" id="updateMeeting">수&nbsp;정</button>
			      		<button type="button" class="plain button red cancel" id="deleteMeeting">삭&nbsp;제</button>
			      	</c:if>
		      		
		 	   </div>
			</div>		
		</form>	
		</div>
		</div>
	</div>
	
</body>
</html>