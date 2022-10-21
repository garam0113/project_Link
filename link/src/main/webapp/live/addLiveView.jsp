<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Make LiveRoom</title>
</head>
<body>

	<div id = "start-page">
		<h2 class="test">Live</h2>
		<input id="roomName" type="text" placeholder="roomName" />
		<button id="join">Join</button>		
	</div>
	<div id="video-page">
		<video id="user-video"></video>
		<video id="peer-video"></video>
	</div>
	
	 <script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
</body>


</html>