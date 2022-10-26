<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소켓 테스트</title>
</head>

<style>
#box {
	border: 2px solid #ddd;
	padding: 10px;
	min-height: 100px;
	font-size: 12px;
}
</style>

<body>

	<h2>Logs</h2>
	<div id="box"></div>

	<h2>Push API</h2>
	<p>
		새 창에서 <a href="/push" target="_blank">Push API</a> 를 호출하면 위 Logs에 수신된
		알림이 출력된다.
	</p>

	<!-- socket.io 모듈이 만들어주는 js를 호출한다. -->
	<script src="/socket.io/socket.io.js"></script>
	<script>
  // 소켓 서버 연결
  var socket = io();
  var box = document.getElementById("box");

  // noti 이벤트 수신
  socket.on("noti", function(){
    var time = getTimeString();

    box.insertAdjacentHTML("afterbegin", "<div>" + time + " 소켓 서버로부터 알림을 받았습니다.</div>");
  });

  function getTimeString() {
    var h = new Date().getHours();
    var m = new Date().getMinutes();
    var s = new Date().getSeconds();
    var fill = function(n) {return n<10 ? "0" + n : n};

    return fill(h) + ":" + fill(m) + ":" + fill(s);
  }
</script>
</body>
</html>