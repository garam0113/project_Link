<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/style.css" media="screen">
	<link rel="stylesheet" href="/resources/css/mapStyle.css"> 
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/mapScript.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript">

	
	
		$(function(){
			
			// 대댓글 버튼 클릭 -> 대댓글 작성 공간 생성
			
			$(".btn_createRecomment").bind("click", function(){
				
				var view = $(this).parents(".single-comment").find(".btn_recommentCheck");

				if ($(view).css('display') == 'none') {
					
					$(view).show();
					
				} else {
					
					$(view).hide();
					
				}
				
				$(".btn_addRecomment").bind("click", function(event){
					event.stopPropagation();

					console.log($(this).parents().siblings(".commentInfo").find("input[name='feedNo']").val())
					console.log($(this).parents().siblings(".commentInfo").find("input[name='feedCommentNo']").val())
					console.log($(this).parents().siblings(".commentInfo").find("input[name='depth']").val())
					console.log($(this).parents().siblings(".commentInfo").find("input[name='sequence']").val())
					console.log($(this).prev().val())
					
					var feedNumber = parseInt($(this).parents().siblings(".commentInfo").find("input[name='feedNo']").val())
					var parentValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='feedCommentNo']").val())
					var depthValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='depth']").val()) + 1;
					var sequenceValue = parseInt($(this).parents().siblings(".commentInfo").find("input[name='sequence']").val()) + 1;
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
									
								} // success end
								
							} // $.ajax inner close
							
					) // $.ajax close
				
				}); // event close
				
			}); // btn_createRecomment event close
			
			
			
			
			
			
			
			
			
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
	
	<style>
	
		.row {
		
			margin-top:0%;
			margin-right:0%;
			margin-bottom:0%;
			margin-left:0%;
		}
		
		
	</style>

</head>

<body class="single single-post">

	<jsp:include page="/toolbar.jsp" />
	
	<div id="intro-wrap" data-height="22.222">
		<div id="intro" class="preload darken">					
			<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
				<div class="caption">
					<h2>The City of Dreams</h2>
					<p>If you’re any good at all, you know you can be better.</p>
				</div><!-- caption -->					
			</div>								
		</div><!-- intro -->
	</div><!-- intro-wrap -->
	
	<div id="main">
		<section class="row section">
			<div class="row-content buffer even clear-after">
			
				<div id="post-nav">
					<ul class="clear-after reset plain">
						<li id="prev-items" class="post-nav"><a href="#"><i class="fa fa-chevron-left"></i><span class="label">Prev</span></a></li> 
						<li id="all-items" class="post-nav"><a href="#"><i class="icon icon-images"></i></a></li> 							 
					</ul>
				</div>
				
				<div class="column three">
					<a href="/feed/getFestivalLocation.jsp">길찾기</a>
				</div>
				
				<div class="column six">
				
				
					<!-- 피드 내용 -->
					<div class="post-area clear-after">
					
						<article role="main">
							<h4>이미지 ${feed.user.profileImage}&nbsp;${feed.user.nickName}</h4>
							<h5 class="meta-post">
								<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
								<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
							</h5>
							<p>${feed.content}</p>
							
							<iframe width="560" height="315" src="https://www.youtube.com/embed/-BrDlrytgm8" frameborder="0" allowfullscreen></iframe>
							
							<iframe src="http://player.vimeo.com/video/71319358" width="500" height="281" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
							
						</article>

					</div>
					<!-- 피드 내용 -->
					
					<!-- 피드 해시태그 -->
					<c:if test="${!empty feed.hashtag}"><br />${feed.hashtag}</c:if>
					<!-- 피드 해시태그 -->
					
					<!-- 피드 좋아요 댓글수 신고 -->
					<section class="row section">
						<div class="row">
							<c:if test="${feed.checkHeart == 0}">
								<div class="column two like" style="display: show;">
									좋아요
								</div>
								<div class="column two dislike" style="display: none;">
									시러요
								</div>
							</c:if>
							<c:if test="${feed.checkHeart != 0}">
								<div class="column two like" style="display: none;">
									좋아요
								</div>
								<div class="column two dislike" style="display: show;">
									시러요 
								</div>
							</c:if>
							
							<div class="column two likeCount">
								${feed.heartCount}
							</div>
							
							<div class="column two comment">댓글수</div>
							
							<div class="column two commentCount">
								 ${feed.commentCount}
							</div>
								
							<div class="column four last">신고</div>
						</div>
					</section>
					<!-- 피드 좋아요 댓글수 신고 -->
					
					<c:if test="${sessionScope.user.userId eq feed.user.userId}">
						<button type="button" id="update" >수정</button>
					</c:if>
					
					<form style="margin-top:50px;">
						<!-- 댓글 관련 hidden -->
						<input type="hidden" name="source" value="0">
						<input type="hidden" name="userId" value="${sessionScope.user.userId}">
						<input type="hidden" name="feedNo" value="${feed.feedNo}">
						
						<input type="hidden" name="parent" value="0">
						<input type="hidden" name="depth" value="0">
						<input type="hidden" name="sequence" value="${feed.commentCount}">
						<textarea style="width:476px; height:80px; resize:none;" name="commentContent" placeholder="댓글작성"></textarea>
						<input class="plain button red" style="float:right;" type="submit" value="Submit Comment">
						<!-- 댓글 관련 hidden -->
					</form>
					
					<div class="comment-section">
						<ul class="comment-list plain">
							<li class="comment">
							
								<c:set var="i" value="0"></c:set>
								<c:forEach var="comment" items="${commentList}">
								<c:set var="i" value="${i + 1}"></c:set>
										
								<div class="single-comment" style="margin-left:<c:out value='${25 * comment.depth}'/>px;">
								
									<div class="comment-author">
										
											<img src="http://placehold.it/60x60" class="avatar" alt="">
											<cite><a href="#">${comment.user.nickName}</a></cite>
											<span class="says">says:</span>
										
									</div><!-- comment-author -->
									
									
									
									<div class="comment-meta">
										<time datetime="${comment.commentRegDate}">${comment.commentRegDate}</time> / <c:if test="${comment.depth lt 3}"><a class="btn_createRecomment">Reply</a></c:if>
										<c:if test="${sessionScope.user.userId eq comment.user.userId}"> / <a>수정버튼</a> / <a>삭제버튼</a></c:if>
									</div><!-- comment-meta -->
									
									<p class="commentContent">${comment.commentContent}</p>
									
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
								
									<div class='btn_recommentCheck' style="display: none;">
										<textarea style='width:351px; resize:none;' name='commentContent' placeholder='작성'></textarea>
										<input class="plain button red btn_addRecomment" style="float:right;" type="submit" value="Submit Comment">
									</div>
								
								</div><!-- single-comment -->
								
								</c:forEach>
							</li>
						</ul>
					</div><!-- comment-section -->
					
					
				</div>
				
				<div class="column three"></div>
				
			</div>
		</section>
		
	</div>
	
	
</body>
</html>