<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<%-- �������� --%>		
		
		$(document).on("click", "#deleteMeeting", function() {
			
			Swal.fire({
				title: '���� ������ �����Ͻðڽ��ϱ�?' ,
				text: "������ ������ �������� �ʽ��ϴ�.",
				icon: 'warning' ,
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '����',
				cancelButtonText: '���' ,
			}).then((result) => {
				if (result.value) {
					
					$("form").attr("method", "POST").attr("action", "/club/deleteMeeting").submit();
					//fncDeleteMeeting();
				} // end of if
			})// end of swal
		})
		
	//���� ����

		$(document).on("click", "#addMeetingMember", function() {
		
			Swal.fire({
				title: '������ �����մϴ�' ,
				text: '��ſ� �����ϼ���' ,
				icon: 'warning' ,
				showConfirmButton: true,
				confirmButtonText: '����',
				cancelButtonText: '���' ,
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
	
	
});
	
	</script>	

</head>

<body>

	
	<jsp:include page="/toolbar.jsp" />	
		
			<div id="main" class="row" style="background: #EBEDF0 !important;"><!-- �߰� �������� -->
			
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
						
						<button type="button" class="live">
							 <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 
						</button>
					</div>
		
	<div class="container">
		<div class="form_txtInput" style="margin-top: 50px;">
			<h2 class="sub_tit_txt">�����󼼺���</h2>
		
		</div>
		
	
		<!-- ��ġ��~~ -->
		<div class="mainForm">
		<!-- �� div -->
			
			<!-- <form class="form-horizontal" style="width: 443px;"> -->
			<div class="detailForm" style="background-color: #ffffff; width: 775px; height: 515px; margin-left: 10px; margin-top: 10px; border-radius: 10px;">
			
				<div>
					<div class="col-xs-4 col-md-6" style="margin-top: 15px;"><strong>��������</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingTitle}</div> 		
				</div>
					
				<p>
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>������¥ </strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingDate}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>�����ð�</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingTime}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>�������</strong></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">${meeting.meetingPlace}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>��������</strong></div>
					<div class="col" style="margin-left: 20px;">${meeting.meetingContent}</div>
				</div>
				
				<p>
				
				
				<div>
			  		<div class="col-xs-4 col-md-6 "><strong>�� ��</strong><a href="/club/getMeetingMemberList">(�����ο�)</a></div>
					<div class="col-xs-8 col-md-6" style="margin-left: 5px;">(${meetingCount}/${meeting.meetingMaximumMember})</div>
				</div>
				
				<p>
				
				</div> <!-- detailForm ���� -->			
			<!-- </form>	 -->
			
		<%-- 	<div class="mapArea">
				<jsp:include page="/club/searchPlace.jsp"/>			
			</div> --%>
		
		<!-- ��ġ��~ -->		
		</div>	
		<form>
			<div class="btn_group" id="btn_group" style="margin-top: 60px;">
				<div class="col-sm-offset-6  col-sm-6 text-center" style="margin-left: 20%;">
					<button type="button" class="plain button red cancel" id="addMeetingMember">������û</button>
					<button type="button" class="plain button red cancel" id="cancel"> ��&nbsp;��</button>
					
					<c:if test="${ fn:trim(sessionScope.user.userId) == fn:trim(meeting.user.userId) }">
						<button type="button" class="plain button red cancel" id="updateMeeting">��&nbsp;��</button>
			      		<button type="button" class="plain button red cancel" id="deleteMeeting">��&nbsp;��</button>
			      	</c:if>
		      		
		 	   </div>
			</div>		
		</form>	
		</div>
		</div>
	</div>
	
</body>
</html>