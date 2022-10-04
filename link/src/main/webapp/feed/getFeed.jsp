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
			
			$(".btn_addComment").bind("click", function(){
				alert($("input[name='commentContent']").val());
				$.ajax(
						{
							url : "/feedRest/json/addFeedComment",
							method : "POST",
							data : JSON.stringify ({
								feedNo : $("input[type='hidden']").val(),
								commentContent : $("input[name='commentContent']").val()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								$(".commentList").last().append("hi<br/>");
							} // success end
						} // ajax inner close
				) // ajax close
			});
		})
	
	</script>

</head>
<body>

	content : ${feed.content}
	
	<br/>
		
	<form>
				<input type="hidden" value="${feed.feedNo}">
	nickname :	<input type="text" name="commentContent" value="">
				<input type="button" class="btn_addComment" value="submit">
	
	</form>
		
		<div class="commentList">
			<c:set var="i" value="0"></c:set>
			<c:forEach var="comment" items="${comment}">
				<c:set var="i" value="${i + 1}"></c:set>
					reply : ${comment.feedCommentNo}
					
					<br/><hr>
			</c:forEach>
		</div>
	
</body>
</html>