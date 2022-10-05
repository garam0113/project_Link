<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	<script type="text/javascript">
	
	$(function(){
		
		$($("input[type='button']")[0]).bind("click", function(){
			alert("hi");
			$("form").attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
		});
		
		$("input[name='delete']").bind("click", function(){
			var feedNo = $(this).attr("id");
			alert(feedNo);
			$(this).prev().val(feedNo);
			alert($(this).prev().val());
			$(this.form).attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
		});
		
		$(".btn_getFeed").bind("click", function(){
			alert($(this).prev().prev().prev().val());
			var feedNo = $(this).prev().prev().prev().val();
			
			location.href="/feed/getFeed?feedNo=" + feedNo;
		})
		
		// addComment
		
		$(".btn_addComment").bind("click", function(){
			alert("addComment");
			alert($("input[name='commentContent']").val());
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedComment",
						method : "POST",
						data : JSON.stringify ({
							commentContent : $("input[name='commentContent']").val()
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							alert("123");
						} // success end
						
					} // ajax inner close
					
			) // ajax clos
			
		});
		
	})
	
	</script>

</head>

<body>
	<h2>Hello World!</h2>
	
	<form>

		<input type="text" name="content" value="today">
		<input type="button" value="submit">
		
	</form>
	
	<br/><br/>
	
		<c:set var="i" value="0"></c:set>
		<c:forEach var="feedList" items="${feedList}">
			<c:set var="i" value="${i + 1}"></c:set>
			
			<c:if test="${fn:trim(feedList.deleteCondition) eq '0'}">
			
			<form>
			
				<input type="hidden" name="feedNo" value="${feedList.feedNo}">
			
				${feedList.feedNo} // ${feedList.content}
				
				<br/>	좋아요 : ${feedList.likeCount}
						댓글 수 : ${feedList.commentCount}
				
				<input type="button" id="${feedList.feedNo}" name="delete" value="delete">
				<input type="button" class="btn_getFeed" value="보기">
			
			<br/><br/>
			
			</form>
			
			</c:if>
		
		</c:forEach>
		
</body>
</html>
