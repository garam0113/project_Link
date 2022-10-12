<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="The Page Description">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script type="text/javascript">

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className) 
	$(".glyphicon glyphicon-user").on("click" , function() {
		
		self.location = "/myHome/updateProfile?userId=${user.userId}"
	});
	
	
 });


$(function(){


    $(".btn btn-success btn-sm").on("click" , function() {

          var userId = $(".btn btn-success btn-sm").html();
          //console.log(userId);
          alert("팔로우");
          $(document).ready(function(){
       		$.ajax({
       			type: 'GET',   //get방식으로 명시
       			url : '/myHomeRest/json/addFollow/'+userId,  //이동할 jsp 파일 주소
       			dataType:'json',   //문자형식으로 받기
       			success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
       	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
       				//alert(data); 
       			    console.log("userId : "+data);
       			},
       			error:function(data){   //데이터 주고받기가 실패했을 경우 실행할 결과
       				//alert('실패');
       			}
       		})
       	});
             
    });
});			

$(function(){
	
	<!-- REST CONTROLLTER TEST -->
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
	<!-- REST CONTROLLTER TEST -->
	
	<!-- ADD_FEED -->
	$(".addFeed").bind("click", function(){
		alert("피드 추가버튼");
		$(this.form).attr("method", "POST").attr("action", "/feed/addFeed").attr("enctype", "multipart/form-data").submit();
	});
	<!-- ADD_FEED -->
	
	<!-- UPDATE_FEED -->
	$(".btn_update").bind("click", function(){
		alert("피드 수정 버튼");
		$(this.form).attr("method", "GET").attr("action", "/feed/updateFeed").submit();
	});
	<!-- UPDATE_FEED -->
	
	<!-- DELETE_FEED -->
	$(".btn_delete").bind("click", function(){
		alert("피드 삭제 버튼");
		$(this.form).attr("method", "GET").attr("action", "/feed/deleteFeed").submit();
	});
	<!-- DELETE_FEED -->
	
	<!-- GET_FEED -->
	$(".btn_getFeed").bind("click", function(){
		alert("클릭한 글 번호 : " + $(this).parent().find("input[name='feedNo']").val());
		location.href="/feed/getFeed?feedNo=" + $(this).parents(".feedForm").find("input[name='feedNo']").val();
	})
	<!-- GET_FEED -->
	
	<!-- ADD_FEED_HEART -->
	$(".like:contains('좋아요')").bind("click", function(){
		event.stopPropagation();
		alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 좋아요");
		
		var html = $(this);
		
		$.ajax(
				{
					url : "/feedRest/json/addFeedHeart",
					method : "POST",
					data : JSON.stringify ({
						feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						swal.fire("피드 좋아요 성공 : " + data);
						
						$(html).parents(".row").children(".like:contains('좋아요')").hide();
						$(html).parents(".row").children(".dislike:contains('시러요')").show();
						$(html).parents(".row").children(".likeCount").text(data);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
	})
	<!-- ADD_FEED_HEART -->
	
	<!-- DELETE_FEED_HEART -->
	$(".dislike:contains('시러요')").bind("click", function(){
		event.stopPropagation();
		alert($(this).parents(".feedForm").children("input[name='feedNo']").val() + "번 글 시러요");
		
		var html = $(this);
		
		$.ajax(
				{
					url : "/feedRest/json/deleteFeedHeart",
					method : "POST",
					data : JSON.stringify ({
						feedNo : $(this).parents(".feedForm").children("input[name='feedNo']").val()
					}),
					contentType: 'application/json',
					dataType : "json",
					header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, // header end
					
					success : function(data, status) {
						
						swal.fire("피드 시러요 성공 : " + data);
						
						$(html).parents(".row").children(".like:contains('좋아요')").show();
						$(html).parents(".row").children(".dislike:contains('시러요')").hide();
						$(html).parents(".row").children(".likeCount").text(data);
						
					} // success close
					
				} // ajax inner close
				
		) // ajax close
	})
	<!-- DELETE_FEED_HEART -->
	
})
	




</script>

<style>
#calendar {
	margin-left: 100px;
	margin-top: 50px;
	width: 700px;
	display: inline-block;
	justify-content: center;
}

.container {
	float: left;
	margin-left: 300px;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
}

.profile-userpic img {
	float: left;
	margin: 0 auto;
	width: 50%;
	height: 40%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
	margin-right: 200px;
}

.profile-usertitle-name {
	color: #5b9bd1;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	float: left;
	text-align: center;
	margin-top: 10px;
	margin-left: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #5b9bd1;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	min-height: 460px;
}

.follow-section {
	margin-left: 200px;
	margin-top: 50px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	
}

.single-comment {
	padding-left: 0;
}

.f {
	margin-left: 300px;
}

.comment-section {
	margin-left: 150px;
	margin-top: 50px;
	width: 900px;
	display: inline-block;
	justify-content: center;
    
}
</style>
</head>


<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>MyBlog</h2>
							<p>Write down your daily life</p>
						</div>
						<!-- caption -->
					</div>
					<!-- intro -->
				</div>
				<!-- intro -->
			</div>
			<!-- intro-wrap -->

			<div id="main" class="row">
				<div id="calendar">

					<jsp:include page="/myHome/calendar.jsp" />
				</div>

				<div class="container">
					<div class="row profile">
						<div class="col-md-3">
							<div class="profile-sidebar">
								<!-- SIDEBAR USERPIC -->
								<div class="profile-userpic">
									<img
										src="https://m.citybreeze.co.kr/file_data/ctbreeze/2022/04/19/ac007ff0b38eec2ee299876fbc2cbca8.jpg"
										class="img-responsive" alt="">
								</div>
								<br> <br>
								<!-- END SIDEBAR USERPIC -->
								<!-- SIDEBAR USER TITLE -->
								<div class="profile-usertitle">
									<div class="profile-usertitle-name">${user.nickName }</div>
									<div class="profile-usertitle-job">${user.profileWriting }
									</div>
								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
									<c:if test="${ empty user }">
										<button type="button" class="btn btn-success btn-sm">Follow</button>
										<button type="button" class="btn btn-danger btn-sm">Message</button>
									</c:if>

									<br> <br>

								</div>
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active"><a href="/club/getClubList"> <i
												class="glyphicon glyphicon-home"></i> 내 모임
										</a></li>
										<li><a
											href="/myHome/updateProfile?userId=${user.userId }"> <i
												class="glyphicon glyphicon-user"></i> 프로필 수정
										</a></li>
										<li><a href="#" target="_blank"> <i
												class="glyphicon glyphicon-ok"></i> Tasks
										</a></li>
										<li><a href="#"> <i class="glyphicon glyphicon-flag"></i>
												Help
										</a></li>
									</ul>
								</div>
								<!-- END MENU -->
							</div>
						</div>
						<div class="col-md-9"></div>
					</div>
				</div>

			<div class="section-Box">
				<div class="follow-section">
		<a href="/myHome/getYourHome?userId=user33" id="zz">유저33</a>
				    <br />
					<br />
					<c:set var="i" value="0"></c:set>
					<c:forEach var="list" items="${list}">
						<c:set var="i" value="${i + 1}"></c:set>
						아아 ${list.receiveId.nickName }
					</c:forEach>
					<c:set var="i" value="0"></c:set>
					<c:forEach var="list" items="${list}">
						<c:set var="i" value="${i + 1}"></c:set>

							<div class="single-comment">
								<form class="followForm">
									<div class="comment-author">

										프로필 사진 ${list.user.profileImage} <cite><a href="#">${list.user.nickName }</a></cite>
										<span class="says">says:</span>
									</div>
									<!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at
											7:58 pm</time>
										/ <a href="#" class="reply">Reply</a>
									</div>
									<!-- comment-meta -->
									<p>${list.receiveId.nickName}</p>
									<c:if test="${!empty feed.hashtag}">
										<br />${feed.hashtag}</c:if>
									<c:if test="${feed.checkHeart != 0}">
										★★★내가 좋아요 한 피드입니다.★★★ 나중에 하트로 변경
										</c:if>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
										<input type="button" class="btn_update" value="수정">
										<input type="button" class="btn_delete" value="삭제">
									</c:if>
									<input type="button" class="btn_getFeed" value="보기"> <input
										type="hidden" name="feedNo" value="${feed.feedNo}">

									<section class="row section">
										<div class="row">
											<c:if test="${feed.checkHeart == 0}">
												<div class="column two like" style="display: show;">
													좋아요</div>
												<div class="column two dislike" style="display: none;">
													시러요</div>
											</c:if>
											<c:if test="${feed.checkHeart != 0}">
												<div class="column two like" style="display: none;">
													좋아요</div>
												<div class="column two dislike" style="display: show;">
													시러요</div>
											</c:if>
											<div class="column two likeCount">${feed.heartCount}</div>

											<div class="column two comment">댓글수</div>

											<div class="column two commentCount">
												${feed.commentCount}</div>
											<div class="column four last">신고</div>
										</div>
									</section>
								</form>
							</div>

					
					</c:forEach>

				</div>
				<!-- single-comment -->

				<div class="comment-section">
					<div class="f">My Feed</div>
					<br />
					<c:set var="i" value="0"></c:set>
					<c:forEach var="feed" items="${feedList}">
						<c:set var="i" value="${i + 1}"></c:set>

						<c:if test="${fn:trim(feed.deleteCondition) eq '0'}">

							<div class="single-comment">
								<form class="feedForm">
									<div class="comment-author">

										프로필 사진 ${feed.user.profileImage} <cite><a href="#">${user.nickName }</a></cite>
										<span class="says">says:</span>
									</div>
									<!-- comment-author -->
									<div class="comment-meta">
										<time datetime="2013-03-23 19:58">March 23, 2013 at
											7:58 pm</time>
										/ <a href="#" class="reply">Reply</a>
									</div>
									<!-- comment-meta -->
									<p>${feed.content}</p>
									<c:if test="${!empty feed.hashtag}">
										<br />${feed.hashtag}</c:if>
									<c:if test="${feed.checkHeart != 0}">
										★★★내가 좋아요 한 피드입니다.★★★ 나중에 하트로 변경
										</c:if>
									<c:if test="${sessionScope.user.userId eq feed.user.userId}">
										<input type="button" class="btn_update" value="수정">
										<input type="button" class="btn_delete" value="삭제">
									</c:if>
									<input type="button" class="btn_getFeed" value="보기"> <input
										type="hidden" name="feedNo" value="${feed.feedNo}">

									<section class="row section">
										<div class="row">
											<c:if test="${feed.checkHeart == 0}">
												<div class="column two like" style="display: show;">
													좋아요</div>
												<div class="column two dislike" style="display: none;">
													시러요</div>
											</c:if>
											<c:if test="${feed.checkHeart != 0}">
												<div class="column two like" style="display: none;">
													좋아요</div>
												<div class="column two dislike" style="display: show;">
													시러요</div>
											</c:if>
											<div class="column two likeCount">${feed.heartCount}</div>

											<div class="column two comment">댓글수</div>

											<div class="column two commentCount">
												${feed.commentCount}</div>
											<div class="column four last">신고</div>
										</div>
									</section>
								</form>
							</div>

						</c:if>
					</c:forEach>

				</div>
				<!-- single-comment -->





			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

</body>

</html>