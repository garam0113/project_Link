<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript">
	
	$(function(){
		
		$(".btn_jsonTest").bind("click", function(){
			
			$.ajax(
					{
						url : "/feedRest/json/getFeedList",
						method : "POST",
						data : JSON.stringify ({
							currentPage : 1
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("��?");
							
							var value = "";
							
							$.each(data, function(index, item) {
								value += item.content + " // ";
							}); // $.each close
							
							$("#test").text(value);
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close

		}); // btn_jsonTest close
		
		
		$($("input[type='button']")[0]).bind("click", function(){
			alert("hi");
			$($("form")[0]).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
		});
		
		$("input[name='delete']").bind("click", function(){
			var feedNo = $(this).attr("id");
			alert(feedNo);
			$(this).prev().val(feedNo);
			alert($(this).prev().val());
			$(this.form).attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
		});
		
		$(".btn_getFeed").bind("click", function(){
			
			alert("Ŭ���� �� ��ȣ : " + $(this).parent().find("input[name='feedNo']").val());
			location.href="/feed/getFeed?feedNo=" + $(this).parent().find("input[name='feedNo']").val();
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
	�α��� ���� : ${sessionScope.user}
	
	<br/><br/>
	<c:if test="${!empty sessionScope.user}">
	
		<input type="text" name="content" value="today">
		<input type="button" value="submit">
	
	</c:if>
	
	<button type="button" class="btn_jsonTest">������ �׽�Ʈ</button>
	<p id="test">123</p>
		
	</form>
	
	<br/><br/>
	
		<c:set var="i" value="0"></c:set>
		<c:forEach var="feed" items="${feedList}">
			<c:set var="i" value="${i + 1}"></c:set>
			
			<c:if test="${fn:trim(feed.deleteCondition) eq '0'}">
			
			<form>
			
				${feed.feedNo}��°�� [�ۼ��� : ${feed.userId}]
				<br/>
				<br/>	���� :  ${feed.content}
				<br/>
				
				<br/>	�ؽ��±� : ${feed.hashtag}
				<br/>
						���ƿ� : ${feed.heartCount}
						��� �� : ${feed.commentCount}
						
						<c:if test="${feed.checkHeart != 0}">
							�ڡڡڳ��� ���ƿ� �� �ǵ��Դϴ�.�ڡڡ�
						</c:if>
						
				<input type="button" name="delete" value="delete">
				<input type="button" class="btn_getFeed" value="����">
				<input type="hidden" name="feedNo" value="${feed.feedNo}">
			
				<hr/>
			
			<br/><br/>
			
			</form>
			
			</c:if>
		
		</c:forEach>
		
</body>
</html>
