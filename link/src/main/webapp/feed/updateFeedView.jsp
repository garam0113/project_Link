<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<script type="text/javascript">
	
		$(function(){
			
			$(".btn_update").bind("click", function() {
				alert("�����ϱ�");
				$("form").attr("method", "POST").attr("action", "/feed/updateFeed").submit();
			})
		
		})
	
	</script>

</head>
<body>

	�۹�ȣ : ${feed.feedNo}
	
	<br/><br/>

	�ۼ��� : ${feed.userId}
	<br/><br/>
	
	<form>
				<input type="hidden" name="feedNo" value="${feed.feedNo}">

	content :	<input type="text" name="content" value="${feed.content}">
				<button type="button" class="btn_update">����</button>
	
	�����ƴ�
	</form>
		
	<hr/><hr/>
	
	<br/>
		
	
</body>
</html>