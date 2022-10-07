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
			}); // event close
			
			$("#heart").bind("click", function() {
				
				$.ajax(
						{
							url : "/feedRest/json/addFeedHeart",
							method : "POST",
							data : JSON.stringify ({
								userId : 'user01',
								source : 0,
								sourceNo : $("input[name='feedNo']").val(),
								feedNo : $("input[name='feedNo']").val()
							}),
							contentType : 'application/json',
							dataType : 'json',
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								alert("success");
							}
							
						} // ajax inner close
				
				) // ajax close
				
			}); // #heart event close
			
			$("#deleteheart").bind("click", function() {
				
				$.ajax(
						{
							url : "/feedRest/json/deleteFeedHeart",
							method : "POST",
							data : JSON.stringify ({
								userId : 'user01',
								source : 0,
								sourceNo : $("input[name='feedNo']").val(),
								feedNo : $("input[name='feedNo']").val()
							}),
							contentType : 'application/json',
							dataType : 'json',
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								alert("success");
							}
							
						} // ajax inner close
				
				) // ajax close
				
			}); // #heart event close
			
			$(".btn_addReComment").bind("click", function(){
				alert($(this).prev().prev().prev().val());
				alert($(this).prev().prev().val());
				alert($(this).prev().val());
				$.ajax(
						{
							url : "/feedRest/json/addFeedComment",
							method : "POST",
							data : JSON.stringify ({
								feedNo 			: $(this).prev().prev().prev().prev().val(),
								feedCommentNo 	: $(this).prev().prev().prev().val(),
								commentContent 	: $(this).prev().val(),
								depth 			: $(this).prev().prev().val()
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
			}); // event close
		
		
			$("#update").bind("click", function() {
				alert("update");
				$("form").attr("method", "GET").attr("action", "/feed/update");
			})
		
		
		})
	
	</script>

</head>
<body>

	작성자 : ${feed.userId}
	<br/><br/>
	
	content : ${feed.content}
	
	좋아요 개수 : ${feed.heartCount}
	
	
	
	<br> 내가 좋아요 했는지 체크 ${feed.checkHeart}
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${sessionScope.user.userId eq feed.userId}">
		<button type="button" id="update" >수정</button>
	</c:if>
	
	<br>
	
	<c:if test="${feed.checkHeart == 0}">
		<button type="button" id="heart">좋아요</button>
	</c:if>
	
	<c:if test="${feed.checkHeart != 0}">
		<button type="button" id="deleteheart">좋아요취소요</button>
	</c:if>
	
	
	<br> 해시태그 : ${feed.hashtag}
	
	<hr/><hr/>
	
	<br/>
		
	<form>
				<input type="hidden" name="feedNo" value="${feed.feedNo}">
				<input type="hidden" name="sequence" value="${feed.commentCount}">
	댓글달기 :		<input type="text" name="commentContent" value="">
				<input type="button" class="btn_addComment" value="submit">
	
	<hr/>
	
	</form>
		
		<div class="commentList">
			<c:set var="i" value="0"></c:set>
			<c:forEach var="comment" items="${commentList}">
				<c:set var="i" value="${i + 1}"></c:set>

						[댓글번호 ${comment.feedCommentNo}] [내용 ${comment.commentContent}] [깊이 ${comment.depth}]  
						[좋아요 개수 : ${comment.commentHeartCount}]
						<form>
							
							<input type="hidden" name="feedNo" value="${feed.feedNo}">
							<input type="hidden" name="parent" value="${comment.feedCommentNo}">
							<input type="hidden" name="sequence" value="${feed.commentCount}">
							<input type="hidden" name="depth" value="${comment.depth}">
							
							<button type="button" class="btn btn_addCommentHeart">댓글 좋아요</button>
							<button type="button" class="btn btn_deleteCommentHeart">댓글 좋아요 취소</button>
							
						</form>
						<br/><hr>
			</c:forEach>
		</div>
	
</body>
</html>