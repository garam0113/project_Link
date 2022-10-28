<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
		<script src="js/plugins.js"></script>
		<script src="js/beetle.js"></script>
		
		<!-- 사용자 정의 css -->
		<link href="/resources/css/chat/chat.css" rel="stylesheet">
		
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!--  font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
		
		<style>
		    * { margin: 0; padding: 0; box-sizing: border-box; }
		    body { font: 13px Helvetica, Arial; }
		    form { background: #000; padding: 3px; bottom: 0; width: 100%; }
		    
		    form button { width: 100%; background: rgb(130, 224, 255); border: none; padding: 10px; }
		    #chatLog { list-style-type: none; margin: 0; padding: 0; }
		    #chatLog li { padding: 5px 10px; }
		    /* #chatLog li:nth-child(odd) { background: #eee; } */
		    /* 전제 글씨체 */
			.row{ font-family: 'Single Day', cursive; }
		</style>
	</head>

	<body class="single single-post">
	
	

	
	
	<!-- 모임채팅 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://192.168.0.74:3000/socket.io/socket.io.js"></script>
	<script>
	//소켓서버에 접속시킨다.
	var socket = io.connect("http://192.168.0.74:3000/clubchat", { // clubchat 네임스페이스
		cors: { origin: "*" },
		path: '/socket.io',
		query: {
			userId : '${ user.userId }',
			profileImage : '${ sessionScope.user.profileImage }',
			nickName : '${ sessionScope.user.nickName }'
		}
	});
	
	//사용자 참가
	socket.on('join', data => {
	    $('#chatLog').append('<li style="font-size: 25px;">' + data.username + '님이 입장하셨습니다</li>');
	});
	
	//사용자 종료
	socket.on('leave', data => {
	    $('#chatLog').append('<li style="font-size: 25px;">' + data.username + '님이 나가셨습니다</li>');
	});
	
	
	
	//server message 라는 이벤트명으로 대기
	socket.on('server message', function(data){
	    console.log(data);
	    //소켓서버로부터 수신한 메시지를 화면에 출력한다.
	    $('#chatLog').append('<li style="font-size: 25px;">' + data.username + '   ' + data.message + '</li>');
	});
	
	$(document).ready(function(){
	    $('#sendForm').submit(function(){
	        var message = $('#sendForm input[name=message]');
	        //소켓 서버의 'client message' 라는 이벤트명으로 메세지를 송신한다.
	        socket.emit('client message', { message : message.val()});
	        //input 박스 초기화
	        message.val('');
	        return false;
	    });
	});
	</script>
	<!-- 모임채팅 -->
	
	
	
	

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->		





		<main role="main">
			<div id="intro-wrap">
			</div><!-- intro-wrap -->

			<div id="main" class="row" style="background-color: #EBEDF0;">
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getMeetingList">모임 일정</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="#">모임 채팅</a>
						</li>
					</ul>
					
					
					<%-- #f5ddff --%>
					
					
					<div class="chat-main" style="padding-left: 100px; padding-right: 100px;">
						<div style="background-color: #E1BFFF; height: 800px; box-shadow: rgba(95, 0, 128, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px; border-radius: 100px; padding: 60px; padding-top: 70px;">
							<div style="background-color: #ffeeff; height: 600px; box-shadow:0 5px 20px rgba(95, 0, 128, 0.4) inset; border-radius: 5px; padding: 10px; overflow: auto;"><ul id="chatLog"></ul></div>
							<form action="" id="sendForm">
								<div style="display: grid; grid-template-columns: 5fr 1fr;">
										<div style="font-size: 20px;"><input name="message" autocomplete="off" style="font-size: 20px;"></div>
										<div><button style="width: 80px; height: 45px; box-shadow:0 5px 20px rgba(95, 0, 128, 0.4); border-radius: 10px; font-size: 30px;">전송</button></div>
								</div>
							</form>
						</div>
					</div>
					
					
					
					
					
				</div><!-- row-content -->
			</div><!-- row -->
		</main><!-- main -->
		
		
		
		

	</body>

</html>
