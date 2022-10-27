<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Rendom Live Call</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	$(function() {

		alert("123");
		var options = {
			"forcNew" : true
		};
		var url = "https://192.168.0.183:4000";

		socket = io.connect(url, options);

		socket.on("connect", function() {
			alert("소켓연결 완료");
		});

		$("#add").on("click", function() {
			console.log($("#addRoomName").val());
			if (socket == undefined) {
				alert("서버가 연결되어 있지 안습니다");
				return;
			}
			socket.emit("name", $("#addRoomName").val());
			self.location = "https://192.168.0.183:4040";
		})
	});
</script>
</head>
<body>
	<!--  자신의 화면 송출 -->

	<h3>Room생성</h3>
	<input type="text" id="addRoomName" name="addRoomName">
	<button type="button" id="add">등록</button>
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>

</body>
</html>
