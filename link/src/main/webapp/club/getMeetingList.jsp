<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ page import = "java.net.URLEncoder" %>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	String userId = (String)session.getAttribute("user");

	if(userId == null) {
		String message = "���� �α��� �Ͻ� �� ��� �����մϴ�.";
		message = URLEncoder.encode(message, "utf-8");

		response.sendRedirect("/user/login.jsp?message = "+message);
	} else{

	}

%>
 --%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>������������Ʈ</title>
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
	body {
    background-color: #fbfbfb;
    color: #333;
    /* font-size: 1.125em; */
    font-size: 15px !important;
    font-family: 'Open Sans', sans-serif;
    line-height: 0.8 !important;
	}
	
	.darkover {
    position: sticky !important ;
    top: auto;
    bottom: 0;
    left: 0;
    background: rgba(0,0,0,0.35);
	}
	
	#calendar {
	margin-left: 0px;
	margin-top: 50px;
	width: 90%;
	height: 800px;
	display: flex;
	justify-content: center;
	}
	
	
	element.style {
	
		margin-right: 115px !important;
		/* overflow: visible !important; */
	}
	
	.fc-scroller {
		overflow-y : hidden !important;
	}
	
	
	
	</style>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	$(function(){
		$("button.btn.btn-addMeeting").on("click", function(){
			self.location="/club/addMeetingView.jsp"
		});
	});
	
	
	</script>	
	
</head>

	<body class="blog masonry-style">
	
	<jsp:include page="/toolbar.jsp" />
		
	<main role="main">
		
			<div id="intro-wrap" data-height="20" style=""><!-- ��� ������ ���� ���� -->
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MEETING LIST</h2>
							<p>the beginning of a meeting...</p>
						</div>
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->
			
		
			<div id="main" class="row"><!-- �߰� �������� -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				

					<ul class="inline cats filter-options" style="font-size: 40px; margin-bottom: 0em;">
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
	
			</div>
		</div>
	
	
	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<button type="button" class="btn btn-addMeeting" style="float:right; background-color:#BD76FF; color:#fbfbfb; margin-right: 115px;">�������</button>


	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row" id="calendar" style="">
	    
	    	<jsp:include page="/club/calendar.jsp"/>	    		    
	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
     <%--  <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >������������</th>
            <th align="left">����������¥</th>
            <th align="left">���������ð�</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		<tr>
		${clubList}
		  <c:set var="i" value="0" />
		  <c:forEach var="i" items="${meetingList}">
		  <input type="hidden" name="meetingNo" value="${i.meetingNo}">
			<tr>
			<td align="center"><a href="/club/getMeeting?meetingNo=${i.meetingNo}">${i.meetingNo}</a>
			  <td align="left">${i.meetingTitle}</td>
			  <td align="left">${i.meetingDate}</td>
			  <td align="left">${i.meetingTime}</td>
			  <td align="left">${i.meetingPlace}</td>			  
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table> --%>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->

	</main>
	
</body>

</html>