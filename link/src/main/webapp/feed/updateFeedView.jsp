<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<script src="https://code.jquery.com/jquery.js"></script>
	
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
	            
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		          
			});
			
			$('#summernote').summernote('insertText', '${feed.content}');
			<%-- SUMMER NOTE WEB LOADING --%>
			
			
			
			$(".btn_update").bind("click", function() {
				alert("수정하기");
				$("form").attr("method", "POST").attr("action", "/feed/updateFeed").submit();
			})
		
		})
	
	</script>

	<style>
		
		h4 {
			margin-top:5px;
			margin-left:5px;
			display: inline-block;
		}
		
	</style>

</head>

<body class="single single-post">

	<jsp:include page="/toolbar.jsp" />			


	<div id="intro-wrap" data-height="22.222">
		<div id="intro" class="preload darken">					
			<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
				<div class="caption">
					<h2>Feed</h2>
					<p>If you’re any good at all, you know you can be better.</p>
				</div><!-- caption -->					
			</div>								
		</div><!-- intro -->
	</div><!-- intro-wrap -->
	
	<div id="main">
		<section class="row section">
			<div class="row-content buffer even clear-after">
			
				<div class="column three">
					<a href="/feed/getFestivalLocation.jsp">길찾기</a>
				</div>
				
				<div class="column six">
				
				
					<!-- 피드 내용 -->
					<div class="post-area clear-after">
					
						<article role="main">
							<img src="/resources/image/uploadFiles/${feed.user.profileImage}" style="vertical-align: sub; display: inline-block; width:50px; height:50px;" /><h4 style="vertical-align: text-bottom;">${feed.user.nickName}</h4>
							
							<h5 class="meta-post">
								<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
								<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
							</h5>
							
							<textarea id="summernote" name="content"></textarea>
							<input class="plain button red btn_update" style="width:150px; float:right; margin-top:10px" value="Submit">
						</article>

					</div>
					
					<form id="feedInfo" style="margin-top:50px;">
						<!-- 댓글 관련 hidden -->
						<input type="hidden" name="source" value="0">
						<input type="hidden" name="userId" value="${sessionScope.user.userId}">
						<input type="hidden" name="feedNo" value="${feed.feedNo}">
						
						<!-- 댓글 관련 hidden -->
					</form>
					
				</div>
				
				<div class="column three"></div>
				
			</div>
		</section>
		
	</div>
	
</body>
</html>
	