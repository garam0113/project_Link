<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html>
<head>
<!-- <meta charset="EUC-KR"> -->
<title>채팅 프로젝트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font: 13px Helvetica, Arial; }
    form { background: #000; padding: 3px; position: fixed; bottom: 0; width: 100%; }
    form input { border: 0; padding: 10px; width: 90%; margin-right: 0.5%; }
    form button { width: 9%; background: rgb(130, 224, 255); border: none; padding: 10px; }
    #chatLog { list-style-type: none; margin: 0; padding: 0; }
    #chatLog li { padding: 5px 10px; }
    #chatLog li:nth-child(odd) { background: #eee; }
</style>
</head>
<body>
<ul id="chatLog"></ul>
<form action="" id="sendForm">
    <input name="message" autocomplete="off" /><button>전송</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script>
//소켓서버에 접속시킨다.
var socket = io.connect("http://localhost:3000",{
	cors: { origin: "http://localhost:8080" }
});

//사용자 참가
socket.on('join', data => {
    $('#chatLog').append('<li>' + data.username + '님이 방에 들어왔어유!</li>');
});

//사용자 종료
socket.on('leave', data => {
    $('#chatLog').append('<li>' + data.username + '님이 방에서 나갔어유!</li>');
});

//server message 라는 이벤트명으로 대기
socket.on('server message', function(data){
    console.log(data);
    //소켓서버로부터 수신한 메시지를 화면에 출력한다.
    $('#chatLog').append('<li>' + data.username + ':' + data.message + '</li>');
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
</body>
</html>