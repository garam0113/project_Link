<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>�������� ������ ����Ʈ</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
 	 
	.club-wrap {
			width : 100%;
			margin: 10px auto;
			position: relative;
	}
	
	.club-wrap img {
			width: 100%;
			vertical-align: middle;
			filter: brightness(1.1);
	}
	
	.club-text {
			
			position: absolute;
			top: 50%;
			left: 50%;
			width: 100%;
			transform: translate(-50%, -50%);
			font-size: 20px;
			text-align: center;
			
	}
	
	main {
		background-color: #f0f2f5 !important;
	}
	
	#main {
		background-color: #f0f2f5 !important;
	}
	
	.h2-color {
		color: yellow;
	}
	
	.p-color {
		color: yellow;
	}
	
	</style>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	

	$(function() {
		
		$("#deleteParticipant").on("click", function() {
			alert("�������� ������ ����մϴ�.");
			$("form").attr("method", "POST").attr("action", "/club/deleteMeetingMember").submit();
		});
		
	/* 	$(document).on("click", "#deleteParticipant", function() {
			
			var meetingNo = $(this).val();
			var userId = $(this).attr("userId");
			
			$.ajax("/clubRest/json/deleteMeetingMember" ,
					{
						method : "POST" ,
						data : JSON.stringify({
							meetingNo : meetingNo ,
							userId : userId
						}) ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"							
						},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
						} // end of success
				
					}); // end of ajax		
				}); // end of ��û���
			
		}); */
	
	
		});
	
	
	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});
	
	
	
	
	</script>	
	
</head>

<body class="blog masonry-style">
		
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

		<main role="main">
			<div id="intro-wrap" data-height="17.35"><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<!-- <div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);"> -->
					<div class="intro-item">
					
						<div class="club-wrap">
						
							<div class="club-image">
							<img src="/resources/image/uploadFiles/${club.clubImage}" width="1500" height="300" name="file" id="clubImage">
							</div>
							
							<div class="club-text">
							<h2 class="h2-color">Meeting Member List</h2>
							<p class="p-color">Make good memories with the members...</p>
							</div>							
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
	
	
	
	
			    
			  <form class="form-horizontal">  
		      <!--  table Start /////////////////////////////////////-->
		      <table class="table table-hover table-striped" >
		      
		        <thead>
		          <tr>
		          	<th align="left">ȸ�� �����ʻ���</th>
		            <th align="left" >ȸ�� ���̵�</th>
		            <th align="left">ȸ�� �г���</th>
		          </tr>
		        </thead>
		       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${meetingMemberList}">
		  <input type="hidden" name="participantNo" value="${i.participantNo}">
			<tr>
			<td align="left">
			<a href="/myHome/getYourHome?userId=${i.user.userId}"><img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"></a>
			</td>
			  <td align="left">${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  
			  
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
		<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-default" id="deleteParticipant">��&nbsp;û&nbsp;��&nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>					
		    </div>
			</div>		
	  
	  </form>
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
	</div>
	</main>
</body>

</html>