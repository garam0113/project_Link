<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	
	<title>Feed</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<%-- SUMMER NOTE --%>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	<%-- SUMMER NOTE --%>
	
	<script type="text/javascript">
	
	$(function(){
		
		<%-- SUMMER NOTE WEB LOADING --%>
		$('#summernote').summernote({
			toolbar: [
                // [groupName, [list of button]]
                ['Font Style', ['fontname']],
                ['style', ['bold', 'italic', 'underline']],
                ['font', ['strikethrough']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['height', ['height']],
                ['Insert', ['picture']],
                ['Insert', ['link']],
                ['Misc', ['fullscreen']]
            ],
            
			height: 300,                 	// 에디터 높이
			minHeight: null,             	// 최소 높이
			maxHeight: null,             	// 최대 높이
			focus: true,                 	// 에디터 로딩후 포커스를 맞출지 여부
			placeholder: '오늘 하루는 어떤가요?'
		});
		
		<%-- SUMMER NOTE WEB LOADING --%>
		
		<%-- GET_FEED --%>
		$(document).on("click", ".feedForm", function(event) {
			event.stopPropagation();
			var feedNumber = $(this).children("input[name='feedNo']").val();
			location.href="/feed/getFeed?feedNo=" + feedNumber;
		})
		<%-- GET_FEED --%>
		
		<%-- ADD_FEED --%>
		$(document).on("click", ".addFeed", function(event){
			event.stopPropagation();
			alert("피드 추가버튼");
			$(this.form).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
		});
		<%-- ADD_FEED --%>
		
		<%-- UPDATE_FEED --%>
		$(document).on("click", ".btn_update", function(event){
			event.stopPropagation();
			console.log("피드 수정 버튼");
			console.log($(this).parent().parents(".feedForm").html())
			
			$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/updateFeed").submit();
		});
		<%-- UPDATE_FEED --%>
		
		<%-- DELETE_FEED --%>
		$(document).on("click", ".btn_delete", function(event){
			event.stopPropagation();
			console.log("피드 삭제 버튼");
			console.log($(this).html())
			
			$(this).parent().parents(".feedForm").attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
		});
		<%-- DELETE_FEED --%>
		
		<%-- ADD_FEED_HEART --%>
		$(document).on("click", ".feedLike", function(event){
			event.stopPropagation();
			alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			
			$.ajax(
					{
						url : "/feedRest/json/addFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : $(this).parents(".feedForm").children("input[name='feedNo']").val(),
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("피드 좋아요 성공 : " + data);

							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" width="30" height="30" style="margin-top : 0px;" />');
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- ADD_FEED_HEART --%>
		
		<%-- DELETE_FEED_HEART --%>
		$(document).on("click", ".feedDislike", function(event){
			event.stopPropagation();
			alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 시러요");
			
			var html = $(this);
			var sessionUser = $(this).parents(".feedForm").children("input[name='userId']").val();
			
			$.ajax(
					{
						url : "/feedRest/json/deleteFeedHeart",
						method : "POST",
						data : JSON.stringify ({
							source : 0,
							sourceNo : $(this).parents(".feedForm").children("input[name='feedNo']").val(),
							userId : sessionUser
						}),
						contentType: 'application/json',
						dataType : "json",
						header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						}, // header end
						
						success : function(data, status) {
							
							swal.fire("피드 시러요 성공 : " + data);
							
							$(html).parents(".row").children(".likeCount").text(data);
							$(html).parent().html('<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" width="30" height="30" style="margin-top : 0px;" />');
							
						} // success close
						
					} // ajax inner close
					
			) // ajax close
		})
		<%-- DELETE_FEED_HEART --%>
		
	})
	
	
	
	</script>

<!------------------------------ CSS ------------------------------>

<style type="text/css">
	
	h4 {
			margin-top:5px;
			margin-left:5px;
			display: inline-block;
	}
		
	@
	-ms-viewport {
		width: device-width;
	}
	
	.row {
		margin-left: 0px;
	}
	
	.feedForm {
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.showFeedForm {
		border-style:dotted;
	}
	
</style>

<!------------------------------ CSS ------------------------------>


	
</head>

<body class="single single-post">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
	
		<div id="intro-wrap" data-height="10">
		</div><!-- intro-wrap -->
		
		<div id="main">
		
			<section class="row section">
			
				<div class="row-content buffer even clear-after">
					<div class="column three">
						<a href="/feed/getFestivalLocation.jsp">길찾기</a>
					</div>
					
					<div class="column six">
						<div class="post-area clear-after addFeedForm">
							<form id="addForm">
							
								<article role="main">
									<img src="/resources/image/uploadFiles/${sessionScope.user.profileImage}" style="vertical-align: sub; display: inline-block; width:50px; height:50px;" /><h4 style="vertical-align: text-bottom;">${sessionScope.user.nickName}</h4>
									<input class="plain button red addFeed" style="display: inline-block; width:150px; float:right; margin-top:10px" value="Submit">
									
									<textarea id="summernote" name="content"></textarea>
								</article>
		
							</form>
						</div>


						<c:set var="i" value="0"></c:set>
						<c:forEach var="feed" items="${feedList}">
							<c:set var="i" value="${i + 1}"></c:set>

							<c:if test="${fn:trim(feed.deleteCondition) eq '0' and fn:trim(feed.reportCondition) eq '0'}">

								<div class="showFeedForm">
									<form class="feedForm">

										<img src="/resources/image/uploadFiles/${feed.user.profileImage}" style="vertical-align: sub; display: inline-block; width:50px; height:50px;" /><h4 style="vertical-align: text-bottom;">${feed.user.nickName}</h4>
										
										<h5 class="meta-post" style="display: inline-block; vertical-align: text-bottom;">
											<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
											<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
										</h5>
										
										<c:if test="${sessionScope.user.userId eq feed.user.userId}">
											
											<div style="display: inline-block; float: right;">
												<%-- 수정 버튼 --%>
												<span class="glyphicon glyphicon-paperclip btn_update" aria-hidden="true"></span>
												<%-- 수정 버튼 --%>
											
												<%-- 삭제 버튼 --%>
												<span class="glyphicon glyphicon-trash btn_delete" aria-hidden="true"></span>
												<%-- 삭제 버튼 --%>
											</div>
										</c:if>
											
										<p>${feed.content}</p>
										
										<c:if test="${!empty feed.hashtag}"><br />${feed.hashtag}</c:if>
										
										<br />

										<input type="hidden" name="feedNo" value="${feed.feedNo}">
										<input type="hidden" name="userId" value="${sessionScope.user.userId}">

										<!-- 피드 좋아요 댓글수 신고 -->
										<section class="row section">
											<div class="row">
												<c:if test="${feed.checkHeart eq 0}">
													<div class="column two">
														<img class="feedLike" src="/resources/image/uploadFiles/no_heart.jpg" width="30" height="30" style="margin-top : 0px;" />
													</div>
												</c:if>
												<c:if test="${feed.checkHeart ne 0}">
													<div class="column two">
														<img class="feedDislike" src="/resources/image/uploadFiles/heart.jpg" width="30" height="30" style="margin-top : 0px;" />
													</div>
												</c:if>
												
												<div class="column two likeCount">
													${feed.heartCount}
												</div>
												
												<div class="column two comment">댓글수</div>
												
												<div class="column two commentCount">
													 ${feed.commentCount}
												</div>
													
												<!-- 신고 아이콘 -->
												<div class="column four last">
													<span class="glyphicon glyphicon-exclamation-sign" style="font-size:1.7rem; margin-top:3px;" aria-hidden="true" ></span>
												</div>
												<!-- 신고 아이콘 -->
												
											</div>
										</section>
										<!-- 피드 좋아요 댓글수 신고 -->

									</form>

								</div>

							</c:if>
						</c:forEach>


					</div>

					<div class="column three"></div>

				</div>

			</section>

		</div>

	</main>

</body>
</html>
