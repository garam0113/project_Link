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
			alert("���Ͽ��� �Ϸ�");
		});

		$("#add").on("click", function() {
			console.log($("#addRoomName").val());
			if (socket == undefined) {
				alert("������ ����Ǿ� ���� �Ƚ��ϴ�");
				return;
			}
			socket.emit("name", $("#addRoomName").val());
			self.location = "https://192.168.0.183:4040";
		})
	});
</script>
</head>
<body>
	<!--  �ڽ��� ȭ�� ���� -->

	<h3>Room����</h3>
	<input type="text" id="addRoomName" name="addRoomName">
	<button type="button" id="add">���</button>
	<script src="https://192.168.0.183:4000/socket.io/socket.io.js"></script>

</body>
</html>
