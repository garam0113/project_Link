<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="description" content="The Page Description">
	<style type="text/css">@-ms-viewport{width: device-width;}</style>
	<title>Feed</title>
	<link rel="stylesheet" href="/resources/css/layers.min.css" media="screen">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" media="screen"> 
	<link rel="stylesheet" href="/resources/css/style.css" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
	
	<link rel="apple-touch-icon" href="/resources/image/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/image/apple-touch-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/image/apple-touch-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/resources/image/apple-touch-icon-152x152.png">		
		
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	
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
							
							swal.fire("엥?");
							
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
			
			alert("클릭한 글 번호 : " + $(this).parent().find("input[name='feedNo']").val());
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
	<header role="banner" class="transparent light">
		<div class="row">
			<div class="nav-inner row-content buffer-left buffer-right even clear-after">
				<div id="brand">
					<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="../main.jsp">Beetle</a></h1>
				</div><!-- brand -->
				<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
				<nav>
					<ul class="reset" role="navigation">
						<li class="menu-item">
							<a href="../main.jsp">Home</a>
						</li>
						<li class="menu-item">
							<a href="/feed/getFeedList">Feed</a>
						</li>
						<li class="menu-item">
							<a href="/">Live</a>
						</li>
						<li class="menu-item"><a href="/club/getClubList">Club</a></li>
						<li class="menu-item">
							<a href="/myHome/getMyHome?userId=${user.userId}">MyHome</a>
						</li>
						<li class="menu-item"><a href="/serviceCenter/serviceCenterHome.jsp">ServiceCenter</a></li>
						<li class="menu-item"><a href="/user/login">Login</a></li>
						<li class="menu-item"><a href="/user/addUser">Join</a></li>
						<li class="menu-item"><a href="/user/logout?userId=${user.userId}">로그아웃</a></li>
						<li class="menu-item"><a href="/user/getUser?userId=${user.userId}">내정보보기</a></li>
					</ul>
				</nav>
			</div><!-- row-content -->	
		</div><!-- row -->	
	</header>
	
	<form>
	로그인 정보 : ${sessionScope.user}
	
	<br/><br/>
	<c:if test="${!empty sessionScope.user}">
	
		<input type="text" name="content" value="today">
		<input type="button" value="submit">
	
	</c:if>
	
	<button type="button" class="btn_jsonTest">데이터 테스트</button>
	<p id="test">123</p>
		
	</form>
	
	<br/><br/>
	
		<c:set var="i" value="0"></c:set>
		<c:forEach var="feed" items="${feedList}">
			<c:set var="i" value="${i + 1}"></c:set>
			
			<c:if test="${fn:trim(feed.deleteCondition) eq '0'}">
			
			<form>
			
				${feed.feedNo}번째글 [작성자 : ${feed.user.userId}]
				<br/>
				<br/>	내용 :  ${feed.content}
				<br/>
				
				<br/>	해시태그 : ${feed.hashtag}
				<br/>
						좋아요 : ${feed.heartCount}
						댓글 수 : ${feed.commentCount}
						
						<c:if test="${feed.checkHeart != 0}">
							★★★내가 좋아요 한 피드입니다.★★★
						</c:if>
						
				<input type="button" name="delete" value="delete">
				<input type="button" class="btn_getFeed" value="보기">
				<input type="hidden" name="feedNo" value="${feed.feedNo}">
			
				<hr/>
			
			<br/><br/>
			
			</form>
			
			</c:if>
		
		</c:forEach>
		
</body>
</html>
