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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript">

		
	
		$(function(){
			
			// 댓글 삭제
			$(".deleteComment").bind("click", function() {
				alert("삭제 요청 // 이 피드 번호 : " + ${feed.feedNo} + "댓글 번호 : " + $(this).parent().next().find("input[name='feedCommentNo']").val());
				
				$("form").attr("method", "POST").attr("action", "/feed/deleteFeedComment").submit();
			})
			
			// 댓글 수정 화면 띄우기 
			
			$(".updateCommentView").bind("click", function() {

				alert("수정화면 요청 // 이 피드 번호 : " + ${feed.feedNo} + "댓글 번호 : " + $(this).parent().next().find("input[name='feedCommentNo']").val());
				alert("여기 html를 수정하자 : " + $(this).parent().html());
				
				var beforeComment = $(this).parent().html();
				
				var changePoint = $(this).parent();
				var commentNo = $(this).parent().next().find("input[name='feedCommentNo']").val();
				
				$.ajax (
						
						{
							url : "/feedRest/json/getFeedComment",
							method : "POST",
							data : JSON.stringify ({
								feedNo : ${feed.feedNo},
								feedCommentNo : commentNo
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								swal.fire("수정 화면 요청 성공 : " + data.commentContent + "\n" + changePoint);
								
								var changeHtml = "<input type='text' name='commentContent' value='" + data.commentContent + "'>" +
													"<button type='button' class='updateFeedComment'>댓글 수정</button>";
													
								alert("바꿀 내용 : " + changeHtml);
								$(changePoint).html(changeHtml);
								
								// 댓글 수정 클릭시 이벤트 걸기
								
								
								$(".updateFeedComment").bind("click", function(){
									
									alert("바꾸고 싶은 내용은 " + $(this).prev().val());
									swal.fire("수정되었습니다.");
									
									var wantComment = $(this).prev().val();
									
									$.ajax(
												{
													url : "/feedRest/json/updateFeedComment",
													method : "POST",
													data : JSON.stringify ({
														feedNo : ${feed.feedNo},
														feedCommentNo : commentNo,
														commentContent : wantComment
													}),
													contentType: 'application/json',
													dataType : "json",
													header : {
														"Accept" : "application/json",
														"Content-Type" : "application/json"
													}, // header end
													
													success : function(data, status) {
														swal.fire("성공");
													}
													
												}
									) // ajax close;
									
									// $(changePoint).html(beforeComment);
									
								}) // event close
								
								
								
							} // success close
						}
						
				) // ajax close
			})
		
			// 댓글 리스트 ajax 테스트
			
			$("#test").bind("click", function(){
				
				$.ajax(
						{
							url : "/feedRest/json/getFeedCommentList",
							method : "POST",
							data : JSON.stringify ({
								feedNo : ${feed.feedNo}
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								swal.fire("dz?");
							} // success close
							
						} // ajax inner close
						
				) // ajax close
			
			}) // #test event close
			
			
			
			
			
			$(".addCommentHeart").bind("click", function(){
				alert($(this).parent().next().find("input[name='feedCommentNo']").val() + "번 댓글 -> 조아요");
				
				$.ajax(
						{
							url : "/feedRest/json/addFeedCommentHeart",
							method : "POST",
							data : JSON.stringify ({
								feedCommentNo : $(this).parent().next().find("input[name='feedCommentNo']").val()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								alert("조아요");
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .addCommentHeart event close
			
			
			
			$(".deleteCommentHeart").bind("click", function() {
				alert($(this).parent().next().find("input[name='feedCommentNo']").val() + "번 댓글 -> 시러요");
				
				$.ajax(
						{
							url : "/feedRest/json/deleteCommentHeart",
							method : "POST",
							data : JSON.stringify ({
								feedCommentNo : $(this).parent().next().find("input[name='feedCommentNo']").val()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								
								alert("시러요");
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .deleteCommentHeart event close
			
			
			
			
			
			/* 
			대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기
			대댓글 달기
			대댓글 달기
			
			
			
			alert("댓글달기");	
			
			
			
			
			$.ajax(
					{
						url : "/feedRest/json/",
						method : "POST",
						data : JSON.stringify ({
							
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
			
			
			대댓글 달기
			대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기
			
			
			
			
			
			
			
			<input type='hidden' name='source' value='1'>
			<input type='hidden' name='userId' value='${sessionScope.user.userId}'>
			<input type='hidden' name='feedNo' value='${feed.feedNo}'>
			
			
			
			 */
			 
			$(".btn_createRecomment").bind("click", function(){

				alert("1 : " + $(this).html());
				
				alert("2 : " + $(this).next().html());
				
				$("<div class='btn_recommentCheck'>"
					+ "대댓글작성<input type='text' name='commentContent' value=''>"
					+ "<button class='btn_addRecomment' type='button'>작성</button>"
				+ "</div>").appendTo($(this));
				
				$(".btn_recommentCheck").bind("click", function(e){
					e.stopPropagation();
					
				})
				
				
				$(".btn_addRecomment").bind("click", function(){
					event.stopPropagation();
					
					alert("test");
					
					alert($(this).parent().parent().parent().prev().find("input[name='feedCommentNo']").val())
					alert($(this).parent().parent().parent().prev().find("input[name='depth']").val())
					alert($(this).parent().parent().parent().prev().find("input[name='sequence']").val())
					alert($(this).prev().val())
					
					var feedNumber = $(this).parent().parent().parent().prev().find("input[name='feedNo']").val();
					var parentValue = parseInt($(this).parent().parent().parent().prev().find("input[name='feedCommentNo']").val());
					var depthValue = parseInt($(this).parent().parent().parent().prev().find("input[name='depth']").val()) + 1;
					var sequenceValue = parseInt($(this).parent().parent().parent().prev().find("input[name='sequence']").val()) + 1;
					var content = $(this).prev().val();
					
					$.ajax(
							{
								url : "/feedRest/json/addFeedComment",
								method : "POST",
								data : JSON.stringify ({
									feedNo : feedNumber,
									commentContent :content,
									parent : parentValue,
									depth : depthValue,
									sequence : sequenceValue
								}),
								contentType: 'application/json',
								dataType : "json",
								header : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								}, // header end
								
								success : function(data, status) {
									$("input[name='sequence']").val($("input[name='sequence']").val() + 1);
									$(".commentList").last().append("hi<br/>");
								} // success end
								
							} // $.ajax inner close
							
					) // $.ajax close
				
				}); // event close
				
			}); // event close
			
			
			 
			
			 
			 
			 
			 
			 
			 /* 
				대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기
				대댓글 달기
				대댓글 달기
				대댓글 달기
				대댓글 달기
				대댓글 달기
				대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기대댓글 달기
				 */
				 
				 
				 
				 
			
			$(".btn_addComment").bind("click", function(){
				alert("!!!!");
				$.ajax(
						{
							url : "/feedRest/json/addFeedComment",
							method : "POST",
							data : JSON.stringify ({
								feedNo : $("input[name='feedNo']").val(),
								commentContent : $("input[name='commentContent']").val(),
								parent : $("input[name='parent']").val(),
								depth : $("input[name='depth']").val(),
								sequence : $("input[name='sequence']").val()
							}),
							contentType: 'application/json',
							dataType : "json",
							header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}, // header end
							
							success : function(data, status) {
								$("input[name='sequence']").val($("input[name='sequence']").val() + 1);
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
								$("#check").text("내가 좋아요 했는지 진짜 체크 " + data);
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
		
			$("#update").bind("click", function() {
				alert("update");
				$("form").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
			})
		
		
		})
	
	</script>

</head>
<body>

	작성자 : ${feed.user.userId}
	<br/>
	세션 아이디 : ${sessionScope.user.userId}
	<br/><br/>
	
	content : ${feed.content}
	
	좋아요 개수 : ${feed.heartCount}
	
	
	
	<span id="check"> 내가 좋아요 했는지 체크 ${feed.checkHeart}</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${sessionScope.user.userId eq feed.user.userId}">
		<button type="button" id="update" >수정</button>
	</c:if>
	
	<br/>
	
	<c:if test="${feed.checkHeart == 0}">
		<button type="button" id="heart">좋아요</button>
	</c:if>
	
	<c:if test="${feed.checkHeart != 0}">
		<button type="button" id="deleteheart">좋아요취소요</button>
	</c:if>
	
	
	<br/> 해시태그 : 
	<br/>${feed.hashtag}
	
	<button type="button" id="test">데이터 테스트</button>
	
	<hr/><hr/>
	
	<br/>
		
	<form>
				<input type="hidden" name="source" value="0">
				<input type="hidden" name="userId" value="${sessionScope.user.userId}">
				<input type="hidden" name="feedNo" value="${feed.feedNo}">
				
				<span>댓글 개수 : ${feed.commentCount}</span>
				
				<!-- 댓글 관련 hidden -->
				
				<input type="hidden" name="parent" value="0">
				<input type="hidden" name="depth" value="0">
				<input type="hidden" name="sequence" value="${feed.commentCount}">
				
				
				
	댓글달기 :		<input type="text" name="commentContent" value="">
				<input type="button" class="btn_addComment" value="submit">
				
				<!-- 댓글 관련 hidden -->
	<hr/>
	
	</form>
		
		<div class="commentList">
			<c:set var="i" value="0"></c:set>
			<c:forEach var="comment" items="${commentList}">
				<c:set var="i" value="${i + 1}"></c:set>
						<div style = "border: 1px solid gray; width:1200px; padding:5px;
								margin-top:5px; margin-left:<c:out value='${50 * comment.depth}'/>px; display:inline-block">

						작성자 :: ${comment.user.userId} :: [댓글번호 ${comment.feedCommentNo}] [내용 ${comment.commentContent}] [깊이 ${comment.depth}]  
						[좋아요 개수 : ${comment.commentHeartCount}]
							<c:if test="${sessionScope.user.userId == comment.user.userId}">
								<button type="button" class="updateCommentView">댓글 수정하기</button>
								<button type="button" class="deleteComment">댓글 삭제하기</button>
							</c:if>
						
							<c:if test="${comment.heartCondition == 0}">
								<button type="button" class="addCommentHeart">댓글 조아요</button>
							</c:if>
							
							<c:if test="${comment.heartCondition != 0}">
								★★★ 내가 좋아요한 댓글 ★★★
								<button type="button" class="deleteCommentHeart">댓글 시러요</button>
							</c:if>
						
						</div>
						<!-- 대댓글 관련 hidden -->
						<!-- 대댓글 관련 hidden -->

						<div class="commentInfo">
							<input type='hidden' name='source' value='1'>
							<input type='hidden' name='userId' value='${sessionScope.user.userId}'>
							<input type='hidden' name='feedNo' value='${feed.feedNo}'>
							
							<input type='hidden' name='feedCommentNo' value='${comment.feedCommentNo}'>
							
							<input type="hidden" name="parent" value="${comment.parent}">
							<input type="hidden" name="depth" value="${comment.depth}">
							<input type="hidden" name="sequence" value="${comment.sequence}">
						</div>
				
						<!-- 대댓글 관련 hidden -->
						<!-- 대댓글 관련 hidden -->
						
						<div>
						
							<span class="btn_createRecomment">답글달기</span>
							
						</div>
						
						<br/><hr>
			</c:forEach>
		</div>
	
</body>
</html>