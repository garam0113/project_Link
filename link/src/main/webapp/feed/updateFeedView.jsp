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
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script type="text/javascript">
	
		$(function(){
			
			$(".btn_update").bind("click", function() {
				alert("수정하기");
				$("form").attr("method", "POST").attr("action", "/feed/updateFeed").submit();
			})
		
		})
	
	</script>

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
							<img src="/resources/image/uploadFiles/${feed.user.profileImage}" width="50" height="50" /><h4>${feed.user.nickName}</h4>
							
							<h5 class="meta-post">
								<c:if test="${!empty feed.updateDate}">${feed.updateDate}</c:if>
								<c:if test="${empty feed.updateDate}">${feed.regDate}</c:if>
							</h5>
							
							<textarea name="content" style="width: 500px;" placeholder="${feed.content}"></textarea>
							<!-- 
							
							<iframe width="560" height="315" src="https://www.youtube.com/embed/-BrDlrytgm8" frameborder="0" allowfullscreen></iframe>							
							<iframe src="http://player.vimeo.com/video/71319358" width="500" height="281" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
							
							 -->
							
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
	