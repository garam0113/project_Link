<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
		
		<!--  ///////////////////////// jQuery CDN////////////////////////// -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				$(document).on("click", ".button.transparent.aqua", function(){
					location.href = "/clubPost/chatRoom";
				});
				$(".addChatRoom").bind("click", function() {
					alert('a');
					location.href = "/clubPost/chatRoom";
				});
			});
		</script>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<br><br><br><br><br>
						
		<!-- <button class="addChatRoom">ä�ù� ����</button> -->
		
		<a class="button transparent aqua">
		<div style="height: 100px; font-size: 2rem;">
		ä�ù�
		</div></a>
		<!-- <a class="button transparent aqua">
		<div style="height: 100px; font-size: 2rem;">
		�ι�° ä�ù�
		</div></a> -->
	
</body>
</html>