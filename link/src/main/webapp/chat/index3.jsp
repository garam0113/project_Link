<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html>
<head>
<!-- <meta charset="EUC-KR"> -->
<title>ä�� ������Ʈ</title>
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
    <input name="message" autocomplete="off" /><button>����</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script>
//���ϼ����� ���ӽ�Ų��.
var socket = io.connect("http://localhost:3000/clubchat", { // clubchat ���ӽ����̽�
	cors: { origin: "*" },
	path: '/socket.io'
	/* query: {
		userId : ${ sessionScope.user.userId },
		profileImage : ${ sessionScope.user.profileImage },
		nickName : ${ sessionScope.user.nickName }
	} */
});



//����� ����
socket.on('join', data => {
    $('#chatLog').append('<li>' + data.username + '���� �����ϼ̽��ϴ�</li>');
});

//����� ����
socket.on('leave', data => {
    $('#chatLog').append('<li>' + data.username + '���� �����̽��ϴ�</li>');
});



//server message ��� �̺�Ʈ������ ���
socket.on('server message', function(data){
    console.log(data);
    //���ϼ����κ��� ������ �޽����� ȭ�鿡 ����Ѵ�.
    $('#chatLog').append('<li>' + data.username + ':' + data.message + '</li>');
});

$(document).ready(function(){
    $('#sendForm').submit(function(){
        var message = $('#sendForm input[name=message]');
        //���� ������ 'client message' ��� �̺�Ʈ������ �޼����� �۽��Ѵ�.
        socket.emit('client message', { message : message.val()});
        //input �ڽ� �ʱ�ȭ
        message.val('');
        return false;
    });
});

</script>
</body>
</html>