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
			
			// ��� ����
			$(".deleteComment").bind("click", function() {
				alert("���� ��û // �� �ǵ� ��ȣ : " + ${feed.feedNo} + "��� ��ȣ : " + $(this).parent().next().find("input[name='feedCommentNo']").val());
				
				$("form").attr("method", "POST").attr("action", "/feed/deleteFeedComment").submit();
			})
			
			// ��� ���� ȭ�� ���� 
			
			$(".updateCommentView").bind("click", function() {

				alert("����ȭ�� ��û // �� �ǵ� ��ȣ : " + ${feed.feedNo} + "��� ��ȣ : " + $(this).parent().next().find("input[name='feedCommentNo']").val());
				alert("���� html�� �������� : " + $(this).parent().html());
				
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
								
								swal.fire("���� ȭ�� ��û ���� : " + data.commentContent + "\n" + changePoint);
								
								var changeHtml = "<input type='text' name='commentContent' value='" + data.commentContent + "'>" +
													"<button type='button' class='updateFeedComment'>��� ����</button>";
													
								alert("�ٲ� ���� : " + changeHtml);
								$(changePoint).html(changeHtml);
								
								// ��� ���� Ŭ���� �̺�Ʈ �ɱ�
								
								
								$(".updateFeedComment").bind("click", function(){
									
									alert("�ٲٰ� ���� ������ " + $(this).prev().val());
									swal.fire("�����Ǿ����ϴ�.");
									
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
														swal.fire("����");
													}
													
												}
									) // ajax close;
									
									// $(changePoint).html(beforeComment);
									
								}) // event close
								
								
								
							} // success close
						}
						
				) // ajax close
			})
		
			// ��� ����Ʈ ajax �׽�Ʈ
			
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
				alert($(this).parent().next().find("input[name='feedCommentNo']").val() + "�� ��� -> ���ƿ�");
				
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
								
								alert("���ƿ�");
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .addCommentHeart event close
			
			
			
			$(".deleteCommentHeart").bind("click", function() {
				alert($(this).parent().next().find("input[name='feedCommentNo']").val() + "�� ��� -> �÷���");
				
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
								
								alert("�÷���");
							} // success close
							
						} // ajax inner close
						
				) // ajax close
				
			}) // .deleteCommentHeart event close
			
			
			
			
			
			/* 
			���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ�
			���� �ޱ�
			���� �ޱ�
			
			
			
			alert("��۴ޱ�");	
			
			
			
			
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
			
			
			���� �ޱ�
			���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ�
			
			
			
			
			
			
			
			<input type='hidden' name='source' value='1'>
			<input type='hidden' name='userId' value='${sessionScope.user.userId}'>
			<input type='hidden' name='feedNo' value='${feed.feedNo}'>
			
			
			
			 */
			 
			$(".btn_createRecomment").bind("click", function(){

				alert("1 : " + $(this).html());
				
				alert("2 : " + $(this).next().html());
				
				$("<div class='btn_recommentCheck'>"
					+ "�����ۼ�<input type='text' name='commentContent' value=''>"
					+ "<button class='btn_addRecomment' type='button'>�ۼ�</button>"
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
				���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ�
				���� �ޱ�
				���� �ޱ�
				���� �ޱ�
				���� �ޱ�
				���� �ޱ�
				���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ���� �ޱ�
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
								$("#check").text("���� ���ƿ� �ߴ��� ��¥ üũ " + data);
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

	�ۼ��� : ${feed.user.userId}
	<br/>
	���� ���̵� : ${sessionScope.user.userId}
	<br/><br/>
	
	content : ${feed.content}
	
	���ƿ� ���� : ${feed.heartCount}
	
	
	
	<span id="check"> ���� ���ƿ� �ߴ��� üũ ${feed.checkHeart}</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${sessionScope.user.userId eq feed.user.userId}">
		<button type="button" id="update" >����</button>
	</c:if>
	
	<br/>
	
	<c:if test="${feed.checkHeart == 0}">
		<button type="button" id="heart">���ƿ�</button>
	</c:if>
	
	<c:if test="${feed.checkHeart != 0}">
		<button type="button" id="deleteheart">���ƿ���ҿ�</button>
	</c:if>
	
	
	<br/> �ؽ��±� : 
	<br/>${feed.hashtag}
	
	<button type="button" id="test">������ �׽�Ʈ</button>
	
	<hr/><hr/>
	
	<br/>
		
	<form>
				<input type="hidden" name="source" value="0">
				<input type="hidden" name="userId" value="${sessionScope.user.userId}">
				<input type="hidden" name="feedNo" value="${feed.feedNo}">
				
				<span>��� ���� : ${feed.commentCount}</span>
				
				<!-- ��� ���� hidden -->
				
				<input type="hidden" name="parent" value="0">
				<input type="hidden" name="depth" value="0">
				<input type="hidden" name="sequence" value="${feed.commentCount}">
				
				
				
	��۴ޱ� :		<input type="text" name="commentContent" value="">
				<input type="button" class="btn_addComment" value="submit">
				
				<!-- ��� ���� hidden -->
	<hr/>
	
	</form>
		
		<div class="commentList">
			<c:set var="i" value="0"></c:set>
			<c:forEach var="comment" items="${commentList}">
				<c:set var="i" value="${i + 1}"></c:set>
						<div style = "border: 1px solid gray; width:1200px; padding:5px;
								margin-top:5px; margin-left:<c:out value='${50 * comment.depth}'/>px; display:inline-block">

						�ۼ��� :: ${comment.user.userId} :: [��۹�ȣ ${comment.feedCommentNo}] [���� ${comment.commentContent}] [���� ${comment.depth}]  
						[���ƿ� ���� : ${comment.commentHeartCount}]
							<c:if test="${sessionScope.user.userId == comment.user.userId}">
								<button type="button" class="updateCommentView">��� �����ϱ�</button>
								<button type="button" class="deleteComment">��� �����ϱ�</button>
							</c:if>
						
							<c:if test="${comment.heartCondition == 0}">
								<button type="button" class="addCommentHeart">��� ���ƿ�</button>
							</c:if>
							
							<c:if test="${comment.heartCondition != 0}">
								�ڡڡ� ���� ���ƿ��� ��� �ڡڡ�
								<button type="button" class="deleteCommentHeart">��� �÷���</button>
							</c:if>
						
						</div>
						<!-- ���� ���� hidden -->
						<!-- ���� ���� hidden -->

						<div class="commentInfo">
							<input type='hidden' name='source' value='1'>
							<input type='hidden' name='userId' value='${sessionScope.user.userId}'>
							<input type='hidden' name='feedNo' value='${feed.feedNo}'>
							
							<input type='hidden' name='feedCommentNo' value='${comment.feedCommentNo}'>
							
							<input type="hidden" name="parent" value="${comment.parent}">
							<input type="hidden" name="depth" value="${comment.depth}">
							<input type="hidden" name="sequence" value="${comment.sequence}">
						</div>
				
						<!-- ���� ���� hidden -->
						<!-- ���� ���� hidden -->
						
						<div>
						
							<span class="btn_createRecomment">��۴ޱ�</span>
							
						</div>
						
						<br/><hr>
			</c:forEach>
		</div>
	
</body>
</html>